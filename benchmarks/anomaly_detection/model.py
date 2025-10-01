import torch
from tqdm import tqdm
import torch.nn as nn
import torch.nn.functional as F
from efficient_kan import KAN
import numpy as np

class AutoEncoder(nn.Module):
    def __init__(self, input_dim):
        """
        Define the PyTorch model
        The model is based on a simple dense autoencoder
        (128*128*128*128*8*128*128*128*128)
        """
        super(AutoEncoder, self).__init__()
        
        # Encoder layers
        self.enc1 = nn.Linear(input_dim, 128)
        self.bn1 = nn.BatchNorm1d(128)
        self.enc2 = nn.Linear(128, 128)
        self.bn2 = nn.BatchNorm1d(128)
        self.enc3 = nn.Linear(128, 128)
        self.bn3 = nn.BatchNorm1d(128)
        self.enc4 = nn.Linear(128, 128)
        self.bn4 = nn.BatchNorm1d(128)
        self.enc5 = nn.Linear(128, 8)
        self.bn5 = nn.BatchNorm1d(8)
        
        # Decoder layers
        self.dec1 = nn.Linear(8, 128)
        self.bn6 = nn.BatchNorm1d(128)
        self.dec2 = nn.Linear(128, 128)
        self.bn7 = nn.BatchNorm1d(128)
        self.dec3 = nn.Linear(128, 128)
        self.bn8 = nn.BatchNorm1d(128)
        self.dec4 = nn.Linear(128, 128)
        self.bn9 = nn.BatchNorm1d(128)
        self.dec5 = nn.Linear(128, input_dim)

    def forward(self, x):
        # Encoder
        # Apply encoder layers with batch normalization an
        x = F.relu(self.bn1(self.enc1(x)))
        x = F.relu(self.bn2(self.enc2(x)))
        x = F.relu(self.bn3(self.enc3(x)))
        x = F.relu(self.bn4(self.enc4(x)))
        x = self.bn5(self.enc5(x))
        
        # Decoder
        x = F.relu(self.bn6(self.dec1(x)))
        x = F.relu(self.bn7(self.dec2(x)))
        x = F.relu(self.bn8(self.dec3(x)))
        x = F.relu(self.bn9(self.dec4(x)))
        x = self.dec5(x)
        
        return x



def fit(model_name, num_inputs, data_loader, num_epochs, validation_split, device, learning_rate=1e-3):

    if model_name == "mlp":
        model = AutoEncoder(input_dim=num_inputs).to(device)
    elif model_name == "kan":
        model = KAN([num_inputs, 32, 8, 32, num_inputs], grid_size=40, spline_order=4, grid_eps=0.03, base_activation=nn.GELU, grid_range=[-32,32]).to(device)
    else:
        raise Exception(f"Model type {model_name} not implemented yet!")

    train_size = int(validation_split * len(data_loader.dataset))
    val_size = len(data_loader.dataset) - train_size
    train_dataset, val_dataset = torch.utils.data.random_split(data_loader.dataset, [train_size, val_size])

    train_loader = torch.utils.data.DataLoader(train_dataset, batch_size=data_loader.batch_size, shuffle=True)
    val_loader = torch.utils.data.DataLoader(val_dataset, batch_size=data_loader.batch_size, shuffle=False)

    train_losses = []
    val_losses = []
    best_val_loss = float('inf')
    best_model_state = None

    optimizer = torch.optim.Adam(model.parameters(), lr=learning_rate)
    criterion = nn.MSELoss()
    
    for epoch in tqdm(range(num_epochs), desc='Epochs'):
        total_loss = 0
        model.train()
        for data in tqdm(train_loader, desc=f'Epoch {epoch+1}/{num_epochs}', leave=False):
            optimizer.zero_grad()
            outputs = model(data)
            loss = criterion(outputs, data)
            loss.backward()
            optimizer.step()
            total_loss += loss.item()
            
        print(f'Epoch [{epoch+1}/{num_epochs}], Loss: {total_loss/len(train_loader):.6f}')

        # Validation
        model.eval()
        val_loss = 0
        with torch.no_grad():
            for data in tqdm(val_loader, f'VALIDATION for Epoch {epoch+1}'):
                outputs = model(data)
                loss = criterion(outputs, data)
                val_loss += loss.item()
        val_loss = val_loss / len(val_loader)
        print(f'Validation Loss: {val_loss:.6f}')

        if val_loss < best_val_loss:
            best_val_loss = val_loss
            best_model_state = model.state_dict().copy()

        train_losses.append(total_loss/len(train_loader))
        val_losses.append(val_loss)

        if np.argmin(val_losses) < len(val_losses) - 6:
            print(f"Breaking at epoch {epoch + 1}, val loss has not decreased in past 5 epochs.")
            break

    
    # Load the best model state
    model.load_state_dict(best_model_state)
    return model, train_losses, val_losses