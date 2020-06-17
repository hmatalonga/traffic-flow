#!/usr/bin/env bash

NOTEBOOKS_DIR=${1:-$PWD/notebooks}

docker run --rm -it -v "$NOTEBOOKS_DIR":/opt/notebooks -p 8888:8888 hmatalonga/traffic-flow
