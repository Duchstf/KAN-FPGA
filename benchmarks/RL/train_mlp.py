# train.py (PPO Version)
import os
import gymnasium as gym
from stable_baselines3 import PPO
from stable_baselines3.common.monitor import Monitor


# --- Configuration ---
ENV_ID = "HalfCheetah-v5"
TOTAL_TIMESTEPS = 1_000_000
LOG_DIR = "logs_mlp" # Use a different log directory

def train_ppo_agent():
    """
    Sets up and trains a PPO agent with a custom MLP architecture.
    """
    log_dir = os.path.join(LOG_DIR)
    os.makedirs(log_dir, exist_ok=True)
    print(f"Logs will be saved to: {log_dir}")


    for seed in [0,1,2,3,4]:
        env = gym.make(ENV_ID)
        env.reset(seed=seed)
        env = Monitor(env, os.path.join(LOG_DIR, f"seed_{seed}"))

        policy_kwargs = dict(
            net_arch=dict(
                pi=[64, 64],  
                vf=[64, 64]
            )
        )

        model = PPO(
            "MlpPolicy",
            env,
            policy_kwargs=policy_kwargs,
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

        model.learn(total_timesteps=TOTAL_TIMESTEPS)

        env.close()

if __name__ == "__main__":
    train_ppo_agent()