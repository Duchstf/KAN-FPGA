import os
import glob
import sys

import torch
import numpy
from tqdm import tqdm
import common as com
import numpy as np

def get_train_AD_data():

    param = com.yaml_load()

    data_dir = com.select_dirs(param=param)[0]

    files = com.file_list_generator(data_dir, dir_name="train")

    res = com.list_to_vector_array(files,
                                    msg="generate trai_dataset",
                                    n_mels=param["feature"]["n_mels"],
                                    frames=param["feature"]["frames"],
                                    n_fft=param["feature"]["n_fft"],
                                    hop_length=param["feature"]["hop_length"],
                                    power=param["feature"]["power"],
                                    downsample=param["feature"]["downsample"],
                                    input_dims=param["model"]["input_dim"])

    samples_per_file = res.shape[0] // len(files) 
    print("Samples per file: ", samples_per_file)

    return res, np.repeat([1 if "anomaly" in file.split("/")[-1] else 0 for file in files], samples_per_file)

def get_test_AD_data():

    param = com.yaml_load()

    data_dir = com.select_dirs(param=param)[0]

    machine_id_list = com.get_machine_id_list_for_test(data_dir)

    data_array = []
    labels = []

    for _id, id_str in enumerate(sorted(machine_id_list)):
        test_files, y_true = com.test_file_list_generator(data_dir, id_str)

        for file_idx, file_path in tqdm(enumerate(test_files), total=len(test_files)):
            try:
                data = com.file_to_vector_array(file_path,
                                                n_mels=param["feature"]["n_mels"],
                                                frames=param["feature"]["frames"],
                                                n_fft=param["feature"]["n_fft"],
                                                hop_length=param["feature"]["hop_length"],
                                                power=param["feature"]["power"],
                                                downsample=param["feature"]["downsample"],
                                                input_dim=param["model"]["input_dim"])

                data_array.append(data)
                labels.append((y_true[file_idx], _id))

            except Exception as e:
                com.logger.error("file broken!!: {}, {}".format(file_path, e))
    
    return np.array(data_array), np.array(labels)
