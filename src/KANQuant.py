import torch
import torch.nn as nn
import torch.nn.functional as F
import math
from quant import QuantBrevitasActivation
from brevitas.nn import QuantIdentity
from brevitas.core.scaling import ParameterScaling
from brevitas.core.quant import QuantType
from typing import Optional

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
        """
        Computes the output using both base activation and spline functions:
        output = sum over inputs of (base_activation(x) * base_weight + spline_function(x))

        Args:
            x: Input tensor of shape (..., in_features)
            
        Returns:
            torch.Tensor: Output tensor of shape (..., out_features)
        """
        assert x.size(-1) == self.in_features
        original_shape = x.shape
        x = x.reshape(-1, self.in_features)

        # Compute base activation output
        base_output = self.base_activation(x).unsqueeze(2) * self.base_weight.T.unsqueeze(0)

        # Compute spline output and combine with base
        spline_output = (
            base_output + torch.sum(
                self.b_splines(x).unsqueeze(2) * self.scaled_spline_weight.transpose(0, 1).unsqueeze(0), 
                dim=-1
            )
        ).transpose(-1, -2)

        # Apply spline selector for pruning
        spline_output = self.spline_selector.unsqueeze(0) * spline_output
        
        #Quantize the LUT Output
        output = self.output_quantizer(spline_output) 

        # Sum over input features
        output = torch.sum(output, dim=-1)

        #Quantize/Clamp the sum of the LUT outputs
        output = self.output_quantizer(output) 

        return output.reshape(*original_shape[:-1], self.out_features)

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

    def regularization_loss(self, regularize_activation=1.0, regularize_entropy=1.0):
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
        return (
            regularize_activation * regularization_loss_activation
            + regularize_entropy * regularization_loss_entropy
        )
    
    @torch.no_grad()
    def prune_below_threshold(self, threshold: float = 0.01, next_layer_sparsity_matrix: Optional[torch.Tensor] = None, input_state_space: Optional[torch.Tensor] = None) -> None:

        # Get grid range for evaluation
        x = input_state_space.unsqueeze(0).repeat(self.in_features, 1).T.to(self.device)

        # Compute B-spline bases over the evaluation grid
        spline_bases = self.b_splines(x)

        # Compute L2 norm for each spline connection
        norms = torch.zeros((self.out_features, self.in_features), device=self.base_weight.device)
        for out_idx in range(self.out_features):
            for in_idx in range(self.in_features):
                spline_output = F.linear(
                    spline_bases[:, in_idx, :], 
                    self.scaled_spline_weight[out_idx, in_idx, :]
                )
                norms[out_idx, in_idx] = self.spline_selector[out_idx, in_idx] * torch.norm(spline_output)

        # Apply threshold-based pruning
        self.spline_selector *= (norms > threshold).float()

        # Apply backward pruning if next layer sparsity is provided
        if next_layer_sparsity_matrix is not None:
            # Find columns that are all zeros (no connections to next layer)
            zero_cols = (next_layer_sparsity_matrix == 0).all(dim=0)
            self.spline_selector[zero_cols, :] = 0

class KANQuant(torch.nn.Module):
    def __init__(self, config, input_layer, device):
        super(KANQuant, self).__init__()

        self.config = config
        self.input_layer = input_layer
        self.device = device
        self.is_cuda = device == "cuda"

        #The first layer after the input layer is quite special
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
        """
        The pruning threshold ramps up asymptotically toward `threshold`.

        Schedule:
        - Warmup: no pruning for the first `warmup_epochs` epochs.
        - Then: layer_threshold = threshold * (1 - exp(-k * t)),
                with t = max(epoch - warmup_epochs, 0)
                and k chosen so that we reach ~95% of threshold by `target_epoch`.
        """
        total_nodes = 0
        total_remaining = 0

        # ---- Asymptotic schedule parameters (adjust if desired) ----
        t = max(epoch - warmup_epochs, 0)
        # Solve 1 - exp(-k * (target_epoch - warmup_epochs)) = 0.95  ->  k = ln(20) / (target - warmup)
        denom = max(target_epoch - warmup_epochs, 1)
        k = math.log(20.0) / denom
        scale = 1.0 - math.exp(-k * t)
        layer_threshold = min(threshold * scale, threshold)
        # ------------------------------------------------------------

        with torch.no_grad():
            for i, layer in enumerate(self.layers):

                input_state_space = None

                if i == 0: input_state_space = self.input_layer.get_state_space(self.is_cuda).to(self.device)
                else: input_state_space = self.layers[i - 1].output_quantizer.get_state_space(self.is_cuda).to(self.device)


                # Get next layer's sparsity matrix for backward pruning
                next_layer_sparsity = (
                    self.layers[i + 1].spline_selector if i < len(self.layers) - 1 else None
                )

                layer.prune_below_threshold(layer_threshold, next_layer_sparsity, input_state_space)
                total_nodes += layer.spline_selector.numel()
                total_remaining += layer.spline_selector.sum()

        return total_remaining / total_nodes