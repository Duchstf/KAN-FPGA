# MLPerf Tiny anomaly detection KAN model

This is the MLPerf Tiny anomaly KAN model, based on the baseline system for the
DCASE 2020 Challenge Task 2 "Unsupervised Detection of Anomalous Sounds for Machine Condition Monitoring". 

The description of the original challenge is available at:
http://dcase.community/challenge2020/task-unsupervised-detection-of-anomalous-sounds

Codes are adapted from the official tiny ml perf website: https://github.com/mlcommons/tiny/tree/master/benchmark/training/anomaly_detection

## Quick start


``` Bash
# Download training data from Zenodo
./get_dataset.sh

#Then you can run the mock training within the 'kan' conda environment
python 00_train.py --dev

```