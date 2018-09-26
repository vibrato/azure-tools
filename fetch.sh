#!/bin/sh

set -e

download() {
  export APP_NAME="/$1"
  TF_TAGS_FEED="https://releases.hashicorp.com${APP_NAME}/"
  LATEST_VERSION=$(curl -s "$TF_TAGS_FEED" | awk 'match($0,ENVIRON["APP_NAME"]) {match($0,/[0-9\.]+/); print substr($0,RSTART,RLENGTH); exit}' )
  if [ ! -f ".${APP_NAME}_${LATEST_VERSION}_linux_amd64.zip" ]; then
    curl -LO "https://releases.hashicorp.com${APP_NAME}/${LATEST_VERSION}${APP_NAME}_${LATEST_VERSION}_linux_amd64.zip"
    unzip -u ".${APP_NAME}_${LATEST_VERSION}_linux_amd64.zip"
    rm ".${APP_NAME}_${LATEST_VERSION}_linux_amd64.zip"
  fi
}

download 'terraform'
# download 'terraform-provider-azurerm'
# download 'terraform-provider-null'
# download 'terraform-provider-template'
# download 'terraform-provider-random'

