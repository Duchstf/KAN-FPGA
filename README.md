# KAN-FPGA
Implementations of KAN on FPGA Paper at FPGA'2025

Authors: Aarush Gupta (MIT), Duc Hoang (MIT)

# Train and evaluate the models on our benchmarks

1. (Optional, we provided the environment in the `environment.yml` file, see [Conda](#Conda) section for setting up) Activate the environment:
```
conda activate kan
```
2. Next, to train the model in each benchmark:

```
cd benchmarks/<bench-mark-name>
```

```
python train.py
```

Where benchmark names could be `jets`, `anomaly` or `mnist`. This will generate the trained model saved in `benchmarks/<bench-mark-name>/models` 

3. Then, to convert the trained model to hardware, in the same benchmark directory:

```
python convert.py
```


# Related FPGA benchmarks information
* Xilinx Virtex UltraScale+ FPGA: `xcvu9p-flgb2104-2-i`
* Vivado version: 

# Conda 

Create conda environment:

```
conda env create -f environment.yml
```

Activate the environment:

```
conda activate kan
```

And then do whatever you want in this environment (edit files, open notebooks, etc.). To deactivate the environment:

```
conda deactivate
```

If you make any update for the environment, please edit the `environment.yml` file and run:

```
conda env update --file environment.yml  --prune
```

Reference on conda environment here: https://docs.conda.io/projects/conda/en/latest/user-guide/tasks/manage-environments.html
