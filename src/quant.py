#  This file is part of NeuraLUT.
#
#  NeuraLUT is a derivative work based on LogicNets,
#  which is licensed under the Apache License 2.0.
#  https://github.com/MartaAndronic/NeuraLUT/tree/main

#  Copyright (C) 2021 Xilinx, Inc
#
#  Licensed under the Apache License, Version 2.0 (the "License");
#  you may not use this file except in compliance with the License.
#  You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
#  Unless required by applicable law or agreed to in writing, software
#  distributed under the License is distributed on an "AS IS" BASIS,
#  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#  See the License for the specific language governing permissions and
#  limitations under the License.

import math
import torch
import torch.nn as nn
from torch.nn import init
from torch.nn.parameter import Parameter

from brevitas.core.quant import QuantType
from brevitas.core.quant import RescalingIntQuant, ClampedBinaryQuant
from brevitas.core.scaling import ScalingImplType
import brevitas.nn as bnn

# TODO: Put this inside an abstract base class
def get_int_state_space(bits: int, signed: bool, narrow_range: bool, is_cuda: bool):
    start = int(
        0 if not signed else (-(2 ** (bits - 1)) + int(narrow_range))
    )  # calculate the minimum value in the range
    end = int(
        start + 2 ** (bits) - int(narrow_range)
    )  # calculate the maximum of the range
    state_space = torch.as_tensor(range(start, end))
    if is_cuda:
        return state_space.cuda()
    return state_space


# TODO: Put this inside an abstract base class
def get_float_state_space(
    bits: int,
    scale_factor: float,
    signed: bool,
    narrow_range: bool,
    quant_type: QuantType,
    is_cuda: bool,
):
    if quant_type == QuantType.INT:
        bin_state_space = get_int_state_space(bits, signed, narrow_range, is_cuda)
    elif quant_type == QuantType.BINARY:
        bin_state_space = torch.as_tensor([-1.0, 1.0])

    bin_state_space = bin_state_space.to(device=scale_factor.device, dtype=scale_factor.dtype)
    state_space = scale_factor * bin_state_space
    return state_space


# TODO: Add an abstract class with a specific interface which all brevitas-based classes inherit from?
class QuantBrevitasActivation(nn.Module):
    def __init__(
        self, brevitas_module, pre_transforms: list = [], post_transforms: list = [], cuda: bool = True
    ):
        super(QuantBrevitasActivation, self).__init__()
        self.brevitas_module = brevitas_module
        self.pre_transforms = nn.ModuleList(pre_transforms)
        self.post_transforms = nn.ModuleList(post_transforms)
        self.is_bin_output = False
        self.cuda = cuda

    def get_bin_str_from_float(self, x, is_cuda):
        quant_type = self.get_quant_type()
        _, bits = self.get_scale_factor_bits(is_cuda)
        if quant_type == QuantType.INT:
            tensor_quant = (
                self.brevitas_module.act_quant.fused_activation_quant_proxy.tensor_quant
            )
            narrow_range = tensor_quant.int_quant.narrow_range
            signed = tensor_quant.int_quant.signed
            offset = 2 ** (bits - 1) - int(narrow_range) if signed else 0
            for idx, value in enumerate(self.get_state_space(is_cuda)):
                if math.isclose(self.get_state_space(is_cuda)[idx],x,rel_tol=1e-03):
                    return f"{int(self.get_bin_state_space(is_cuda)[idx]+offset):0{int(bits)}b}"
            raise Exception("Value not found in state space")
        elif quant_type == QuantType.BINARY:
            return f"{int(x):0{int(bits)}b}"
        else:
            raise Exception("Unknown quantization type: {}".format(quant_type))

    def get_bin_str_from_int(self, x, is_cuda):
        quant_type = self.get_quant_type()
        scale_factor, bits = self.get_scale_factor_bits(is_cuda)
        if quant_type == QuantType.INT:
            tensor_quant = (
                self.brevitas_module.act_quant.fused_activation_quant_proxy.tensor_quant
            )
            narrow_range = tensor_quant.int_quant.narrow_range
            signed = tensor_quant.int_quant.signed
            offset = 2 ** (bits - 1) - int(narrow_range) if signed else 0
            if int(x) - x != 0:
                raise Exception("Value is not an integer, either run lut_inference first or change function to get_bin_str_from_float")
            return f"{int(x+offset):0{int(bits)}b}"
        elif quant_type == QuantType.BINARY:
            return f"{int(x):0{int(bits)}b}"
        else:
            raise Exception("Unknown quantization type: {}".format(quant_type))

    # TODO: Move to a base class
    def bin_output(self):
        self.is_bin_output = True

    # TODO: Move to a base class
    def float_output(self):
        self.is_bin_output = False

    def get_quant_type(self):
        brevitas_module_type = type(
            self.brevitas_module.act_quant.fused_activation_quant_proxy.tensor_quant
        )
        if brevitas_module_type == RescalingIntQuant:
            return QuantType.INT
        elif brevitas_module_type == ClampedBinaryQuant:
            return QuantType.BINARY
        else:
            raise Exception(
                "Unknown quantization type for tensor_quant: {}".format(
                    brevitas_module_type
                )
            )

    # TODO: Allow for different bitwidths / scales per output
    def get_scale_factor_bits(self, is_cuda):
        # TODO: put guards in this based on quantization type
        quant_proxy = self.brevitas_module.act_quant
        current_status = quant_proxy.training
        quant_proxy.eval()
        mod_device = next(self.brevitas_module.parameters()).device
        zero_point = torch.zeros(1, device=mod_device)
        _, scale_factor, _, bits, _, _ = quant_proxy(zero_point)
        quant_proxy.training = current_status
        return scale_factor, bits

    # Return a floating point version of the state space, this return values
    # that PyTorch would see at the output of this layer during training.
    # TODO: Merge this function with 'get_bin_state_space' and remove duplicated code.
    def get_state_space(self, is_cuda):
        quant_type = self.get_quant_type()
        scale_factor, bits = self.get_scale_factor_bits(is_cuda)
        if quant_type == QuantType.INT:
            tensor_quant = (
                self.brevitas_module.act_quant.fused_activation_quant_proxy.tensor_quant
            )
            narrow_range = tensor_quant.int_quant.narrow_range
            signed = tensor_quant.int_quant.signed
            state_space = get_float_state_space(
                bits, scale_factor, signed, narrow_range, quant_type, is_cuda
            )
        elif quant_type == QuantType.BINARY:
            state_space = scale_factor * torch.tensor([-1, 1])
        else:
            raise Exception("Unknown quantization type: {}".format(quant_type))
        return self.apply_post_transforms(state_space)

    # Return the underlying binary representation of the values returned by
    # 'get_state_space'
    def get_bin_state_space(self, is_cuda):
        quant_type = self.get_quant_type()
        _, bits = self.get_scale_factor_bits(is_cuda)
        if quant_type == QuantType.INT:
            tensor_quant = (
                self.brevitas_module.act_quant.fused_activation_quant_proxy.tensor_quant
            )
            narrow_range = tensor_quant.int_quant.narrow_range
            signed = tensor_quant.int_quant.signed
            state_space = get_int_state_space(bits, signed, narrow_range, is_cuda)
        elif quant_type == QuantType.BINARY:
            state_space = torch.tensor([0, 1])
        else:
            raise Exception("Unknown quantization type: {}".format(quant_type))
        return state_space

    def apply_pre_transforms(self, x):
        for i in range(len(self.pre_transforms)):
            x = self.pre_transforms[i](x)
        return x

    def apply_post_transforms(self, x):
        for i in range(len(self.post_transforms)):
            x = self.post_transforms[i](x)
        return x

    def forward(self, x):
        if self.is_bin_output:
            s, _ = self.get_scale_factor_bits(self.cuda)
            x = self.apply_pre_transforms(x)
            x = self.brevitas_module(x)
            x = torch.round(x / s).type(torch.int64)
        else:
            x = self.apply_pre_transforms(x)
            x = self.brevitas_module(x)
            x = self.apply_post_transforms(x)
        return x
    
class ScalarScaleBias(nn.Module):
    def __init__(self, scale=True, scale_init=1.0, bias=True, bias_init=0.0) -> None:
        super(ScalarScaleBias, self).__init__()
        if scale:
            self.weight = Parameter(torch.Tensor(1))
        else:
            self.register_parameter("weight", None)
        if bias:
            self.bias = Parameter(torch.Tensor(1))
        else:
            self.register_parameter("bias", None)
        self.weight_init = scale_init
        self.bias_init = bias_init
        self.reset_parameters()

    # Change the default initialisation for BatchNorm
    def reset_parameters(self) -> None:
        if self.weight is not None:
            init.constant_(self.weight, self.weight_init)
        if self.bias is not None:
            init.constant_(self.bias, self.bias_init)

    def forward(self, x):
        if self.weight is not None:
            x = x * self.weight
        if self.bias is not None:
            x = x + self.bias
        return x

class ScalarBiasScale(ScalarScaleBias):
    def forward(self, x):
        if self.bias is not None:
            x = x + self.bias
        if self.weight is not None:
            x = x * self.weight
        return x