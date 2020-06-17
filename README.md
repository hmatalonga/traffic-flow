# Traffic Flow Analysis

Academic project built to predict traffic conditions for Braga city center, Portugal.

Datasets used can be found at `notebooks/data` folder.

The main analysis is located at the [LSTMFlow](notebooks/LSTMFlow.ipynb) notebook. It implements a LSTM model trained on the dataset `flow.csv` to predict certain traffic features for the main roads of Braga city center. All remaining notebooks are helper to clean and prepare the data for the analysis. It also contains a few csv files with feature engineering for the final dataset version.

## Setup
```shell
$ docker build -t hmatalonga/traffic-flow ./setup
```

## Deploy
```shell
$ sh jupyter-server.sh  # Runs jupyter at http://localhost:8888
```
