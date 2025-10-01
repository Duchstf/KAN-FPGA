"""
 @file   common.py
 @brief  Commonly used script
 @author Toshiki Nakamura, Yuki Nikaido, and Yohei Kawaguchi (Hitachi Ltd.)
 Copyright (C) 2020 Hitachi, Ltd. All right reserved.
"""

########################################################################
# import python-library
########################################################################
# default
import csv
import glob
import argparse
import itertools
import re
import sys
import os

# additional
import numpy
import librosa
import librosa.core
import librosa.feature
import yaml
from tqdm import tqdm

########################################################################


########################################################################
# setup STD I/O
########################################################################
"""
Standard output is logged in "baseline.log".
"""
import logging

logging.basicConfig(level=logging.DEBUG, filename="baseline.log")
logger = logging.getLogger(' ')
handler = logging.StreamHandler()
formatter = logging.Formatter('%(asctime)s - %(levelname)s - %(message)s')
handler.setFormatter(formatter)
logger.addHandler(handler)


########################################################################


########################################################################
# version
########################################################################
__versions__ = "1.0.0"
########################################################################


########################################################################
# argparse
########################################################################
def command_line_chk():
    parser = argparse.ArgumentParser(description='Without option argument, it will not run properly.')
    parser.add_argument('-v', '--version', action='store_true', help="show application version")
    parser.add_argument('-c', '--config', type=str, default = "ad08.yml", help="specify yml config")
    args = parser.parse_args()
    if args.version:
        print("===============================")
        print("HLS4ML TOYADMOS ANOMALY DETECTION\nversion {}".format(__versions__))
        print("===============================\n")
    return args
########################################################################


########################################################################
# load parameter.yaml
########################################################################
def yaml_load(config="baseline.yaml"):
    with open(config) as stream:
        param = yaml.safe_load(stream)
    return param

########################################################################


########################################################################
# file I/O
########################################################################
# wav file Input
def file_load(wav_name, mono=False):
    """
    load .wav file.

    wav_name : str
        target .wav file
    sampling_rate : int
        audio file sampling_rate
    mono : boolean
        When load a multi channels file and this param True, the returned data will be merged for mono data

    return : numpy.array( float )
    """
    try:
        return librosa.load(wav_name, sr=None, mono=mono)
    except:
        logger.error("file_broken or not exists!! : {}".format(wav_name))


def save_csv(save_file_path,
             save_data):
    with open(save_file_path, "w", newline="") as f:
        writer = csv.writer(f, lineterminator='\n')
        writer.writerows(save_data)

def save_dat(data, filename):
    numpy.savetxt(filename, data, delimiter=' ', newline='\n', fmt='%g')

########################################################################


########################################################################
# feature extractor
########################################################################
def file_to_vector_array(file_name,
                         n_mels=64,
                         frames=5,
                         n_fft=1024,
                         hop_length=512,
                         power=2.0,
                         downsample=True,
                         input_dim=640):
    """
    convert file_name to a vector array.

    file_name : str
        target .wav file

    return : numpy.array( numpy.array( float ) )
        vector array
        * dataset.shape = (dataset_size, feature_vector_length)
    """
    # 01 calculate the number of dimensions
    dims = n_mels * frames


    # 02 generate melspectrogram using librosa
    y, sr = file_load(file_name)
    mel_spectrogram = librosa.feature.melspectrogram(y=y,
                                                     sr=sr,
                                                     n_fft=n_fft,
                                                     hop_length=hop_length,
                                                     n_mels=n_mels,
                                                     power=power)
    mel_spectrogram = mel_spectrogram[:,50:250]


    # 03 convert melspectrogram to log mel energy
    log_mel_spectrogram = 20.0 / power * numpy.log10(mel_spectrogram + sys.float_info.epsilon)
    
    #03.5 trim to 50 to 250
    

    # 04 calculate total vector size
    vector_array_size = len(log_mel_spectrogram[0, :]) - frames + 1


    # 05 skip too short clips
    if vector_array_size < 1:
        return numpy.empty((0, dims))

    # 06 generate feature vectors by concatenating multiframes
    
    #downsample mel spectrogram
    if downsample:
        new_mels = 32
        new_frames = int(input_dim/new_mels)
        increment = int(n_mels / new_mels) #value by which to sample the full 128 mels for each discrete time instant in each frame. 
        offset = n_mels - new_mels*increment #ensures all vector arrays have equal size
        assert(input_dim % new_mels == 0)

        vector_array = numpy.zeros((vector_array_size, new_mels*new_frames))

        for t in range(new_frames):
            new_vec = log_mel_spectrogram[:, t: t + vector_array_size].T
            vector_array[:, new_mels * t: new_mels * (t + 1)] = new_vec[:,offset::increment]

        return vector_array
    else:
        vector_array = numpy.zeros((vector_array_size, dims))
        for t in range(frames):
            vector_array[:, n_mels * t: n_mels * (t + 1)] = log_mel_spectrogram[:, t: t + vector_array_size].T
        return vector_array

# load dataset
def select_dirs(param):
    """
    param : dict
        baseline.yaml data

    return :
        dirs :  list [ str ]
            load base directory list of dev_data
    """
    logger.info("load_directory <- development")
    dir_path = os.path.abspath("{base}/*".format(base=param["dev_directory"]))
    dirs = sorted(glob.glob(dir_path))
    return dirs

########################################################################


def get_machine_id_list_for_test(target_dir,
                                 dir_name="test",
                                 ext="wav"):
    """
    target_dir : str
        base directory path of "dev_data" or "eval_data"
    test_dir_name : str (default="test")
        directory containing test data
    ext : str (default="wav)
        file extension of audio files

    return :
        machine_id_list : list [ str ]
            list of machine IDs extracted from the names of test files
    """
    # create test files
    dir_path = os.path.abspath("{dir}/{dir_name}/*.{ext}".format(dir=target_dir, dir_name=dir_name, ext=ext))
    print('dir_path: {}'.format(dir_path))
    file_paths = sorted(glob.glob(dir_path))
    # extract id
    machine_id_list = sorted(list(set(itertools.chain.from_iterable(
        [re.findall('id_[0-9][0-9]', ext_id) for ext_id in file_paths]))))
    return machine_id_list


def test_file_list_generator(target_dir,
                             id_name,
                             dir_name="test",
                             prefix_normal="normal",
                             prefix_anomaly="anomaly",
                             ext="wav"):
    """
    target_dir : str
        base directory path of the dev_data or eval_data
    id_name : str
        id of wav file in <<test_dir_name>> directory
    dir_name : str (default="test")
        directory containing test data
    prefix_normal : str (default="normal")
        normal directory name
    prefix_anomaly : str (default="anomaly")
        anomaly directory name
    ext : str (default="wav")
        file extension of audio files

    return :
        if the mode is "development":
            test_files : list [ str ]
                file list for test
            test_labels : list [ boolean ]
                label info. list for test
                * normal/anomaly = 0/1
        if the mode is "evaluation":
            test_files : list [ str ]
                file list for test
    """
    logger.info("target_dir : {}".format(target_dir+"_"+id_name))

    # development
    normal_files = sorted(
        glob.glob("{dir}/{dir_name}/{prefix_normal}_{id_name}*.{ext}".format(dir=target_dir,
                                                                                dir_name=dir_name,
                                                                                prefix_normal=prefix_normal,
                                                                                id_name=id_name,
                                                                                ext=ext)))
    normal_labels = numpy.zeros(len(normal_files))
    anomaly_files = sorted(
        glob.glob("{dir}/{dir_name}/{prefix_anomaly}_{id_name}*.{ext}".format(dir=target_dir,
                                                                                dir_name=dir_name,
                                                                                prefix_anomaly=prefix_anomaly,
                                                                                id_name=id_name,
                                                                                ext=ext)))
    anomaly_labels = numpy.ones(len(anomaly_files))
    files = numpy.concatenate((normal_files, anomaly_files), axis=0)
    labels = numpy.concatenate((normal_labels, anomaly_labels), axis=0)
    logger.info("test_file  num : {num}".format(num=len(files)))
    if len(files) == 0:
        logger.exception("no_wav_file!!")
    print("\n========================================")

    return files, labels
########################################################################

def list_to_vector_array(file_list,
                         msg="calc...",
                         n_mels=64,
                         frames=5,
                         n_fft=1024,
                         hop_length=512,
                         power=2.0,
                         downsample=False,
                         input_dims=640):
    """
    convert the file_list to a vector array.
    file_to_vector_array() is iterated, and the output vector array is concatenated.

    file_list : list [ str ]
        .wav filename list of dataset
    msg : str ( default = "calc..." )
        description for tqdm.
        this parameter will be input into "desc" param at tqdm.

    return : numpy.array( numpy.array( float ) )
        vector array for training (this function is not used for test.)
        * dataset.shape = (number of feature vectors, dimensions of feature vectors)
    """
    # calculate the number of dimensions
    dims = n_mels * frames
    mels = 32
    print(f'length of files_list is {len(file_list)}')

    # iterate file_to_vector_array()
    for idx in tqdm(range(len(file_list)), desc=msg):
        vector_array = file_to_vector_array(file_list[idx],
                                                n_mels=n_mels,
                                                frames=frames,
                                                n_fft=n_fft,
                                                hop_length=hop_length,
                                                power=power,
                                                downsample=downsample,
                                                input_dim=input_dims)
        if idx == 0:
            if downsample:
                dataset = numpy.zeros((vector_array.shape[0] * len(file_list), input_dims), float)
            else:
                dataset = numpy.zeros((vector_array.shape[0] * len(file_list), dims), float)
        dataset[vector_array.shape[0] * idx: vector_array.shape[0] * (idx + 1), :] = vector_array
    print("Shape of dataset: {}".format(dataset.shape))
    return dataset


def file_list_generator(target_dir,
                        dir_name="train",
                        ext="wav"):
    """
    target_dir : str
        base directory path of the dev_data or eval_data
    dir_name : str (default="train")
        directory name containing training data
    ext : str (default="wav")
        file extension of audio files

    return :
        train_files : list [ str ]
            file list for training
    """
    logger.info("target_dir : {}".format(target_dir))

    # generate training list
    training_list_path = os.path.abspath("{dir}/{dir_name}/*.{ext}".format(dir=target_dir, dir_name=dir_name, ext=ext))
    files = sorted(glob.glob(training_list_path))
    if len(files) == 0:
        logger.exception("no_wav_file!!")

    logger.info("train_file num : {num}".format(num=len(files)))
    return files
########################################################################