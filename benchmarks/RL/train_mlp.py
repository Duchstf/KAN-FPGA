# train.py (PPO Version)
import os
import gymnasium as gym
from stable_baselines3 import PPO
from stable_baselines3.common.monitor import Monitor

from stable_baselines3.common.env_util import make_vec_env
from stable_baselines3.common.vec_env import VecNormalize

# --- Configuration ---
ENV_ID = "HalfCheetah-v5"
TOTAL_TIMESTEPS = 5_000_000
LOG_DIR = "logs_mlp" # Use a different log directory
SEED = 42

def train_ppo_agent():
    """
    Sets up and trains a PPO agent with a custom MLP architecture.
    """
    log_dir = os.path.join(LOG_DIR)
    os.makedirs(log_dir, exist_ok=True)
    print(f"Logs will be saved to: {log_dir}")

    # 1. Create and wrap the environment for logging
    env = make_vec_env(ENV_ID, n_envs=5, seed=SEED, monitor_dir=LOG_DIR)
    env = VecNormalize(env, norm_reward=True, norm_obs=True, gamma=0.99)

    # 2. Define the custom MLP architecture for Actor (pi) and Critic (vf)
    # For PPO, the critic is the Value Function ('vf').
    policy_kwargs = dict(
        net_arch=dict(
            pi=[64, 64],  # Actor (policy) network
            vf=[64, 64]   # Critic (value function) network
        )
    )

    # 3. Instantiate the PPO model
    model = PPO(
        "MlpPolicy",
        env,
        policy_kwargs=policy_kwargs,
        verbose=1,
        seed=SEED,
        n_steps=2048,      # Number of steps to collect per environment before updating
        batch_size=64,     # Minibatch size for the update
        n_epochs=10,       # Number of optimization epochs per update
        gamma=0.99,
        tensorboard_log=log_dir
    )

    # 4. Start training
    model.learn(total_timesteps=TOTAL_TIMESTEPS)

    print("Training finished.")
    env.close()

if __name__ == "__main__":
    train_ppo_agent()