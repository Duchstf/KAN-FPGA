import torch
import torch.nn.functional as F
import math
from typing import List, Optional, Tuple


from brevitas.nn import QuantIdentity
from brevitas.core.quant import QuantType
from brevitas.core.scaling import ScalingImplType
from brevitas.core.restrict_val import RestrictValueType
from brevitas.core.zero_point import ZeroZeroPoint

class Quantizer(torch.nn.Module):
    """Fixed-point quantizer module (Xilinx convention: integer bits)."""

    def __init__(self, W: int = 8, I: int = 4, clip: bool = False):
        super().__init__()
        self.W, self.I = W, I
        self.F = W-I
        self.clip = clip

        # Precompute integer-domain constants
        scale      =   1 << self.F
        qmin       = -(1 << (self.W - 1))
        qmax       =  (1 << (self.W - 1)) - 1
        range_size =  1 << W
        offset     =  range_size // 2

        class _Quant(torch.autograd.Function):
            @staticmethod
            def forward(ctx, input: torch.Tensor) -> torch.Tensor:

                # Scale to fixed-point representation
                input = torch.floor(input * scale)

                if self.clip:
                    # Clipping quantization
                    res = torch.clamp(input, qmin, qmax)
                else:
                    # Wrap-around quantization
                    wrapped_unsigned_val = torch.fmod(
                    torch.fmod(input + offset, range_size) + range_size, 
                    range_size)

                    res = wrapped_unsigned_val - offset

                # Scale back to floating-point
                return res / scale

            @staticmethod
            def backward(ctx, grad_output: torch.Tensor) -> torch.Tensor: return grad_output #Straight-through estimator

        # Stats as buffers (move with .to() and persist in state_dict)
        self.register_buffer("clipping_loss", torch.tensor(0.0))
        self.register_buffer("num_clipped",   torch.tensor(0.0))
        self.register_buffer("num_total",     torch.tensor(0.0))

        self.quantize = _Quant.apply

    def forward(self, x: torch.Tensor) -> torch.Tensor:
        # Calculate dynamic range for clipping statistics
        # Xilinx convention: I includes sign bit
        min_val = -2 ** (self.I - 1)
        max_val = 2 ** (self.I - 1) - 2**(self.F)

        # Update clipping statistics
        with torch.no_grad():
            self.num_clipped += torch.sum(x > max_val) + torch.sum(x < min_val)
            self.num_total += x.numel()

            # Penalize range violations only when wrapping is used
            if not self.clip:
                # Wrap around quantization
                above_max = torch.maximum(x - max_val, torch.zeros_like(x) - 0.5 / (2 ** self.F)) * (2 ** self.F)
                below_min = torch.maximum(min_val - x, torch.zeros_like(x) - 0.5 / (2 ** self.F)) * (2 ** self.F)

                outside_range = torch.maximum(above_max, below_min)

                self.clipping_loss += torch.nn.functional.relu(outside_range + 0.5).mean(-1).sum()
        
        return self.quantize(x)

    @torch.no_grad()
    def reset_stats(self):
        self.clipping_loss.zero_()
        self.num_clipped.zero_()
        self.num_total.zero_()


class KANLinear(torch.nn.Module):
    def __init__(
        self,
        in_features,
        out_features,
        input_precision: Tuple[int, int],
        output_precision: Tuple[int, int],
        quantize: bool = True,
        quantize_clip: bool = False,
        quantize_mode: str = "wrap",
        grid_size=5,
        spline_order=3,
        scale_noise=0.1,
        scale_base=1.0,
        scale_spline=1.0,
        enable_standalone_scale_spline=True,
        base_activation=torch.nn.SiLU,
        grid_eps=0.02,
        grid_range=[-1, 1],
    ):
        super(KANLinear, self).__init__()
        self.in_features = in_features
        self.out_features = out_features
        self.input_precision = input_precision
        self.output_precision = output_precision
        self.grid_size = grid_size
        self.spline_order = spline_order
        self.quantize = quantize
        self.quantize_mode = quantize_mode
        self.quantize_clip = quantize_clip

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

        self.reset_parameters()

        if self.quantize:       
            self.output_quantizer = Quantizer(W=self.output_precision[0], I=self.output_precision[1], clip=self.quantize_clip)

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

        base_output = F.linear(self.base_activation(x), self.base_weight)
        spline_output = F.linear(
            self.b_splines(x).view(x.size(0), -1),
            self.scaled_spline_weight.view(self.out_features, -1),
        )
        output = base_output + spline_output

        output = output.reshape(*original_shape[:-1], self.out_features)

        if self.quantize: output = self.output_quantizer(output) #Quantize the output

        return output

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

    def quantization_loss(self, regularize_clipping=0.1):
        return regularize_clipping * self.output_quantizer.clipping_loss

class KAN(torch.nn.Module):
    def __init__(
        self,
        layers_size: List[int],
        layers_precision: List[Tuple[int, int]], #Format (total_width, integer_width)
        quantize: bool = True,
        quantize_clip: bool = False,
        quantize_mode: str = "wrap",
        grid_size=5,
        spline_order=3,
        scale_noise=0.1,
        scale_base=1.0,
        scale_spline=1.0,
        base_activation=torch.nn.SiLU,
        grid_eps=0.02,
        grid_range=[-1, 1],
    ):
        super(KAN, self).__init__()
        self.grid_size = grid_size
        self.spline_order = spline_order

        #Some basic checks
        assert len(layers_size) == len(layers_precision), f"Number of layers must be equal to number of layers precision: {len(layers_size)} != {len(layers_precision)}"

        self.layers = torch.nn.ModuleList()
        for layer_index, (in_features, out_features, input_precision, output_precision) in enumerate(zip(layers_size, layers_size[1:], layers_precision, layers_precision[1:])):
            print(f"Creating layer {layer_index} with: {in_features} input features, {out_features} output features, Input Precision: [{input_precision[0]}, {input_precision[1]}], Output Precision: [{output_precision[0]}, {output_precision[1]}]")

            self.layers.append(
                KANLinear(
                    in_features,
                    out_features,
                    input_precision=input_precision,
                    output_precision=output_precision,
                    quantize=quantize,
                    quantize_clip=quantize_clip,
                    quantize_mode=quantize_mode,
                    grid_size=grid_size,
                    spline_order=spline_order,
                    scale_noise=scale_noise,
                    scale_base=scale_base,
                    scale_spline=scale_spline,
                    base_activation=base_activation,
                    grid_eps=grid_eps,
                    grid_range=grid_range,
                )
            )

    def forward(self, x: torch.Tensor, update_grid=False):
        for layer in self.layers:
            if update_grid:
                layer.update_grid(x)
            x = layer(x)
        return x

    def regularization_loss(self, regularize_activation=1.0, regularize_entropy=1.0):
        return sum(
            layer.regularization_loss(regularize_activation, regularize_entropy)
            for layer in self.layers
        )

    def quantization_loss(self, regularize_clipping=0.1):
        return sum(
            layer.quantization_loss(regularize_clipping)
            for layer in self.layers
        )
    
    @torch.no_grad()
    def reset_quant_stats(self):
        for layer in self.layers:
            if getattr(layer, "quantize", False):
                layer.output_quantizer.reset_stats()