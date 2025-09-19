# train.py (PPO Version)
import os
import gymnasium as gym
from stable_baselines3 import PPO
from stable_baselines3.common.monitor import Monitor

# --- Configuration ---
ENV_ID = "HalfCheetah-v4"
TOTAL_TIMESTEPS = 1_000_000
LOGS_BASE_DIR = "logs" # Use a different log directory
SEED = 42

def train_ppo_agent():
    """
    Sets up and trains a PPO agent with a custom MLP architecture.
    """
    run_name = f"{ENV_ID}_seed_{SEED}"
    log_dir = os.path.join(LOGS_BASE_DIR, run_name)
    os.makedirs(log_dir, exist_ok=True)

    print(f"Starting PPO training for {run_name}")
    print(f"Logs will be saved to: {log_dir}")

    # 1. Create and wrap the environment for logging
    env = gym.make(ENV_ID)
    env = Monitor(env, log_dir)

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