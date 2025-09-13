import torch
import sys, os, json, shutil
import numpy as np
from math import ceil, log2
import torch.nn.functional as F
from numpy.core.fromnumeric import take
from KANQuant import KANQuant as KAN

#---------KAN_LUT class---------
class KAN_LUT:
    def __init__(self, model_dir, checkpoint, config, input_layer, device):

        self.model_dir = model_dir
        self.firmware_dir = os.path.join(self.model_dir, "firmware")
        self.config = config
        self.checkpoint = checkpoint
        self.input_layer = input_layer
        self.device = device
        self.is_cuda = device == "cuda"

        #Initialize the KAN QAT model
        self.KAN = KAN(self.config, self.input_layer, self.device)

        #Load the state dict
        self.KAN.load_state_dict(self.checkpoint["model_state_dict"])

        #Print some basic info about the model
        print(f"Creating KAN LUT reprentation. Quantization: {self.config['layers_bitwidth']}, Remaining sparsity: {self.checkpoint['remaining_fraction']}, Accuracy: {self.checkpoint['val_accuracy']}")

        #Put in evaluation mode
        self.KAN.eval()

        #Search for the saved truth tables, if already exists just load them
        truth_tables_path = os.path.join(self.model_dir, "truth_tables.json")
        if os.path.exists(truth_tables_path):
            with open(truth_tables_path, "r") as f:
                self.truth_tables = json.load(f)
        else:
            with torch.inference_mode():
                self.truth_tables = self._generate_truth_tables()
                with open(truth_tables_path, "w") as f:
                    json.dump(self.truth_tables, f)

    def _generate_truth_tables(self):
        truth_tables = {}

        #Generate a random input tensor to track the LUT values
        for i, layer in enumerate(self.KAN.layers):
            in_features = layer.in_features
            out_features = layer.out_features
            in_bit_width = layer.in_precision
            out_bit_width = layer.out_precision
            input_state_space = None

            #First layer is treated differently
            if i == 0:
                input_state_space = self.input_layer.get_state_space(self.is_cuda)
            #If not first layer, need to get the state space for the previous layer
            else:
                previous_layer = self.KAN.layers[i - 1]
                input_state_space = previous_layer.output_quantizer.get_state_space(self.is_cuda)

            #Generate the truth table for each connection
            for j in range(in_features):
                for k in range(out_features):
                    truth_tables[f"{i}_{j}_{k}"] = self._get_truth_table(input_state_space, i, j, k)

    
        return truth_tables

    def _get_truth_table(self, input_state_space, layer_index, in_node, out_node):
        """
        Compute the truth table (pre-summation) for the single connection
        (in_node -> out_node) evaluated over input_state_space (1D tensor of values).
        """
        layer = self.KAN.layers[layer_index].to(self.device) 

        truth_table = {}
        truth_table['acive'] = int(layer.spline_selector[out_node, in_node].item()) #Where this LUT is pruned or not
        scale, bits = layer.output_quantizer.get_scale_factor_bits(self.is_cuda)
        
        #Create a tensor of the input state space for each input node
        x = input_state_space.unsqueeze(0).repeat(layer.in_features, 1).T.to(self.device)

        #Calculate the lookup table values
        base_output = layer.base_activation(x)[: , in_node] * layer.base_weight[out_node, in_node]
        spline_output = F.linear(layer.b_splines(x)[:, in_node, :], layer.scaled_spline_weight[out_node, in_node, :])
        
        #Store the LUT outputs as integers
        lut_output = ((layer.spline_selector[out_node, in_node] * (base_output + spline_output))/scale).round().to(torch.int).tolist()   
        truth_table['values_int'] = lut_output

        return truth_table

    def _inferece_sample(self, sample):
        """
        Evaluate the KAN for a single sample
        """

        running_accumulator = None
    
        #Loop over each layer
        for i in range(len(self.KAN.layers)):
            in_features = self.KAN.layers[i].in_features
            out_features = self.KAN.layers[i].out_features
            input_bit_width = self.KAN.layers[i].in_precision

            layer_state_space = self.KAN.layers[i].output_quantizer.get_bin_state_space(self.is_cuda).to(self.device)

            # Accumulate in integer domain (pre-sum quantization already baked in LUT)
            acc = torch.zeros(out_features, dtype=torch.int64, device=self.device)

            min_state = int(layer_state_space.min())
            max_state = int(layer_state_space.max())

            #Loop over each connection in the layer
            for out_index in range(out_features):

                #For each out feature there is an accumulator
                acc_out_node = 0

                for in_index in range(in_features):
                    truth_table = self.truth_tables[f"{i}_{in_index}_{out_index}"]
                    if truth_table["acive"] == 0: continue # pruned connection
                    lookup_index = sample[in_index] if i == 0 else int(running_accumulator[in_index] + 2**(input_bit_width - 1))
                    acc_out_node += truth_table['values_int'][lookup_index]

                
                # clamp the post-sum (matches layer.output_quantizer after the sum)
                if acc_out_node < min_state: acc_out_node = min_state
                if acc_out_node > max_state: acc_out_node = max_state

                acc[out_index] = acc_out_node      

            running_accumulator = acc     
        
        return running_accumulator

    @torch.inference_mode()
    def predict(self, x: torch.Tensor) -> torch.Tensor:
        """
        Evaluate the KAN using the precomputed per-connection LUTs.
        This is a simulation of what exactly happens on the hardware

        Args:
            x: Tensor of shape (batch, in_features_of_first_layer) with *float* values.

        Returns:
            Tensor of shape (batch, out_features_of_last_layer), quantized to the
            last layer's output state space.
        """
        assert x.dim() == 2, "predict expects a 2D tensor: (batch, in_features)"

        #Pre-process the input, quantize and round to int and use it for direct index lookup
        x = self.KAN.input_layer(x)
        input_scale, bits = self.KAN.input_layer.get_scale_factor_bits(self.is_cuda)
        x = (x/input_scale).round().to(torch.int)

        #Convert the values to unsigned int
        x = (x + (2**(bits - 1))).to(torch.int)

        #Loop over each sample in the batch
        outs_int = []
        for sample_index in range(x.shape[0]):
            outs_int.append(self._inferece_sample((x[sample_index])))
        outs_int = torch.stack(outs_int, dim=0)

        # Dequantize to floats on last layer's scale
        last_scale, _ = self.KAN.layers[-1].output_quantizer.get_scale_factor_bits(self.is_cuda)
        return outs_int.to(torch.float32) * last_scale

    @torch.inference_mode()
    def quick_match_check(self, n: int = 1, atol: float = 1e-4) -> float:
        """Compare self.predict vs self.KAN on a few samples; returns max |error|."""
        self.KAN.to(self.device).eval()  # ensure model is on the same device as x
        in_features = self.KAN.layers[0].in_features
        x = torch.randn(n, in_features, device=self.device, dtype=torch.float32)
        y_ref = self.KAN(x)
        y_lut = self.predict(x)
        max_err = (y_ref - y_lut).abs().max().item()
        print(f"max|Δ|={max_err:.3e} -> {'OK' if max_err <= atol else 'MISMATCH'} (atol={atol})")
        return max_err

    #----------FIRMWARE IMPLEMENTATION----------
    def generate_firmware(self, adder_tree_depth=2):
        """
        Generate the firmware for the KAN LUT
        """

        print(f"Converting KAN model to hardware ...")

        #Remove the firmware directory if it exists, but ask for confirmation
        if os.path.exists(self.firmware_dir):
            confirm = input(f"The firmware directory {self.firmware_dir} already exists. Do you want to remove it? (y/n): ")
            if confirm == "y":
                shutil.rmtree(self.firmware_dir)
            else:
                return

        #Make the directories within model_dir
        os.makedirs(os.path.join(self.firmware_dir, "src"), exist_ok=True)
        os.makedirs(os.path.join(self.firmware_dir, "mem"), exist_ok=True)
        os.makedirs(os.path.join(self.firmware_dir, "vivado"), exist_ok=True)
        os.makedirs(os.path.join(self.firmware_dir, "testbench"), exist_ok=True)

        #Copy the top file to src
        shutil.copy(os.path.join(os.path.dirname(__file__), "templates", "src", "top.vhd"), os.path.join(self.firmware_dir, "src", "top.vhd"))

        #Write the KAN core HLS file
        self.write_kan_core(adder_tree_depth=adder_tree_depth)
        self.write_pkg_kan()
        self.write_pkg_lut()
        self.write_lut_vhd()
        self.write_mem_files()
        self.write_build_tcl()
        pass

    def write_kan_core(self, max_per_line=16, adder_tree_depth=2):
        """
        Write the KAN core HLS file
        """

        # ---------- Build SIGNAL_DECLS ----------
        #Helper function to emit a list of signals
        def emit(names, typ="lut_output_t"):
            lines=[]; buf=[]
            for n in names:
                buf.append(n)
                if len(buf)==max_per_line:
                    lines.append(f"  signal {', '.join(buf)} : {typ};"); buf=[]
            if buf: lines.append(f"  signal {', '.join(buf)} : {typ};")
            return "\n".join(lines)

        sections=[]

        #Loop through the layers and pick up the signals that exist
        for i, layer in enumerate(self.KAN.layers):
            in_f, out_f = layer.in_features, layer.out_features
            acts=[f"act_{i}_{j}_{k}" for j in range(in_f) for k in range(out_f) if self.truth_tables[f"{i}_{j}_{k}"]["acive"] == 1]
            outs=[f"out{i}_{k}" for k in range(out_f)] if i != len(self.KAN.layers)-1 else []
            block=[f"-- Layer {i} ({in_f}->{out_f})"]
            if acts: block.append(emit(acts, f"lut_output_t_{i}"))
            if outs: block.append(emit(outs, f"lut_output_t_{i}"))
            block += [emit([f"sum_{i}_{k}"], f"sum_t_{i}_{k}") for k in range(out_f)]
            sections.append("\n".join(block))

        # ---------- Build LAYER_BLOCKS ----------
        num_layers = len(self.KAN.layers)
        layer_blocks = []

        for i, layer in enumerate(self.KAN.layers):
            in_f, out_f = layer.in_features, layer.out_features

            for k in range(out_f):
                blk = [f"-- LAYER {i}, ch {k}",
                    f"gen_l{i}c{k} : block",
                    "begin"]

                inst_idx, sum_terms = 0, []
                for j in range(in_f):
                    if self.truth_tables[f"{i}_{j}_{k}"]["acive"] == 0: 
                        continue
                    mem = f"lut_{i}_{j}_{k}.mem"
                    src = f"input({j})" if i == 0 else f"out{i-1}_{j}"
                    dst = f"act_{i}_{j}_{k}"
                    blk.append(
                        f"  i{inst_idx:02d} : entity work.LUT_{i} "
                        f'generic map (MEMFILE=>"{mem}") '
                        f"port map (clk, {src}, {dst});"
                    )
                    sum_terms.append(f"resize({dst}, SUM_WIDTH_{i}_{k})")
                    inst_idx += 1

                if sum_terms:
                    target = f"sum_{i}_{k}"
                    rhs = " + ".join(sum_terms)
                    blk.append(f"  {target} <= {rhs};")
                    blk.append(f"  output({k}) <= saturate({target}, {layer.out_precision});") if i == len(self.KAN.layers)-1 else blk.append(f"  out{i}_{k} <= saturate({target}, {layer.out_precision});")
                else:
                    blk.append(f"  output({k}) <= (others => '0');") if i == len(self.KAN.layers)-1 else blk.append(f"  out{i}_{k} <= (others => '0');")
                blk.append("end block;")

                layer_blocks.append("\n  ".join(blk))
        
        #Generate the VHDL code
        SIGNAL_DECLS = "\n\n".join(sections) if sections else "-- (no signals)"
        LAYER_BLOCKS = "\n\n  ".join(layer_blocks) if layer_blocks else "-- (no layers)"

        with open(os.path.join(os.path.dirname(__file__), "templates", "src", "KAN.vhd"), "r") as tf:
            tpl = tf.read()
        vhdl_text = tpl.replace("{{SIGNAL_DECLS}}", SIGNAL_DECLS)
        vhdl_text = vhdl_text.replace("{{LAYER_BLOCKS}}", LAYER_BLOCKS)

        #Write the VHDL code to the file
        out_vhd = os.path.join(self.firmware_dir, "src", "KAN.vhd")
        os.makedirs(os.path.dirname(out_vhd), exist_ok=True)
        with open(out_vhd, "w") as f:
            f.write(vhdl_text)
    
    def write_pkg_kan(self):

        with open(os.path.join(os.path.dirname(__file__), "templates", "src", "PkgKAN.vhd"), "r") as tf:
            tpl = tf.read()

        #Replace the placeholders with the actual values
        vhdl_text = tpl.replace("{{N_INPUT}}", str(self.config["layers"][0]))
        vhdl_text = vhdl_text.replace("{{N_OUTPUT}}", str(self.config["layers"][-1]))

        #Get the quantization precision for the input layer and output layer
        vhdl_text = vhdl_text.replace("{{INPUT_WIDTH}}", str(self.config["layers_bitwidth"][0]))
        vhdl_text = vhdl_text.replace("{{OUTPUT_WIDTH}}", str(self.config["layers_bitwidth"][-1]))

        #Generate the summation block
        summation_block = []
        for i, layer in enumerate(self.KAN.layers):
            for k in range(layer.out_features):
                active_lut = sum(
                    self.truth_tables[f"{i}_{j}_{k}"]["acive"] == 1
                    for j in range(layer.in_features)
                )
                width = layer.out_precision + ceil(log2(active_lut)) if active_lut > 0 else layer.out_precision
                summation_block += [
                    f"  constant SUM_WIDTH_{i}_{k}: positive := {width};",
                    f"  subtype sum_t_{i}_{k} is signed(SUM_WIDTH_{i}_{k}-1 downto 0);",
                ]

        vhdl_text = vhdl_text.replace("{{SUMMATION_BLOCK}}", "\n".join(summation_block))
        #Write the VHDL code to the file
        out_vhd = os.path.join(self.firmware_dir, "src", "PkgKAN.vhd")
        os.makedirs(os.path.dirname(out_vhd), exist_ok=True)
        with open(out_vhd, "w") as f:
            f.write(vhdl_text)

    def write_pkg_lut(self):

        tpl_path = os.path.join(os.path.dirname(__file__), "templates", "src", "PkgLUT.vhd")
        with open(tpl_path, "r") as tf:
            tpl = tf.read()

        blocks = []
        for i in range(0, len(self.KAN.layers)):
            layer = self.KAN.layers[i]
            blocks.append("\n".join([
                f"  -- Layer {i}",
                f"  constant LUT_SIZE_{i}        : integer := {1 << layer.in_precision};",
                f"  constant LUT_ADDR_WIDTH_{i}  : integer := {layer.in_precision};",
                f"  constant LUT_DATA_WIDTH_{i}  : integer := {layer.out_precision};",
                f"  subtype  lut_input_t_{i}  is signed(LUT_ADDR_WIDTH_{i}-1 downto 0);" if i !=0 else f"  subtype  lut_input_t_{i}  is unsigned(LUT_ADDR_WIDTH_{i}-1 downto 0);" ,
                f"  subtype  lut_output_t_{i} is signed(LUT_DATA_WIDTH_{i}-1 downto 0);",
            ]))

        vhdl_text = tpl.replace("{{LAYER_TYPES_BLOCK}}", "\n\n".join(blocks) or "  -- (no layers)")

        out_path = os.path.join(self.firmware_dir, "src", "PkgLUT.vhd")
        os.makedirs(os.path.dirname(out_path), exist_ok=True)
        with open(out_path, "w") as f:
            f.write(vhdl_text)

    def write_lut_vhd(self):

        #Open the template file
        with open(os.path.join(os.path.dirname(__file__), "templates", "src", "LUT.vhd"), "r") as tf:
            tpl = tf.read()
        
        #Loop through the layers and generate the VHDL code
        for i in range(0, len(self.KAN.layers)):

            #Deal with the index signal
            vhdl_text = tpl.replace("{{IDX_SIGNAL_DECLS}}", "" if i == 0 else f"signal idx : unsigned(LUT_ADDR_WIDTH_{i}-1 downto 0);")
            vhdl_text = vhdl_text.replace("{{IDX_ASSIGNMENT}}", "" if i == 0 else f"idx <= unsigned(d + to_signed(2**(LUT_ADDR_WIDTH_{i}-1), LUT_ADDR_WIDTH_{i}));")
            vhdl_text = vhdl_text.replace("{{IDX_SIGNAL}}", "d" if i == 0 else f"idx")

            #Deal with the other signals
            vhdl_text = vhdl_text.replace("{{LUT_LAYER_NAME}}", f"LUT_{i}")
            vhdl_text = vhdl_text.replace("{{LUT_ADDR_WIDTH}}", f"LUT_ADDR_WIDTH_{i}")
            vhdl_text = vhdl_text.replace("{{LUT_DATA_WIDTH}}", f"LUT_DATA_WIDTH_{i}")
            vhdl_text = vhdl_text.replace("{{LUT_SIZE}}", f"LUT_SIZE_{i}")
            vhdl_text = vhdl_text.replace("{{LUT_INPUT_TYPE}}", f"lut_input_t_{i}")
            vhdl_text = vhdl_text.replace("{{LUT_OUTPUT_TYPE}}", f"lut_output_t_{i}")

            #Write the VHDL code to the file
            out_path = os.path.join(self.firmware_dir, "src", f"LUT_{i}.vhd")
            os.makedirs(os.path.dirname(out_path), exist_ok=True)
            with open(out_path, "w") as f:
                f.write(vhdl_text)

    def write_mem_files(self):

        def int_to_hex_word(value: int, bits: int = 32) -> str:
            """Convert signed/unsigned int to hex word of given bit width."""
            mask = (1 << bits) - 1
            return f"{value & mask:0{bits // 4}X}"

        written = 0
        for i in range(0, len(self.KAN.layers)):
            layer = self.KAN.layers[i]
            for j in range(layer.in_features):
                for k in range(layer.out_features):
                    truth_table = self.truth_tables[f"{i}_{j}_{k}"]
                    if truth_table["acive"] == 0: continue
                    mem_path = os.path.join(self.firmware_dir, "mem", f"lut_{i}_{j}_{k}.mem")
                    with open(mem_path, "w") as f:
                        f.write("\n".join([int_to_hex_word(v, layer.out_precision) for v in truth_table['values_int']]))
                    written += 1

        # Small breadcrumb
        print(f"Wrote {written} LUT .mem file(s) to {self.firmware_dir}/mem/")

    def write_build_tcl(self):
        #Just copy the template file
        shutil.copy(os.path.join(os.path.dirname(__file__), "templates", "vivado", "build_full.tcl"), os.path.join(self.firmware_dir, "vivado", "build_full.tcl"))
        shutil.copy(os.path.join(os.path.dirname(__file__), "templates", "vivado", "build_ooc.tcl"), os.path.join(self.firmware_dir, "vivado", "build_ooc.tcl"))
        shutil.copy(os.path.join(os.path.dirname(__file__), "templates", "vivado", "build_combitorial.tcl"), os.path.join(self.firmware_dir, "vivado", "build_combitorial.tcl"))
    
    #------------------SIMULATION------------------
    def simulate_firmware(self, rtl_dir_rel: str = "./../src", top_name: str = "KAN", n_vectors: int = 2):
        sim_dir = os.path.join(self.model_dir, "firmware", "sim")
        os.makedirs(sim_dir, exist_ok=True)

        self._write_test_vectors(n_vectors,  os.path.join(sim_dir, "vectors_in.txt"), os.path.join(sim_dir, "vectors_out.txt"))
        self._write_tb()
        self._write_sim_tcl()

        print(f"[SIM] Emitted TB + vectors + TCL to: {sim_dir}")

    def _write_test_vectors(self, n_vectors: int, in_file: str, out_file: str):

        self.KAN.to(self.device).eval()
        in_features = self.KAN.layers[0].in_features

        # draw random float inputs, then quantize like predict()
        x = torch.randn(n_vectors, in_features, device=self.device, dtype=torch.float32)
        x_q = self.KAN.input_layer(x)

        input_scale, bits = self.KAN.input_layer.get_scale_factor_bits(self.is_cuda)
        x_q = (x_q / input_scale).round().to(torch.int)
        x_q = (x_q + (2**(bits - 1))).to(torch.int)  # to unsigned index domain

        # reference integer outputs via the internal integer evaluator
        outs = []
        for i in range(n_vectors):
            outs.append(self._inferece_sample(x_q[i]))
        outs = torch.stack(outs, dim=0).to(torch.int64)

        # Write as space-separated decimals, one vector per line
        with open(in_file, "w") as fi:
            for row in x_q.tolist():
                fi.write(" ".join(str(int(v)) for v in row) + "\n")

        with open(out_file, "w") as fo:
            for row in outs.tolist():
                fo.write(" ".join(str(int(v)) for v in row) + "\n")

        pass

    def _write_tb(self):
        shutil.copy(os.path.join(os.path.dirname(__file__), "templates", "sim", "tb_kan.vhd"), os.path.join(self.firmware_dir, "sim", "tb_kan.vhd"))
        shutil.copy(os.path.join(os.path.dirname(__file__), "templates", "sim", "tb_kan_latency.vhd"), os.path.join(self.firmware_dir, "sim", "tb_kan_latency.vhd"))
    
    def _write_sim_tcl(self):
        shutil.copy(os.path.join(os.path.dirname(__file__), "templates", "sim", "sim.tcl"), os.path.join(self.firmware_dir, "sim", "sim.tcl"))
        shutil.copy(os.path.join(os.path.dirname(__file__), "templates", "sim", "sim_latency.tcl"), os.path.join(self.firmware_dir, "sim", "sim_latency.tcl"))


