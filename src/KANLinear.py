import torch
import torch.nn.functional as F
import math

def make_quantize(tp, fp, quantize_clip):

    class Quantize(torch.autograd.Function):

        @staticmethod
        def forward(ctx, input):

            input = torch.floor(input * (2 ** fp))

            if quantize_clip:

                res = torch.clamp(input, -1 * (2 ** (tp - 1)), (2 ** (tp - 1)) - 1)

            else:

                range_size = 2 ** tp

                wrapped_unsigned_val = torch.fmod(torch.fmod(input + range_size / 2, range_size) + range_size, range_size)

                res = (wrapped_unsigned_val - range_size / 2)
        
            return res / (2 ** fp)

        @staticmethod
        def backward(ctx, grad_output):
            return grad_output

    return Quantize

class Quantizer(torch.nn.Module):
    def __init__(self, tp=8, fp=4, quantize_clip=False):
        super(Quantizer, self).__init__()
        self.tp = tp
        self.fp = fp
        self.quantize = make_quantize(tp, fp, quantize_clip)
        self.clipping_loss = 0.0
        self.num_clipped = 0.0
        self.num_total = 0.0
        self.quantize_clip = quantize_clip

    def forward(self, x):

        # old = x

        # Calculate clipping loss
        int_bits = self.tp - self.fp
        max_val = 2 ** (int_bits - 1) - 1
        min_val = -2 ** (int_bits - 1)

        self.num_clipped += torch.sum(x > max_val) + torch.sum(x < min_val)
        self.num_total += x.numel()

        if not self.quantize_clip:

            # Wrap around quantization

            above_max = torch.maximum(x - max_val, torch.zeros_like(x) - 0.5 / (2 ** self.fp)) * (2 ** self.fp)
            below_min = torch.maximum(min_val - x, torch.zeros_like(x) - 0.5 / (2 ** self.fp)) * (2 ** self.fp)

            outside_range = torch.maximum(above_max, below_min)

            self.clipping_loss += torch.nn.functional.relu(outside_range + 0.5).mean(-1).sum()

        x = self.quantize.apply(x)

        # if not self.training:
        #     print("Quantizer: ", old, "->", x)

        return x


class KANLinear(torch.nn.Module):
    def __init__(
        self,
        in_features,
        out_features,
        grid_size=5,
        spline_order=3,
        scale_noise=0.1,
        scale_base=1.0,
        scale_spline=1.0,
        enable_standalone_scale_spline=True,
        base_activation=torch.nn.SiLU,
        grid_eps=0.02,
        grid_range=[-1, 1],
        quantize=False,
        tp=16,
        fp=6,
        lut_res=256,
        quantize_clip=False,
    ):
        super(KANLinear, self).__init__()
        self.in_features = in_features
        self.out_features = out_features
        self.grid_size = grid_size
        self.spline_order = spline_order

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
        
        # Multiplied by spline weights to eliminate pruned splines
        self.spline_selector = torch.nn.Parameter(torch.ones(out_features, in_features))
        self.spline_selector.requires_grad = False

        self.scale_noise = scale_noise
        self.scale_base = scale_base
        self.scale_spline = scale_spline
        self.enable_standalone_scale_spline = enable_standalone_scale_spline
        self.base_activation = base_activation()
        self.grid_eps = grid_eps

        self.reset_parameters()

        self.quantize = quantize

        lut_tp = int(math.log2(lut_res))
        lut_fp = lut_tp - int(math.log2(grid_range[1] - grid_range[0]))


        print("TP: ", tp, "FP: ", fp)
        print("LUT TP: ", lut_tp, "LUT FP: ", lut_fp)

        assert lut_fp == fp, "FP mismatch"

        self.lut_inp_quantizer = Quantizer(tp=lut_tp, fp=lut_fp, quantize_clip=quantize_clip)
        self.lut_out_quantizer = Quantizer(tp=tp, fp=fp, quantize_clip=quantize_clip)

        self.verbose = False

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
                # torch.nn.init.constant_(self.spline_scaler, self.scale_spline)
                torch.nn.init.kaiming_uniform_(self.spline_scaler, a=math.sqrt(5) * self.scale_spline)

    def b_splines(self, x: torch.Tensor):
        """
        Compute the B-spline bases for the given input tensor.

        Args:
            x (torch.Tensor): Input tensor of shape (batch_size, in_features).

        Returns:
            torch.Tensor: B-spline bases tensor of shape (batch_size, in_features, grid_size + spline_order).
        """
        assert x.dim() == 2 and x.size(1) == self.in_features

        grid: torch.Tensor = (
            self.grid
        )  # (in_features, grid_size + 2 * spline_order + 1)
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

        assert bases.size() == (
            x.size(0),
            self.in_features,
            self.grid_size + self.spline_order,
        )
        return bases.contiguous()

    def curve2coeff(self, x: torch.Tensor, y: torch.Tensor):
        """
        Compute the coefficients of the curve that interpolates the given points.

        Args:
            x (torch.Tensor): Input tensor of shape (batch_size, in_features).
            y (torch.Tensor): Output tensor of shape (batch_size, in_features, out_features).

        Returns:
            torch.Tensor: Coefficients tensor of shape (out_features, in_features, grid_size + spline_order).
        """
        assert x.dim() == 2 and x.size(1) == self.in_features
        assert y.size() == (x.size(0), self.in_features, self.out_features)

        A = self.b_splines(x).transpose(
            0, 1
        )  # (in_features, batch_size, grid_size + spline_order)
        B = y.transpose(0, 1)  # (in_features, batch_size, out_features)
        solution = torch.linalg.lstsq(
            A, B
        ).solution  # (in_features, grid_size + spline_order, out_features)
        result = solution.permute(
            2, 0, 1
        )  # (out_features, in_features, grid_size + spline_order)

        assert result.size() == (
            self.out_features,
            self.in_features,
            self.grid_size + self.spline_order,
        )
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

        if self.quantize:
            x = self.lut_inp_quantizer(x)
        
        # print("Base activation: ", self.base_activation(x).shape)
        # print("Base weight: ", self.base_weight.shape)
        
        base_output = self.base_activation(x).unsqueeze(2) * self.base_weight.T.unsqueeze(0)

        # print("Base output shape: ", base_output.shape)

        # # Get spline basis values for each input
        # spline_bases = self.b_splines(x)  # (batch, in_features, grid_size + spline_order)
        
        # # Initialize output tensor for spline contribution
        # spline_output = self.lut_out_quantizer(base_output)

        # # For each input->output edge, calculate spline value and accumulate
        # for out_idx in range(self.out_features):
        #     for in_idx in range(self.in_features):
        #         # Get spline coefficients for this edge
        #         edge_coeffs = self.scaled_spline_weight[out_idx, in_idx]  # (grid_size + spline_order)
        #         # Calculate spline value for this edge
        #         edge_splines = self.lut_out_quantizer(torch.matmul(spline_bases[:, in_idx], edge_coeffs))  # (batch)
        #         # Add to corresponding output node
        #         spline_output[:, out_idx] = self.lut_out_quantizer(edge_splines +)
        #         if self.verbose:
        #             print(f"Edge {in_idx} -> {out_idx} spline value: {edge_splines}")

        # print("Spline selector shape: ", self.spline_selector.shape)
        # print("Scaled spline weight shape: ", self.scaled_spline_weight.shape)
        # print("b_splines(x).shape: ", self.b_splines(x).shape)
        # print("b_splines(x).view(x.size(0), -1).shape: ", self.b_splines(x).view(x.size(0), -1).shape)
        # print("scaled_spline_weight.view(self.out_features, -1).shape: ", self.scaled_spline_weight.view(self.out_features, -1).shape)

        # print("Scaled spline weight shape: ", self.scaled_spline_weight.shape)
        # print("Scaled spline weight transpose shape: ", self.scaled_spline_weight.transpose(0, 1).unsqueeze(0).shape)
        # print("b_splines(x).unsqueeze(1).shape: ", self.b_splines(x).unsqueeze(2).shape)

        spline_output = (base_output + torch.sum(self.b_splines(x).unsqueeze(2) * self.scaled_spline_weight.transpose(0, 1).unsqueeze(0), dim=-1)).transpose(-1, -2)

        # print("Spline output shape: ", spline_output.shape)

        # print("Spline selector shape: ", self.spline_selector.shape)
        # print("Spline selector unsqueeze shape: ", self.spline_selector.unsqueeze(0).shape)
        # print("Spline output shape: ", spline_output.shape)

        spline_output = self.spline_selector.unsqueeze(0) * spline_output

        if self.quantize:
            spline_output = self.lut_out_quantizer(spline_output)
        
        # if not self.training:
        #     print("Spline outputs: ", spline_output)
        
        output = torch.sum(spline_output, dim=-1)

        if self.quantize:
            output = self.lut_out_quantizer(output)

        output = output.reshape(*original_shape[:-1], self.out_features)
        return output
    
    def prune_below_threshold(self, threshold=0.01, next_layer_sparsity_matrix=None):

        # Get L2 norm of each spline between input and output nodes

        grid_range = [self.grid[0, 0].item(), self.grid[0, -1].item()]
        array = torch.linspace(grid_range[0], grid_range[1], 1024, device=self.base_weight.device)
        stacked_array = array.unsqueeze(1).expand(-1, self.in_features)
        x = stacked_array.float()

        spline_bases = self.b_splines(x)
        
        norms = torch.zeros((self.out_features, self.in_features), device=self.base_weight.device)
        for out_idx in range(self.out_features):
            for in_idx in range(self.in_features):
                spline_output = F.linear(spline_bases[:, in_idx, :], 
                                      self.scaled_spline_weight[out_idx, in_idx, :])
                norms[out_idx, in_idx] = self.spline_selector[out_idx, in_idx] * torch.norm(spline_output)

        #########################################################

        prior_fraction = self.spline_selector.sum() / self.spline_selector.numel() * 100

        self.spline_selector *= (norms > threshold).float()
        if next_layer_sparsity_matrix is not None:
            # Find columns that are all zeros (no connections to next layer)
            zero_cols = (next_layer_sparsity_matrix == 0).all(dim=0)
            self.spline_selector[zero_cols, :] = 0


        new_fraction = self.spline_selector.sum() / self.spline_selector.numel() * 100
        print(f"Pruned {prior_fraction - new_fraction:.2f}% splines, overall remaining {new_fraction:.2f}%")

        # print("Spline selector after pruning:", self.spline_selector)
        

    @torch.no_grad()
    def update_grid(self, x: torch.Tensor, margin=0.01):
        assert x.dim() == 2 and x.size(1) == self.in_features
        batch = x.size(0)

        splines = self.b_splines(x)  # (batch, in, coeff)
        splines = splines.permute(1, 0, 2)  # (in, batch, coeff)
        orig_coeff = self.scaled_spline_weight  # (out, in, coeff)
        orig_coeff = orig_coeff.permute(1, 2, 0)  # (in, coeff, out)
        unreduced_spline_output = torch.bmm(splines, orig_coeff)  # (in, batch, out)
        unreduced_spline_output = unreduced_spline_output.permute(
            1, 0, 2
        )  # (batch, in, out)

        # sort each channel individually to collect data distribution
        x_sorted = torch.sort(x, dim=0)[0]
        grid_adaptive = x_sorted[
            torch.linspace(
                0, batch - 1, self.grid_size + 1, dtype=torch.int64, device=x.device
            )
        ]

        uniform_step = (x_sorted[-1] - x_sorted[0] + 2 * margin) / self.grid_size
        grid_uniform = (
            torch.arange(
                self.grid_size + 1, dtype=torch.float32, device=x.device
            ).unsqueeze(1)
            * uniform_step
            + x_sorted[0]
            - margin
        )

        grid = self.grid_eps * grid_uniform + (1 - self.grid_eps) * grid_adaptive
        grid = torch.concatenate(
            [
                grid[:1]
                - uniform_step
                * torch.arange(self.spline_order, 0, -1, device=x.device).unsqueeze(1),
                grid,
                grid[-1:]
                + uniform_step
                * torch.arange(1, self.spline_order + 1, device=x.device).unsqueeze(1),
            ],
            dim=0,
        )

        self.grid.copy_(grid.T)
        self.spline_weight.data.copy_(self.curve2coeff(x, unreduced_spline_output))

    def regularization_loss(self, regularize_activation=1.0, regularize_entropy=1.0, regularize_clipping=0.1):
        """
        Compute the regularization loss.

        This is a dumb simulation of the original L1 regularization as stated in the
        paper, since the original one requires computing absolutes and entropy from the
        expanded (batch, in_features, out_features) intermediate tensor, which is hidden
        behind the F.linear function if we want an memory efficient implementation.

        The L1 regularization is now computed as mean absolute value of the spline
        weights. The authors implementation also includes this term in addition to the
        sample-based regularization.
        """

        l1_fake = self.spline_weight.abs().mean(-1)
        regularization_loss_activation = l1_fake.sum()
        p = l1_fake / regularization_loss_activation
        regularization_loss_entropy = -torch.sum(p * p.log())
        loss = (
            regularize_activation * regularization_loss_activation
            + regularize_entropy * regularization_loss_entropy
            + regularize_clipping * (self.lut_out_quantizer.clipping_loss + self.lut_inp_quantizer.clipping_loss)
        )

        self.lut_out_quantizer.clipping_loss = 0.0
        self.lut_inp_quantizer.clipping_loss = 0.0

        return loss
    
    def get_frac_clipped(self):
        out = self.lut_out_quantizer.num_clipped / self.lut_out_quantizer.num_total
        inp = self.lut_inp_quantizer.num_clipped / self.lut_inp_quantizer.num_total
        self.lut_out_quantizer.num_clipped = 0.0
        self.lut_inp_quantizer.num_clipped = 0.0
        self.lut_out_quantizer.num_total = 0.0
        self.lut_inp_quantizer.num_total = 0.0
        return out, inp



class KAN(torch.nn.Module):
    def __init__(
        self,
        layers_hidden,
        grid_size=5,
        spline_order=3,
        scale_noise=0.1,
        scale_base=1.0,
        scale_spline=1.0,
        base_activation=torch.nn.SiLU,
        grid_eps=0.02,
        grid_range=[-1, 1],
        quantize=False,
        quantize_clip=False,
        tp=16,
        fp=6,
        lut_res=256,
    ):
        super(KAN, self).__init__()
        self.grid_size = grid_size
        self.spline_order = spline_order

        self.layers = torch.nn.ModuleList()
        for in_features, out_features in zip(layers_hidden, layers_hidden[1:]):
            self.layers.append(
                KANLinear(
                    in_features,
                    out_features,
                    grid_size=grid_size,
                    spline_order=spline_order,
                    scale_noise=scale_noise,
                    scale_base=scale_base,
                    scale_spline=scale_spline,
                    base_activation=base_activation,
                    grid_eps=grid_eps,
                    grid_range=grid_range,
                    quantize=quantize,
                    tp=tp,
                    fp=fp,
                    lut_res=lut_res,
                    quantize_clip=quantize_clip,
                )
            )

    def forward(self, x: torch.Tensor, update_grid=False):
        for layer in self.layers:
            if update_grid:
                layer.update_grid(x)
            x = layer(x)
        return x

    def regularization_loss(self, regularize_activation=1.0, regularize_entropy=1.0, regularize_clipping=0.1):
        return sum(
            layer.regularization_loss(regularize_activation, regularize_entropy, regularize_clipping)
            for layer in self.layers
        )
    
    def prune_below_threshold(self, threshold=0.01):
        total_nodes = 0
        total_remaining = 0
        for i, layer in enumerate(self.layers):
            layer.prune_below_threshold(threshold, self.layers[i+1].spline_selector if i < len(self.layers) - 1 else None)
            total_nodes += layer.spline_selector.numel()
            total_remaining += layer.spline_selector.sum()
        return total_remaining / total_nodes