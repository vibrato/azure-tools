#!/bin/sh

set -e
export AZ_CLI_VERSION=$1

docker build --pull --build-arg AZ_CLI_VERSION=$AZ_CLI_VERSION -t vibrato/azure-tools:latest -t vibrato/azure-tools:$AZ_CLI_VERSION .
