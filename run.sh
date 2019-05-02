#!/usr/bin/env bash

NOTEBOOKS_DIR=${1:-$PWD/notebooks}
DEPS=$(cat requirements.txt | tr '\r\n' ' ')
BASH_SCRIPT="pip install --no-cache-dir $DEPS && jupyter notebook --ip='0.0.0.0' --port=8888 --notebook-dir=/opt/notebooks --no-browser --allow-root --NotebookApp.token='' --NotebookApp.password=''"

docker run --rm -dt -v "$NOTEBOOKS_DIR":/opt/notebooks -p 8888:8888 python:3.7-slim sh -c "$BASH_SCRIPT"
