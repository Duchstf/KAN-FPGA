import os, sys, json

import gymnasium as gym
import torch
import torch.nn as nn

from stable_baselines3 import PPO
from stable_baselines3.common.monitor import Monitor
from stable_baselines3.common.policies import ActorCriticPolicy

# Keep your src utilities (for the exact same input quantizer wrapper)
sys.path.append('../../src')

# --- Quantization (Brevitas) ---
from brevitas.nn import QuantLinear, QuantHardTanh
from brevitas.core.scaling import ParameterScaling
from brevitas.core.quant import QuantType

# Your custom wrappers (unchanged) so the input quantizer stays EXACTLY the same
from quant import QuantBrevitasActivation, ScalarBiasScale

# --- Configuration ---
ENV_ID = "HalfCheetah-v5"
TOTAL_TIMESTEPS = 1_000_000
LOG_DIR = "logs_mlp8_quant"  # new log dir
NUM_BITS = 8

# Device
device = torch.device("cuda" if torch.cuda.is_available() else "cpu")


# -----------------------
# Quantized 8-bit MLP for the ACTOR (17 → 64 → 64 → 6)
# -----------------------
class QuantizedActorMLP(nn.Module):
    """
    Quantized MLP with 8-bit weights + activations.
    Architecture: [17, 64, 64, 6]
    Uses the EXACT SAME input quantizer module the KAN path used.
    """

    def __init__(self, in_features: int, out_features: int):
        super().__init__()

        # === EXACT same input quantizer as before ===
        self.input_quant = QuantBrevitasActivation(
            QuantHardTanh(
                bit_width=NUM_BITS,
                max_val=2.0,
                min_val=-2.0,
                act_scaling_impl=ParameterScaling(1.33),
                quant_type=QuantType.INT,
                return_quant_tensor=False,
            ),
            pre_transforms=[],
            cuda=device.type == "cuda",
        ).to(device)

        # Hidden activation quantizer (8-bit), mirroring the same style
        def qact():
            return QuantHardTanh(
                bit_width=NUM_BITS,
                max_val=2.0,
                min_val=-2.0,
                act_scaling_impl=ParameterScaling(1.33),
                quant_type=QuantType.INT,
                return_quant_tensor=False,
            )

        # Quantized linear layers (8-bit weights)
        self.fc1 = QuantLinear(
            in_features,
            64,
            bias=True,
            weight_bit_width=NUM_BITS,
            weight_quant_type=QuantType.INT,
        )
        self.act1 = qact()

        self.fc2 = QuantLinear(
            64,
            64,
            bias=True,
            weight_bit_width=NUM_BITS,
            weight_quant_type=QuantType.INT,
        )
        self.act2 = qact()

        # Output layer (quantized weights). No output activation here; SB3 handles distribution.
        self.fc_out = QuantLinear(
            64,
            out_features,
            bias=True,
            weight_bit_width=NUM_BITS,
            weight_quant_type=QuantType.INT,
        )

        self.to(device)

    def forward(self, x: torch.Tensor) -> torch.Tensor:
        x = self.input_quant(x)
        x = self.act1(self.fc1(x))
        x = self.act2(self.fc2(x))
        x = self.fc_out(x)
        return x


# -----------------------
# Custom extractor: uses the quantized MLP as the actor "backbone"
# -----------------------
class MLPAsActorExtractor(nn.Module):
    """
    Exposes:
    - latent_dim_pi, latent_dim_vf
    - forward_actor(features) -> latent_pi
    - forward_critic(features) -> latent_vf
    - forward(features) -> (latent_pi, latent_vf)
    """

    def __init__(self, feature_dim: int, action_dim: int, critic_layers=(64, 64)):
        super().__init__()

        # Actor: quantized 8b MLP mapping obs -> action_dim (means)
        self.policy_net = QuantizedActorMLP(in_features=feature_dim, out_features=action_dim)
        self.latent_dim_pi = action_dim

        # Critic: plain MLP (float) mapping obs -> latent_vf
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
# Custom Policy class that uses the quantized MLP and bypasses action_net
# -----------------------
class MLPDirectPolicy(ActorCriticPolicy):
    """
    ActorCriticPolicy subclass that:
    - builds an extractor whose policy_net is a quantized 8b MLP (17 -> 6)
    - replaces SB3's action_net with Identity so MLP outputs are used as means directly.
    """

    def __init__(self, *args, critic_layers=(64, 64), **kwargs):
        self._critic_layers = list(critic_layers)
        super().__init__(*args, **kwargs)
        # Use the mlp_extractor's policy output directly as the distribution mean
        self.action_net = nn.Identity()

    def _build_mlp_extractor(self) -> None:
        # features_dim is the flattened observation dimension post features extractor
        obs_feat_dim = self.features_dim
        action_dim = int(self.action_space.shape[0])
        self.mlp_extractor = MLPAsActorExtractor(
            feature_dim=obs_feat_dim,
            action_dim=action_dim,
            critic_layers=self._critic_layers,
        )


# -----------------------
# Training wrapper
# -----------------------
def train():
    # Logging
    os.makedirs(LOG_DIR, exist_ok=True)

    # Save a minimal config snapshot for reproducibility
    mlp_config = {
        "arch": [17, 64, 64, 6],
        "num_bits": NUM_BITS,
        "input_quantizer": {
            "type": "QuantHardTanh",
            "max_val": 2.0,
            "min_val": -2.0,
            "act_scaling_impl": "ParameterScaling(1.33)",
            "quant_type": "INT",
        },
        "hidden_activation": "QuantHardTanh",
        "weight_quant": "QuantLinear(INT, 8-bit)",
    }
    with open(f"{LOG_DIR}/config.json", "w") as f:
        json.dump(mlp_config, f, indent=2)

    for seed in [0, 1, 2, 3, 4]:
        env = gym.make(ENV_ID)
        env.reset(seed=seed)
        env = Monitor(env, os.path.join(LOG_DIR, f"seed_{seed}"))

        # Define model
        model = PPO(
            policy=MLPDirectPolicy,
            env=env,
            policy_kwargs=dict(critic_layers=[64, 64]),
            learning_rate=3e-4,
            clip_range=0.2,
            n_epochs=10,
            batch_size=64,
            gamma=0.99,
            gae_lambda=0.95,
            n_steps=2048,
            verbose=1,
            seed=seed,
            device="cpu",  # keep on CPU like your original run; change if desired
            tensorboard_log=os.path.join(LOG_DIR, f"seed_{seed}"),
        )

        # Train
        model.learn(total_timesteps=TOTAL_TIMESTEPS)
        env.close()

        # Save just the actor MLP weights
        mlp_model = model.policy.mlp_extractor.policy_net
        checkpoint = {"model_state_dict": mlp_model.state_dict()}
        torch.save(checkpoint, f"{LOG_DIR}/mlp8_model_{seed}.pt")


if __name__ == "__main__":
    train()
