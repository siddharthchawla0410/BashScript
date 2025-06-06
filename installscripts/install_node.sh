#!/bin/bash

# GLOBAL VARS
#  SETUP_PATH
#  WORKSPACE_PATH

# LOCAL VARS
NODE_VERSION_INSTALL=22.5.1
FILENAME=node-v${NODE_VERSION_INSTALL}-linux-x64.tar.xz
DOWNLOAD_URL=https://nodejs.org/download/release/v${NODE_VERSION_INSTALL}/${FILENAME}
DOWNLOAD_PATH=${SETUP_PATH}/NodeJSArchives/${NODE_VERSION_INSTALL}
INSTALL_PATH=${WORKSPACE_PATH}/nodejs/${NODE_VERSION_INSTALL}
PATH=$PWD:$PATH
echo $PATH

#  download and extract node
mkdir -p $DOWNLOAD_PATH
cd $DOWNLOAD_PATH
pwd
curl -O $DOWNLOAD_URL
extract.sh -i $FILENAME -o $INSTALL_PATH


