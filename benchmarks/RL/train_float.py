import os, sys
import gymnasium as gym
import torch
import torch.nn as nn
from stable_baselines3 import PPO
from stable_baselines3.common.monitor import Monitor
from stable_baselines3.common.policies import ActorCriticPolicy

sys.path.append('../../src')
from KAN_OG import KAN

ENV_ID = "HalfCheetah-v5"
TOTAL_TIMESTEPS = 1_000_000
LOG_DIR = "logs_kan_float_v2"

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
    def __init__(self, feature_dim: int, action_dim: int, critic_layers=(64, 64), kan_kwargs=None):
        super().__init__()
        kan_kwargs = kan_kwargs or {}

        # Actor: KAN maps obs -> action_dim (direct means)
        self.policy_net = KAN([feature_dim, action_dim], **kan_kwargs)
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
    def __init__(self, *args, kan_kwargs=None, critic_layers=(64,64), **kwargs):
        self._kan_kwargs = kan_kwargs or {}
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
            kan_kwargs=self._kan_kwargs,
        )

# -----------------------
# Training wrapper
# -----------------------
def train():

    # Logging
    os.makedirs(LOG_DIR, exist_ok=True)

    for seed in [0,1,2,3,4]:
        env = gym.make(ENV_ID)
        env.reset(seed=seed)
        env = Monitor(env, os.path.join(LOG_DIR, f"seed_{seed}"))

        # Define KAN hyperparameters
        kan_hyperparams = dict(
            grid_size=5,
            spline_order=3,
            grid_range=[-2, 2],
            grid_eps=0.05,
            base_activation=nn.GELU,
        )

        # Define model
        model = PPO(
            policy=KANDirectPolicy,
            env=env,
            policy_kwargs=dict(
                critic_layers=[64, 64],
                kan_kwargs=kan_hyperparams,
            ),
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

if __name__ == "__main__":
    train()
