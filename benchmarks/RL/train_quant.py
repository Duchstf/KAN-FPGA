import os, sys, json
import gymnasium as gym
import torch
import torch.nn as nn
from stable_baselines3 import PPO
from stable_baselines3.common.monitor import Monitor
from stable_baselines3.common.policies import ActorCriticPolicy

sys.path.append('../../src')
from KANQuant import KANQuant

#For quantization
from brevitas.nn import QuantHardTanh, QuantIdentity
from brevitas.core.scaling import ParameterScaling
from brevitas.core.quant import QuantType
from quant import QuantBrevitasActivation, ScalarBiasScale


# --- Configuration ---
ENV_ID = "HalfCheetah-v5"
TOTAL_TIMESTEPS = 1_000_000
LOG_DIR = "logs_kan_quant_16bit" # Use a different log directory
NUM_BITS = 16

#Set the device
device = torch.device("cuda" if torch.cuda.is_available() else "cpu")

# -----------------------
# Custom extractor: uses KAN as the actor "backbone"
# -----------------------
class KANAsActorExtractor(nn.Module):
    """
    Exposes:
      - latent_dim_pi, latent_dim_vf
      - forward_actor(features) -> latent_pi
      - forward_critic(features) -> latent_vf
      - forward(features) -> (latent_pi, latent_vf)
    """
    def __init__(self, feature_dim: int, action_dim: int, critic_layers=(64, 64), kan_config=None):
        super().__init__()

        #Build the input layer
        input_layer = QuantBrevitasActivation(
            QuantHardTanh(bit_width = kan_config["layers_bitwidth"][0],
            max_val=2.0,
            min_val=-2.0,
            act_scaling_impl=ParameterScaling(1.33),
            quant_type=QuantType.INT,
            return_quant_tensor = False),
            pre_transforms=[],
            cuda=device.type == "cuda").to(device)
        
        # Actor: KAN maps obs -> action_dim (direct means)
        self.policy_net = KANQuant(kan_config, input_layer, device).to(device)
        self.latent_dim_pi = action_dim

        # Critic: MLP maps obs -> latent_vf
        critic = []
        last = feature_dim
        for h in critic_layers:
            critic += [nn.Linear(last, h), nn.ReLU()]
            last = h
        self.value_net = nn.Sequential(*critic)
        self.latent_dim_vf = last

    def forward_actor(self, features: torch.Tensor) -> torch.Tensor:
        return self.policy_net(features)

    def forward_critic(self, features: torch.Tensor) -> torch.Tensor:
        return self.value_net(features)

    def forward(self, features: torch.Tensor) -> tuple[torch.Tensor, torch.Tensor]:
        return self.forward_actor(features), self.forward_critic(features)


# -----------------------
# Custom Policy class that uses the KAN extractor and bypasses action_net
# -----------------------
class KANDirectPolicy(ActorCriticPolicy):
    """
    ActorCriticPolicy subclass that:
      - builds an extractor whose policy_net is a KAN (17 -> 6)
      - replaces SB3's action_net with Identity so KAN outputs are used as means directly.
    """
    def __init__(self, *args, critic_layers=(64,64), **kwargs):
        self.kan_config = kwargs.pop("kan_config")
        self._critic_layers = list(critic_layers)
        super().__init__(*args, **kwargs)

        # After base initialization, replace action_net (a Linear) with Identity.
        # This ensures the distribution mean comes directly from the mlp_extractor output,
        # which we set to be the KAN output.
        self.action_net = nn.Identity()

    def _build_mlp_extractor(self) -> None:
        """
        Called within ActorCriticPolicy._build().
        We must set self.mlp_extractor to an object that:
          - on forward returns (latent_pi, latent_vf)
          - exposes latent_dim_pi and latent_dim_vf
        We'll use our KANAsActorExtractor.
        """
        # features_dim is the dimension of the flattened observation after features extractor
        obs_feat_dim = self.features_dim
        action_dim = int(self.action_space.shape[0])

        self.mlp_extractor = KANAsActorExtractor(
            feature_dim=obs_feat_dim,
            action_dim=action_dim,
            critic_layers=self._critic_layers,
            kan_config=self.kan_config,
        )

# -----------------------
# Training wrapper
# -----------------------
def train():

    # Logging
    os.makedirs(LOG_DIR, exist_ok=True)

    kan_config = {
        "layers": [17, 6],
        "layers_bitwidth": [NUM_BITS, NUM_BITS],

        "grid_size": 10,
        "spline_order": 3,
        "grid_range": [-2, 2],
        "grid_eps": 0.05,
        
        "base_activation": "nn.GELU",
    }

    #Dump the config to a json file
    with open(f"{LOG_DIR}/config.json", "w") as f: json.dump(kan_config, f)

    for seed in [0,1,2,3,4]:
        env = gym.make(ENV_ID)
        env.reset(seed=seed)
        env = Monitor(env, os.path.join(LOG_DIR, f"seed_{seed}"))


        # Define model
        model = PPO(
            policy=KANDirectPolicy,
            env=env,
            policy_kwargs=dict(critic_layers=[64, 64], kan_config=kan_config),
            learning_rate=3e-4,     # LR
            clip_range=0.2,         # Clip parameter ε
            n_epochs=10,            # Number of epochs
            batch_size=64,          # Batch size
            gamma=0.99,             # Discount factor γ
            gae_lambda=0.95,        # GAE λ
            n_steps=2048,           # rollout size (not in figure; your choice)
            verbose=1,
            seed=seed,
            device="cpu",           # Device
            tensorboard_log=os.path.join(LOG_DIR, f"seed_{seed}")
        )

        # Train model
        model.learn(total_timesteps=TOTAL_TIMESTEPS)
        env.close()

        # Save the model
        kan_model = model.policy.mlp_extractor.policy_net
        checkpoint = {'model_state_dict': kan_model.state_dict()}
        torch.save(checkpoint, f"{LOG_DIR}/kan_model_{seed}.pt")

if __name__ == "__main__":
    train()
