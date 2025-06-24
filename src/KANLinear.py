"""
KAN (Kolmogorov-Arnold Network) Implementation with FPGA Quantization Support

This module implements Kolmogorov-Arnold Networks (KANs) using learnable spline functions
instead of fixed activation functions. It includes support for quantization to enable
FPGA deployment.

Key Components:
- KANLinear: A single KAN layer with spline-based activations
- KAN: Multi-layer KAN network
- Quantizer: Fixed-point quantization for FPGA compatibility
"""

import math
from typing import List, Optional, Tuple

import torch
import torch.nn.functional as F


def make_quantize(tp: int, fp: int, quantize_clip: bool):
    """
    Factory function to create a quantization function with specific parameters.
    
    Args:
        tp (int): Total precision (total number of bits)
        fp (int): Fractional precision (number of fractional bits)
        quantize_clip (bool): Whether to clip values or use wrap-around
        
    Returns:
        Quantize class: A custom autograd function for quantization
    """
    
    class Quantize(torch.autograd.Function):
        """Custom autograd function for fixed-point quantization."""
        
        @staticmethod
        def forward(ctx, input: torch.Tensor) -> torch.Tensor:
            """
            Forward pass: quantize input to fixed-point representation.
            
            Args:
                ctx: Autograd context (unused)
                input: Input tensor to quantize
                
            Returns:
                torch.Tensor: Quantized tensor
            """
            # Scale to fixed-point representation
            input = torch.floor(input * (2 ** fp))
            
            if quantize_clip:
                # Clipping quantization
                res = torch.clamp(input, -1 * (2 ** (tp - 1)), (2 ** (tp - 1)) - 1)
            else:
                # Wrap-around quantization
                range_size = 2 ** tp
                wrapped_unsigned_val = torch.fmod(
                    torch.fmod(input + range_size / 2, range_size) + range_size, 
                    range_size
                )
                res = wrapped_unsigned_val - range_size / 2
            
            # Scale back to floating-point
            return res / (2 ** fp)
        
        @staticmethod
        def backward(ctx, grad_output: torch.Tensor) -> torch.Tensor:
            """
            Backward pass: straight-through estimator (identity gradient).
            
            Args:
                ctx: Autograd context (unused)
                grad_output: Gradient from next layer
                
            Returns:
                torch.Tensor: Gradient passed through unchanged
            """
            return grad_output
    
    return Quantize


class Quantizer(torch.nn.Module):
    """
    Fixed-point quantizer module for FPGA deployment.
    
    This module quantizes floating-point values to fixed-point representation
    and tracks clipping statistics for monitoring quantization quality.
    
    Args:
        tp (int): Total precision (total number of bits). Default: 8
        fp (int): Fractional precision (number of fractional bits). Default: 4
        quantize_clip (bool): Whether to clip values or use wrap-around. Default: False
    """
    
    def __init__(self, tp: int = 8, fp: int = 4, quantize_clip: bool = False):
        super().__init__()
        self.tp = tp
        self.fp = fp
        self.quantize_clip = quantize_clip
        self.quantize = make_quantize(tp, fp, quantize_clip)
        
        # Statistics for monitoring quantization quality
        self.clipping_loss = 0.0
        self.num_clipped = 0.0
        self.num_total = 0.0
    
    def forward(self, x: torch.Tensor) -> torch.Tensor:
        """
        Forward pass: quantize input tensor and update statistics.
        
        Args:
            x: Input tensor to quantize
            
        Returns:
            torch.Tensor: Quantized tensor
        """
        # Calculate dynamic range for clipping statistics
        int_bits = self.tp - self.fp
        max_val = 2 ** (int_bits - 1) - 1
        min_val = -2 ** (int_bits - 1)
        
        # Update clipping statistics
        self.num_clipped += torch.sum(x > max_val) + torch.sum(x < min_val)
        self.num_total += x.numel()
        
        if not self.quantize_clip:

            # Wrap around quantization

            above_max = torch.maximum(x - max_val, torch.zeros_like(x) - 0.5 / (2 ** self.fp)) * (2 ** self.fp)
            below_min = torch.maximum(min_val - x, torch.zeros_like(x) - 0.5 / (2 ** self.fp)) * (2 ** self.fp)

            outside_range = torch.maximum(above_max, below_min)

            self.clipping_loss += torch.nn.functional.relu(outside_range + 0.5).mean(-1).sum()
        
        return self.quantize.apply(x)


class KANLinear(torch.nn.Module):
    """
    Kolmogorov-Arnold Network Linear Layer.
    
    This layer replaces traditional linear transformations with learnable spline functions.
    Each connection between input and output features is represented by a B-spline basis
    function with learnable coefficients.
    
    Args:
        in_features (int): Number of input features
        out_features (int): Number of output features
        grid_size (int): Number of grid points for spline basis. Default: 5
        spline_order (int): Order of B-spline basis functions. Default: 3
        scale_noise (float): Scale factor for initialization noise. Default: 0.1
        scale_base (float): Scale factor for base weights. Default: 1.0
        scale_spline (float): Scale factor for spline weights. Default: 1.0
        enable_standalone_scale_spline (bool): Whether to use separate spline scalers. Default: True
        base_activation: Base activation function class. Default: torch.nn.SiLU
        grid_eps (float): Interpolation factor between adaptive and uniform grids. Default: 0.02
        grid_range (List[float]): Range for spline grid. Default: [-1, 1]
        quantize (bool): Whether to enable quantization. Default: False
        tp (int): Total precision for quantization. Default: 16
        fp (int): Fractional precision for quantization. Default: 6
        lut_res (int): Look-up table resolution. Default: 256
        quantize_clip (bool): Whether to use clipping in quantization. Default: False
    """
    
    def __init__(
        self,
        in_features: int,
        out_features: int,
        grid_size: int = 5,
        spline_order: int = 3,
        scale_noise: float = 0.1,
        scale_base: float = 1.0,
        scale_spline: float = 1.0,
        enable_standalone_scale_spline: bool = True,
        base_activation=torch.nn.SiLU,
        grid_eps: float = 0.02,
        grid_range: List[float] = [-1,1],
        quantize: bool = False,
        tp: int = 16,
        fp: int = 6,
        lut_res: int = 256,
        quantize_clip: bool = False,
    ):
        super(KANLinear, self).__init__()
        self.in_features = in_features
        self.out_features = out_features
        self.grid_size = grid_size
        self.spline_order = spline_order
        self.scale_noise = scale_noise
        self.scale_base = scale_base
        self.scale_spline = scale_spline
        self.enable_standalone_scale_spline = enable_standalone_scale_spline
        self.base_activation = base_activation()
        self.grid_eps = grid_eps
        self.quantize = quantize
        
        # Initialize spline grid
        h = (grid_range[1] - grid_range[0]) / grid_size
        grid = (
            (torch.arange(-spline_order, grid_size + spline_order + 1) * h + grid_range[0])
            .expand(in_features, -1)
            .contiguous()
        )
        self.register_buffer("grid", grid)
        
        # Initialize learnable parameters
        self.base_weight = torch.nn.Parameter(torch.Tensor(out_features, in_features))
        self.spline_weight = torch.nn.Parameter(
            torch.Tensor(out_features, in_features, grid_size + spline_order)
        )
        
        if enable_standalone_scale_spline:
            self.spline_scaler = torch.nn.Parameter(
                torch.Tensor(out_features, in_features)
            )
        
        # Spline selector for pruning (multiplied by spline weights to eliminate pruned splines)
        self.spline_selector = torch.nn.Parameter(torch.ones(out_features, in_features))
        self.spline_selector.requires_grad = False
        
        # Initialize parameters
        self.reset_parameters()
        
        # Setup quantization if enabled
        if quantize:
            lut_tp = int(math.log2(lut_res))
            lut_fp = lut_tp - int(math.log2(grid_range[1] - grid_range[0]))
            
            assert lut_fp == fp, f"FP mismatch: lut_fp={lut_fp}, fp={fp}"
            
            self.lut_inp_quantizer = Quantizer(tp=lut_tp, fp=lut_fp, quantize_clip=quantize_clip)
            self.lut_out_quantizer = Quantizer(tp=tp, fp=fp, quantize_clip=quantize_clip)
    
    def reset_parameters(self) -> None:
        """Initialize layer parameters using Kaiming uniform initialization."""
        torch.nn.init.kaiming_uniform_(self.base_weight, a=math.sqrt(5) * self.scale_base)
        
        with torch.no_grad():
            # Initialize spline weights with noise
            noise = (
                (torch.rand(self.grid_size + 1, self.in_features, self.out_features) - 0.5)
                * self.scale_noise / self.grid_size
            )
            
            self.spline_weight.data.copy_(
                (self.scale_spline if not self.enable_standalone_scale_spline else 1.0)
                * self.curve2coeff(
                    self.grid.T[self.spline_order : -self.spline_order],
                    noise,
                )
            )
            
            if self.enable_standalone_scale_spline:
                torch.nn.init.kaiming_uniform_(
                    self.spline_scaler, 
                    a=math.sqrt(5) * self.scale_spline
                )
    
    def b_splines(self, x: torch.Tensor) -> torch.Tensor:
        """
        Compute B-spline basis functions for the given input tensor.
        
        Uses the Cox-de Boor recursion formula to efficiently compute B-spline bases.
        
        Args:
            x: Input tensor of shape (batch_size, in_features)
            
        Returns:
            torch.Tensor: B-spline bases of shape (batch_size, in_features, grid_size + spline_order)
        """
        assert x.dim() == 2 and x.size(1) == self.in_features
        
        grid: torch.Tensor = self.grid  # (in_features, grid_size + 2 * spline_order + 1)
        x = x.unsqueeze(-1)
        
        # Initialize with indicator functions (degree 0)
        bases = ((x >= grid[:, :-1]) & (x < grid[:, 1:])).to(x.dtype)
        
        # Cox-de Boor recursion for higher-order splines
        for k in range(1, self.spline_order + 1):
            bases = (
                (x - grid[:, : -(k + 1)]) / (grid[:, k:-1] - grid[:, : -(k + 1)]) * bases[:, :, :-1]
            ) + (
                (grid[:, k + 1 :] - x) / (grid[:, k + 1 :] - grid[:, 1:(-k)]) * bases[:, :, 1:]
            )
        
        assert bases.size() == (x.size(0), self.in_features, self.grid_size + self.spline_order)
        return bases.contiguous()
    
    def curve2coeff(self, x: torch.Tensor, y: torch.Tensor) -> torch.Tensor:
        """
        Compute spline coefficients that interpolate the given points.
        
        Uses least squares to find the best-fitting spline coefficients for the given
        input-output pairs.
        
        Args:
            x: Input tensor of shape (batch_size, in_features)
            y: Output tensor of shape (batch_size, in_features, out_features)
            
        Returns:
            torch.Tensor: Coefficients of shape (out_features, in_features, grid_size + spline_order)
        """
        assert x.dim() == 2 and x.size(1) == self.in_features
        assert y.size() == (x.size(0), self.in_features, self.out_features)
        
        # Compute B-spline basis matrix
        A = self.b_splines(x).transpose(0, 1)  # (in_features, batch_size, grid_size + spline_order)
        B = y.transpose(0, 1)  # (in_features, batch_size, out_features)
        
        # Solve least squares problem
        solution = torch.linalg.lstsq(A, B).solution  # (in_features, grid_size + spline_order, out_features)
        result = solution.permute(2, 0, 1)  # (out_features, in_features, grid_size + spline_order)
        
        assert result.size() == (self.out_features, self.in_features, self.grid_size + self.spline_order)
        return result.contiguous()
    
    @property
    def scaled_spline_weight(self) -> torch.Tensor:
        """
        Get spline weights scaled by the spline scaler if enabled.
        
        Returns:
            torch.Tensor: Scaled spline weights
        """
        return self.spline_weight * (
            self.spline_scaler.unsqueeze(-1) if self.enable_standalone_scale_spline else 1.0
        )
    
    def forward(self, x: torch.Tensor) -> torch.Tensor:
        """
        Forward pass through the KAN layer.
        
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
        
        # Apply input quantization if enabled
        if self.quantize:
            x = self.lut_inp_quantizer(x)
        
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
        
        # Apply output quantization if enabled
        if self.quantize:
            spline_output = self.lut_out_quantizer(spline_output)
        
        # Sum over input features
        output = torch.sum(spline_output, dim=-1)
        
        # Final output quantization if enabled
        if self.quantize:
            output = self.lut_out_quantizer(output)
        
        return output.reshape(*original_shape[:-1], self.out_features)
    
    def prune_below_threshold(
        self, 
        threshold: float = 0.01, 
        next_layer_sparsity_matrix: Optional[torch.Tensor] = None
    ) -> None:
        """
        Prune spline connections with L2 norm below the given threshold.
        
        This method evaluates each spline function over a dense grid and computes
        its L2 norm. Splines with norm below the threshold are pruned by setting
        their selector to zero.
        
        Args:
            threshold: Threshold for pruning (splines with norm < threshold are pruned)
            next_layer_sparsity_matrix: Sparsity matrix of the next layer for backward pruning
        """
        # Get grid range for evaluation
        grid_range = [self.grid[0, 0].item(), self.grid[0, -1].item()]
        array = torch.linspace(grid_range[0], grid_range[1], 1024, device=self.base_weight.device)
        stacked_array = array.unsqueeze(1).expand(-1, self.in_features)
        x = stacked_array.float()
        
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
        
        # Calculate pruning statistics
        prior_fraction = self.spline_selector.sum() / self.spline_selector.numel() * 100
        
        # Apply threshold-based pruning
        self.spline_selector *= (norms > threshold).float()
        
        # Apply backward pruning if next layer sparsity is provided
        if next_layer_sparsity_matrix is not None:
            # Find columns that are all zeros (no connections to next layer)
            zero_cols = (next_layer_sparsity_matrix == 0).all(dim=0)
            self.spline_selector[zero_cols, :] = 0
        
        new_fraction = self.spline_selector.sum() / self.spline_selector.numel() * 100
        print(f"Pruned {prior_fraction - new_fraction:.2f}% splines, overall remaining {new_fraction:.2f}%")
    
    @torch.no_grad()
    def update_grid(self, x: torch.Tensor, margin: float = 0.01) -> None:
        """
        Update the spline grid based on input data distribution.
        
        This method adapts the spline grid to better fit the input data distribution,
        which can improve the approximation quality of the splines.
        
        Args:
            x: Input tensor of shape (batch_size, in_features)
            margin: Margin to add around the data range
        """
        assert x.dim() == 2 and x.size(1) == self.in_features
        batch = x.size(0)
        
        # Compute current spline outputs for grid update
        splines = self.b_splines(x)  # (batch, in, coeff)
        splines = splines.permute(1, 0, 2)  # (in, batch, coeff)
        orig_coeff = self.scaled_spline_weight  # (out, in, coeff)
        orig_coeff = orig_coeff.permute(1, 2, 0)  # (in, coeff, out)
        unreduced_spline_output = torch.bmm(splines, orig_coeff)  # (in, batch, out)
        unreduced_spline_output = unreduced_spline_output.permute(1, 0, 2)  # (batch, in, out)
        
        # Sort data to get distribution
        x_sorted = torch.sort(x, dim=0)[0]
        
        # Create adaptive grid based on data quantiles
        grid_adaptive = x_sorted[
            torch.linspace(0, batch - 1, self.grid_size + 1, dtype=torch.int64, device=x.device)
        ]
        
        # Create uniform grid
        uniform_step = (x_sorted[-1] - x_sorted[0] + 2 * margin) / self.grid_size
        grid_uniform = (
            torch.arange(self.grid_size + 1, dtype=torch.float32, device=x.device).unsqueeze(1)
            * uniform_step + x_sorted[0] - margin
        )
        
        # Interpolate between adaptive and uniform grids
        grid = self.grid_eps * grid_uniform + (1 - self.grid_eps) * grid_adaptive
        
        # Add boundary points for spline order
        grid = torch.concatenate([
            grid[:1] - uniform_step * torch.arange(self.spline_order, 0, -1, device=x.device).unsqueeze(1),
            grid,
            grid[-1:] + uniform_step * torch.arange(1, self.spline_order + 1, device=x.device).unsqueeze(1),
        ], dim=0)
        
        # Update grid and recompute spline coefficients
        self.grid.copy_(grid.T)
        self.spline_weight.data.copy_(self.curve2coeff(x, unreduced_spline_output))
    
    def regularization_loss(
        self, 
        regularize_activation: float = 1.0, 
        regularize_entropy: float = 1.0, 
        regularize_clipping: float = 0.1
    ) -> torch.Tensor:
        """
        Compute regularization loss for the layer.
        
        The regularization loss consists of three terms:
        1. L1 regularization on spline weights (activation regularization)
        2. Entropy regularization to encourage sparsity
        3. Clipping loss from quantization (if enabled)
        
        Args:
            regularize_activation: Weight for activation regularization
            regularize_entropy: Weight for entropy regularization  
            regularize_clipping: Weight for clipping regularization
            
        Returns:
            torch.Tensor: Total regularization loss
        """
        # L1 regularization on spline weights
        l1_fake = self.spline_weight.abs().mean(-1)
        regularization_loss_activation = l1_fake.sum()
        
        # Entropy regularization
        p = l1_fake / regularization_loss_activation
        regularization_loss_entropy = -torch.sum(p * p.log())
        
        # Clipping loss from quantization
        clipping_loss = 0.0
        if self.quantize:
            clipping_loss = self.lut_out_quantizer.clipping_loss + self.lut_inp_quantizer.clipping_loss
            # Reset clipping loss after using it
            self.lut_out_quantizer.clipping_loss = 0.0
            self.lut_inp_quantizer.clipping_loss = 0.0
        
        total_loss = (
            regularize_activation * regularization_loss_activation
            + regularize_entropy * regularization_loss_entropy
            + regularize_clipping * clipping_loss
        )
        
        return total_loss
    
    def get_frac_clipped(self) -> Tuple[float, float]:
        """
        Get the fraction of values that were clipped during quantization.
        
        Returns:
            Tuple[float, float]: (output_clipped_fraction, input_clipped_fraction)
        """
        if not self.quantize:
            return 0.0, 0.0
        
        out_frac = self.lut_out_quantizer.num_clipped / self.lut_out_quantizer.num_total
        inp_frac = self.lut_inp_quantizer.num_clipped / self.lut_inp_quantizer.num_total
        
        # Reset counters
        self.lut_out_quantizer.num_clipped = 0.0
        self.lut_inp_quantizer.num_clipped = 0.0
        self.lut_out_quantizer.num_total = 0.0
        self.lut_inp_quantizer.num_total = 0.0
        
        return out_frac, inp_frac


class KAN(torch.nn.Module):
    """
    Multi-layer Kolmogorov-Arnold Network.
    
    This class implements a full KAN by stacking multiple KANLinear layers.
    Each layer uses learnable spline functions instead of traditional linear
    transformations with fixed activations.
    
    Args:
        layers_hidden (List[int]): List of layer sizes including input and output
        grid_size (int): Number of grid points for spline basis. Default: 5
        spline_order (int): Order of B-spline basis functions. Default: 3
        scale_noise (float): Scale factor for initialization noise. Default: 0.1
        scale_base (float): Scale factor for base weights. Default: 1.0
        scale_spline (float): Scale factor for spline weights. Default: 1.0
        base_activation: Base activation function class. Default: torch.nn.SiLU
        grid_eps (float): Interpolation factor between adaptive and uniform grids. Default: 0.02
        grid_range (List[float]): Range for spline grid. Default: [-1, 1]
        quantize (bool): Whether to enable quantization. Default: False
        quantize_clip (bool): Whether to use clipping in quantization. Default: False
        tp (int): Total precision for quantization. Default: 16
        fp (int): Fractional precision for quantization. Default: 6
        lut_res (int): Look-up table resolution. Default: 256
    """
    
    def __init__(
        self,
        layers_hidden: List[int],
        grid_size: int = 5,
        spline_order: int = 3,
        scale_noise: float = 0.1,
        scale_base: float = 1.0,
        scale_spline: float = 1.0,
        base_activation=torch.nn.SiLU,
        grid_eps: float = 0.02,
        grid_range: List[float] = [-1, 1],
        quantize: bool = False,
        quantize_clip: bool = False,
        tp: int = 16,
        fp: int = 6,
        lut_res: int = 256,
    ):
        super(KAN, self).__init__()
        self.grid_size = grid_size
        self.spline_order = spline_order
        
        # Create KAN layers
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
    
    def forward(self, x: torch.Tensor, update_grid: bool = False) -> torch.Tensor:
        """
        Forward pass through the entire KAN network.
        
        Args:
            x: Input tensor
            update_grid: Whether to update spline grids during forward pass
            
        Returns:
            torch.Tensor: Network output
        """
        for layer in self.layers:
            if update_grid:
                layer.update_grid(x)
            x = layer(x)
        return x
    
    def regularization_loss(
        self, 
        regularize_activation: float = 1.0, 
        regularize_entropy: float = 1.0, 
        regularize_clipping: float = 0.1
    ) -> torch.Tensor:
        """
        Compute total regularization loss across all layers.
        
        Args:
            regularize_activation: Weight for activation regularization
            regularize_entropy: Weight for entropy regularization
            regularize_clipping: Weight for clipping regularization
            
        Returns:
            torch.Tensor: Total regularization loss
        """
        return sum(
            layer.regularization_loss(regularize_activation, regularize_entropy, regularize_clipping)
            for layer in self.layers
        )
    
    def prune_below_threshold(self, threshold: float = 0.01) -> float:
        """
        Prune spline connections across all layers below the given threshold.
        
        Args:
            threshold: Threshold for pruning
            
        Returns:
            float: Fraction of remaining connections after pruning
        """
        total_nodes = 0
        total_remaining = 0
        
        for i, layer in enumerate(self.layers):
            # Get next layer's sparsity matrix for backward pruning
            next_layer_sparsity = (
                self.layers[i + 1].spline_selector if i < len(self.layers) - 1 else None
            )
            
            layer.prune_below_threshold(threshold, next_layer_sparsity)
            total_nodes += layer.spline_selector.numel()
            total_remaining += layer.spline_selector.sum()
        
        return total_remaining / total_nodes