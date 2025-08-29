import torch, torch.nn as nn, torch.optim as optim, torchvision, torchvision.transforms as transforms
from torch.utils.data import DataLoader
from tqdm import tqdm

# Data
transform = transforms.Compose([transforms.ToTensor(), transforms.Lambda(lambda x: (x > 0).float())])
trainset = torchvision.datasets.MNIST(root="./data", train=True, download=False, transform=transform)
valset   = torchvision.datasets.MNIST(root="./data", train=False, download=False, transform=transform)
trainloader, valloader = DataLoader(trainset, 64, True), DataLoader(valset, 64, False)

# MLP (same size as KAN)
model = nn.Sequential(
    nn.Linear(28*28, 62), nn.ReLU(),
    nn.Linear(62, 10)
)

device = torch.device("cuda" if torch.cuda.is_available() else "cpu")
model.to(device)

# Training
opt = optim.AdamW(model.parameters(), lr=1e-3, weight_decay=1e-4)
sched = optim.lr_scheduler.ExponentialLR(opt, gamma=0.8)
crit = nn.CrossEntropyLoss()

for epoch in range(50):
    model.train()
    with tqdm(trainloader) as pbar:
        for x,y in pbar:
            x,y = x.view(-1,784).to(device), y.to(device)
            opt.zero_grad(); out=model(x); loss=crit(out,y)
            loss.backward(); opt.step()
            acc=(out.argmax(1)==y).float().mean()
            pbar.set_postfix(loss=loss.item(), acc=acc.item(), lr=opt.param_groups[0]['lr'])
    model.eval(); vl,va=0,0
    with torch.no_grad():
        for x,y in valloader:
            x,y=x.view(-1,784).to(device),y.to(device)
            out=model(x); vl+=crit(out,y).item(); va+=(out.argmax(1)==y).float().mean().item()
    print(f"Epoch {epoch+1}, Val Loss: {vl/len(valloader)}, Val Acc: {va/len(valloader)}")
    sched.step()
