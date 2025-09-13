import torch
import torch.nn as nn
import torch.nn.functional as F
import math
from quant import QuantBrevitasActivation
from brevitas.nn import QuantIdentity
from brevitas.core.scaling import ParameterScaling
from brevitas.core.quant import QuantType
from typing import Optional, List

class KANLinear(torch.nn.Module):
    def __init__(
        self,
        in_features,
        in_precision,
        out_features,
        out_precision,
        grid_size=5,
        spline_order=3,
        scale_noise=0.1,
        scale_base=1.0,
        scale_spline=1.0,
        enable_standalone_scale_spline=True,
        base_activation=torch.nn.SiLU,
        grid_eps=0.02,
        grid_range=[-1, 1],
        device=None,
    ):
        super(KANLinear, self).__init__()
        self.in_features = in_features
        self.out_features = out_features
        self.grid_size = grid_size
        self.spline_order = spline_order
        self.in_precision = in_precision
        self.out_precision = out_precision
        self.grid_range = grid_range
        self.device = device

        h = (grid_range[1] - grid_range[0]) / grid_size
        grid = (
            (
                torch.arange(-spline_order, grid_size + spline_order + 1) * h
                + grid_range[0]
            )
            .expand(in_features, -1)
            .contiguous()
        )
        self.register_buffer("grid", grid)

        self.base_weight = torch.nn.Parameter(torch.Tensor(out_features, in_features))
        self.spline_weight = torch.nn.Parameter(
            torch.Tensor(out_features, in_features, grid_size + spline_order)
        )
        if enable_standalone_scale_spline:
            self.spline_scaler = torch.nn.Parameter(
                torch.Tensor(out_features, in_features)
            )

        self.scale_noise = scale_noise
        self.scale_base = scale_base
        self.scale_spline = scale_spline
        self.enable_standalone_scale_spline = enable_standalone_scale_spline
        self.base_activation = base_activation()
        self.grid_eps = grid_eps

        # Spline selector for pruning (multiplied by spline weights to eliminate pruned splines)
        self.spline_selector = torch.nn.Parameter(torch.ones(out_features, in_features))
        self.spline_selector.requires_grad = False

        self.reset_parameters()

        #Output Quantizer
        self.output_quantizer = QuantBrevitasActivation(
                                QuantIdentity(bit_width=self.out_precision,
                                              quant_type=QuantType.INT,
                                              return_quant_tensor=False,
                                              min_val=self.grid_range[0],
                                              max_val=self.grid_range[1],
                                              act_scaling_impl=ParameterScaling(1.33)), 
                                              pre_transforms=[])

    def reset_parameters(self):
        torch.nn.init.kaiming_uniform_(self.base_weight, a=math.sqrt(5) * self.scale_base)
        with torch.no_grad():
            noise = (
                (
                    torch.rand(self.grid_size + 1, self.in_features, self.out_features)
                    - 1 / 2
                )
                * self.scale_noise
                / self.grid_size
            )
            self.spline_weight.data.copy_(
                (self.scale_spline if not self.enable_standalone_scale_spline else 1.0)
                * self.curve2coeff(
                    self.grid.T[self.spline_order : -self.spline_order],
                    noise,
                )
            )
            if self.enable_standalone_scale_spline:
                torch.nn.init.kaiming_uniform_(self.spline_scaler, a=math.sqrt(5) * self.scale_spline)

    def b_splines(self, x: torch.Tensor):
        assert x.dim() == 2 and x.size(1) == self.in_features
        grid: torch.Tensor = self.grid
        x = x.unsqueeze(-1)
        bases = ((x >= grid[:, :-1]) & (x < grid[:, 1:])).to(x.dtype)
        for k in range(1, self.spline_order + 1):
            bases = (
                (x - grid[:, : -(k + 1)])
                / (grid[:, k:-1] - grid[:, : -(k + 1)])
                * bases[:, :, :-1]
            ) + (
                (grid[:, k + 1 :] - x)
                / (grid[:, k + 1 :] - grid[:, 1:(-k)])
                * bases[:, :, 1:]
            )
        assert bases.size() == (x.size(0), self.in_features, self.grid_size + self.spline_order)
        return bases.contiguous()

    def curve2coeff(self, x: torch.Tensor, y: torch.Tensor):
        assert x.dim() == 2 and x.size(1) == self.in_features
        assert y.size() == (x.size(0), self.in_features, self.out_features)
        A = self.b_splines(x).transpose(0, 1)
        B = y.transpose(0, 1)
        solution = torch.linalg.lstsq(A, B).solution
        result = solution.permute(2, 0, 1)
        assert result.size() == (self.out_features, self.in_features, self.grid_size + self.spline_order)
        return result.contiguous()

    @property
    def scaled_spline_weight(self):
        return self.spline_weight * (
            self.spline_scaler.unsqueeze(-1)
            if self.enable_standalone_scale_spline
            else 1.0
        )

    def forward(self, x: torch.Tensor):
        assert x.size(-1) == self.in_features
        original_shape = x.shape
        x = x.reshape(-1, self.in_features)

        base_output = self.base_activation(x).unsqueeze(2) * self.base_weight.T.unsqueeze(0)
        spline_output = (
            base_output + torch.sum(
                self.b_splines(x).unsqueeze(2) * self.scaled_spline_weight.transpose(0, 1).unsqueeze(0), 
                dim=-1
            )
        ).transpose(-1, -2)

        spline_output = self.spline_selector.unsqueeze(0) * spline_output
        output = self.output_quantizer(spline_output) 
        output = torch.sum(output, dim=-1)
        output = self.output_quantizer(output) 
        return output.reshape(*original_shape[:-1], self.out_features)

    @torch.no_grad()
    def update_grid(self, x: torch.Tensor, margin=0.01):
        assert x.dim() == 2 and x.size(1) == self.in_features
        batch = x.size(0)

        splines = self.b_splines(x).permute(1, 0, 2)
        orig_coeff = self.scaled_spline_weight.permute(1, 2, 0)
        unreduced_spline_output = torch.bmm(splines, orig_coeff).permute(1, 0, 2)

        x_sorted = torch.sort(x, dim=0)[0]
        grid_adaptive = x_sorted[
            torch.linspace(0, batch - 1, self.grid_size + 1, dtype=torch.int64, device=x.device)
        ]

        uniform_step = (x_sorted[-1] - x_sorted[0] + 2 * margin) / self.grid_size
        grid_uniform = (
            torch.arange(self.grid_size + 1, dtype=torch.float32, device=x.device).unsqueeze(1)
            * uniform_step
            + x_sorted[0]
            - margin
        )

        grid = self.grid_eps * grid_uniform + (1 - self.grid_eps) * grid_adaptive
        grid = torch.concatenate(
            [
                grid[:1] - uniform_step * torch.arange(self.spline_order, 0, -1, device=x.device).unsqueeze(1),
                grid,
                grid[-1:] + uniform_step * torch.arange(1, self.spline_order + 1, device=x.device).unsqueeze(1),
            ],
            dim=0,
        )

        self.grid.copy_(grid.T)
        self.spline_weight.data.copy_(self.curve2coeff(x, unreduced_spline_output))

    def regularization_loss(self, regularize_activation=1.0, regularize_entropy=1.0):
        l1_fake = self.spline_weight.abs().mean(-1)
        regularization_loss_activation = l1_fake.sum()
        p = l1_fake / regularization_loss_activation
        regularization_loss_entropy = -torch.sum(p * p.log())
        return (
            regularize_activation * regularization_loss_activation
            + regularize_entropy * regularization_loss_entropy
        )
    
    @torch.no_grad()
    def prune_below_threshold(self, threshold: float = 0.01, next_layer_sparsity_matrix: Optional[torch.Tensor] = None, input_state_space: Optional[torch.Tensor] = None) -> None:
        x = input_state_space.unsqueeze(0).repeat(self.in_features, 1).T.to(self.device)
        spline_bases = self.b_splines(x)
        norms = torch.zeros((self.out_features, self.in_features), device=self.base_weight.device)
        for out_idx in range(self.out_features):
            for in_idx in range(self.in_features):
                spline_output = F.linear(
                    spline_bases[:, in_idx, :], 
                    self.scaled_spline_weight[out_idx, in_idx, :]
                )
                norms[out_idx, in_idx] = self.spline_selector[out_idx, in_idx] * torch.norm(spline_output)

        self.spline_selector *= (norms > threshold).float()

        if next_layer_sparsity_matrix is not None:
            zero_cols = (next_layer_sparsity_matrix == 0).all(dim=0)
            self.spline_selector[zero_cols, :] = 0

    # ------------------- NEW METHOD -------------------
    @torch.no_grad()
    def prune_top_n(self, n: int, next_layer_sparsity_matrix: Optional[torch.Tensor] = None, input_state_space: Optional[torch.Tensor] = None) -> None:
        """
        Prunes the layer by keeping only the top 'n' connections for each output neuron.
        The importance of a connection is measured by the L2 norm of its spline function
        evaluated over the input_state_space.

        Args:
            n (int): The number of incoming connections to keep for each output neuron.
            next_layer_sparsity_matrix (Optional[torch.Tensor]): The spline_selector from the
                                                                 next layer, used for backward pruning.
            input_state_space (Optional[torch.Tensor]): A tensor representing the activation
                                                        space of the previous layer's outputs.
        """
        if input_state_space is None:
            raise ValueError("`input_state_space` is required for top-n pruning.")
            
        x = input_state_space.unsqueeze(0).repeat(self.in_features, 1).T.to(self.device)
        spline_bases = self.b_splines(x)

        # Calculate importance score (L2 norm) for each connection (out_features, in_features)
        norms = torch.zeros((self.out_features, self.in_features), device=self.base_weight.device)
        for out_idx in range(self.out_features):
            for in_idx in range(self.in_features):
                spline_output = F.linear(
                    spline_bases[:, in_idx, :], 
                    self.scaled_spline_weight[out_idx, in_idx, :]
                )
                norms[out_idx, in_idx] = torch.norm(spline_output)

        # Create a new mask initialized to zeros
        new_mask = torch.zeros_like(self.spline_selector)

        # For each output channel, find the top n connections and set them to 1 in the new mask
        n_to_keep = min(n, self.in_features) # Cannot keep more connections than available
        if n_to_keep > 0:
            # Get the indices of the top 'n_to_keep' connections for each output neuron
            top_n_indices = torch.topk(norms, k=n_to_keep, dim=1).indices
            
            # Use scatter to efficiently create the mask
            # For each row, it places a 1 at the column indices specified by top_n_indices
            new_mask.scatter_(1, top_n_indices, 1)

        # Update the layer's spline selector with the new mask
        self.spline_selector.data = new_mask

        # --- Backward Pruning ---
        # If an output neuron of this layer is not used by any active neuron in the next layer,
        # prune that output neuron entirely.
        if next_layer_sparsity_matrix is not None:
            # Find which output neurons from this layer have no connections to the next layer
            zero_cols = (next_layer_sparsity_matrix == 0).all(dim=0)
            # Prune all incoming connections to these unused output neurons
            self.spline_selector.data[zero_cols, :] = 0


class KANQuant(torch.nn.Module):
    def __init__(self, config, input_layer, device):
        super(KANQuant, self).__init__()

        self.config = config
        self.input_layer = input_layer
        self.device = device
        self.is_cuda = device == "cuda"

        self.layers = torch.nn.ModuleList()
        for in_features, in_precision, out_features, out_precision in zip(config["layers"], config["layers_bitwidth"], config["layers"][1:], config["layers_bitwidth"][1:]):
            self.layers.append(
                KANLinear(
                    in_features,
                    in_precision,
                    out_features,
                    out_precision,
                    device=device,
                    grid_size=config["grid_size"],
                    grid_range=config["grid_range"],
                    grid_eps=config["grid_eps"],
                    spline_order=config["spline_order"],
                    base_activation=eval(config["base_activation"]),
                    scale_noise=0.1,
                    scale_base=1.0,
                    scale_spline=1.0
                )
            )

    def forward(self, x: torch.Tensor):
        x = self.input_layer(x)
        for layer in self.layers:
            x = layer(x)
        return x

    @torch.no_grad()
    def prune_below_threshold(self, threshold: float = 0.01, epoch: int = 0, target_epoch: int = 20, warmup_epochs: int = 3) -> float:
        total_nodes = 0
        total_remaining = 0

        t = max(epoch - warmup_epochs, 0)
        denom = max(target_epoch - warmup_epochs, 1)
        k = math.log(20.0) / denom
        scale = 1.0 - math.exp(-k * t)
        layer_threshold = min(threshold * scale, threshold)

        with torch.no_grad():
            for i, layer in enumerate(self.layers):
                input_state_space = None
                if i == 0: input_state_space = self.input_layer.get_state_space(self.is_cuda).to(self.device)
                else: input_state_space = self.layers[i - 1].output_quantizer.get_state_space(self.is_cuda).to(self.device)
                
                next_layer_sparsity = (
                    self.layers[i + 1].spline_selector if i < len(self.layers) - 1 else None
                )
                layer.prune_below_threshold(layer_threshold, next_layer_sparsity, input_state_space)
                total_nodes += layer.spline_selector.numel()
                total_remaining += layer.spline_selector.sum()

        return total_remaining / total_nodes

    # ------------------- NEW METHOD -------------------
    @torch.no_grad()
    def prune_connections_by_rank(self, n_per_layer: List[int]) -> float:
        """
        Prunes the entire KAN model after a warm-up period. For each layer, it keeps
        only the top 'n' connections for each output neuron, where 'n' is specified
        in the `n_per_layer` list.

        Args:
            n_per_layer (List[int]): A list containing the number of connections to keep
                                     for each layer. The length of the list must equal
                                     the number of KANLinear layers in the model.
                                     Example: [10, 5] for a 2-layer KAN.

        Returns:
            float: The fraction of connections remaining in the model after pruning.
        """
        if len(n_per_layer) != len(self.layers):
            raise ValueError(
                f"The length of n_per_layer ({len(n_per_layer)}) must match the "
                f"number of KAN layers ({len(self.layers)})."
            )

        total_connections = 0
        remaining_connections = 0

        with torch.no_grad():
            # Iterate backwards to handle backward pruning correctly in one pass
            for i in range(len(self.layers) - 1, -1, -1):
                layer = self.layers[i]
                n_to_keep = n_per_layer[i]

                # Determine the input state space for the current layer
                if i == 0:
                    input_state_space = self.input_layer.get_state_space(self.is_cuda).to(self.device)
                else:
                    input_state_space = self.layers[i - 1].output_quantizer.get_state_space(self.is_cuda).to(self.device)

                # Get the next layer's sparsity matrix (which may have been pruned in a previous step of this loop)
                next_layer_sparsity = (
                    self.layers[i + 1].spline_selector if i < len(self.layers) - 1 else None
                )
                
                # Perform the top-n pruning on the current layer
                layer.prune_top_n(
                    n=n_to_keep, 
                    next_layer_sparsity_matrix=next_layer_sparsity, 
                    input_state_space=input_state_space
                )
            
            # Calculate final sparsity after all layers are pruned
            for layer in self.layers:
                total_connections += layer.spline_selector.numel()
                remaining_connections += layer.spline_selector.sum()

        return remaining_connections / total_connections if total_connections > 0 else 1.0