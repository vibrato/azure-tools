#!/bin/sh

set -e

docker build --pull -t vibrato/azure-tools:latest -t vibrato/azure-tools:$(date '+%s') .
