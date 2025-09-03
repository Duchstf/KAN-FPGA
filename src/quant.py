import torch
import torch.nn as nn
from torch.nn import init
from torch.nn.parameter import Parameter


class QuantBrevitas(nn.Module):
    def __init__(
        self, brevitas_module, pre_transforms: list = [], post_transforms: list = [], cuda: bool = True
    ):
        super(QuantBrevitas, self).__init__()
        self.brevitas_module = brevitas_module
        self.pre_transforms = nn.ModuleList(pre_transforms)
        self.post_transforms = nn.ModuleList(post_transforms)

    def apply_pre_transforms(self, x):
        for i in range(len(self.pre_transforms)):
            x = self.pre_transforms[i](x)
        return x

    def apply_post_transforms(self, x):
        for i in range(len(self.post_transforms)):
            x = self.post_transforms[i](x)
        return x

    def forward(self, x):
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