
from torch import nn
from KAN_Conv_Impl.KANLinear import KANLinear
from KAN_Conv_Impl.KANConv import KANConv 

def make_kan_cnn():

  model = nn.Sequential(
    KANConv(in_channels=40, out_channels=40, kernel_size=(3, 1), stride=(1,1), padding=(0, 0)),
    KANConv(in_channels=40, out_channels=128, kernel_size=(1, 1)),
    nn.BatchNorm2d(128),
    nn.GELU(),
    nn.Dropout(p=0.5),

    KANConv(in_channels=128, out_channels=128, kernel_size=(5, 1), stride=(1,1), padding=(0, 0)),
    KANConv(in_channels=128, out_channels=128, kernel_size=(1, 1)),
    nn.BatchNorm2d(128),
    nn.GELU(),
    nn.Dropout(p=0.5),

    KANConv(in_channels=128, out_channels=128, kernel_size=(9, 1), stride=(1,1), padding=(0, 0)),
    KANConv(in_channels=128, out_channels=128, kernel_size=(1, 1)),
    nn.BatchNorm2d(128),
    nn.GELU(),
    nn.Dropout(p=0.5),

    KANConv(in_channels=128, out_channels=128, kernel_size=(15, 1), stride=(1,1), padding=(0, 0)),
    KANConv(in_channels=128, out_channels=32, kernel_size=(1, 1)),
    nn.BatchNorm2d(32),
    nn.GELU(),
    nn.Dropout(p=0.5),

    nn.Flatten(),
    KANLinear(64, 3)
  )

  print("Num parameters for KAN CNN", sum(p.numel() for p in model.parameters()))
  return model

# model = KAN([N_inputs, 256, 256, 256, N_outputs], grid_size=40, spline_order=4, grid_eps=0.03, base_activation=nn.GELU, grid_range=[-8,8])

def make_mini_kan_cnn():

  model = nn.Sequential(
    KANConv(in_channels=40, out_channels=64, kernel_size=(3, 1), stride=(1,1), padding=(0, 0), grid_range=[-8, 8]),
    nn.BatchNorm2d(64),
    nn.ReLU(),
    nn.Dropout(p=0.5),

    KANConv(in_channels=64, out_channels=64, kernel_size=(5, 1), stride=(1,1), padding=(0, 0), grid_range=[-8, 8]),
    nn.BatchNorm2d(64),
    nn.ReLU(),
    nn.Dropout(p=0.5),

    KANConv(in_channels=64, out_channels=64, kernel_size=(9, 1), stride=(1,1), padding=(0, 0), grid_range=[-8, 8]),
    nn.BatchNorm2d(64),
    nn.ReLU(),
    nn.Dropout(p=0.5),

    KANConv(in_channels=64, out_channels=32, kernel_size=(15, 1), stride=(1,1), padding=(0, 0), grid_range=[-8, 8]),
    nn.BatchNorm2d(32),
    nn.ReLU(),
    nn.Dropout(p=0.5),

    nn.Flatten(),
    KANLinear(64, 3, grid_range=[-8, 8])
  )

  print("Num parameters for MINI KAN CNN", sum(p.numel() for p in model.parameters()))
  return model


def make_cnn():
    model = nn.Sequential(
        # First Depthwise + Pointwise Conv Block
        nn.Conv2d(in_channels=40, out_channels=40, kernel_size=(3, 1), stride=1, padding=0),  # Depthwise
        nn.Conv2d(in_channels=40, out_channels=128, kernel_size=1),  # Pointwise
        nn.BatchNorm2d(128),
        nn.ReLU(),
        nn.Dropout(0.5),  # Dropout rate assumed to be 0.5

        # Second Depthwise + Pointwise Conv Block
        nn.Conv2d(in_channels=128, out_channels=128, kernel_size=(5, 1), stride=1, padding=0),  # Depthwise
        nn.Conv2d(in_channels=128, out_channels=128, kernel_size=1),  # Pointwise
        nn.BatchNorm2d(128),
        nn.ReLU(),
        nn.Dropout(0.5),

        # Third Depthwise + Pointwise Conv Block
        nn.Conv2d(in_channels=128, out_channels=128, kernel_size=(9, 1), stride=1, padding=0),  # Depthwise
        nn.Conv2d(in_channels=128, out_channels=128, kernel_size=1),  # Pointwise
        nn.BatchNorm2d(128),
        nn.ReLU(),
        nn.Dropout(0.5),

        # Fourth Depthwise + Pointwise Conv Block
        nn.Conv2d(in_channels=128, out_channels=128, kernel_size=(15, 1), stride=1, padding=0),  # Depthwise
        nn.Conv2d(in_channels=128, out_channels=32, kernel_size=1),  # Pointwise
        nn.BatchNorm2d(32),
        nn.ReLU(),
        nn.Dropout(0.5),

        # Flatten and Dense layers
        nn.Flatten(),
        nn.Linear(64, 3)  # Fully connected layer with 3 output classes
    )
    return model

