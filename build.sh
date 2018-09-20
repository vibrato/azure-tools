#!/bin/sh

set -e

docker build --pull -t vibrato/azuretools:latest -t vibrato/azuretools:$(date '+%s') .
