#!/bin/bash


# set version
export NODE_VERSION=22.15.0
export NODE_MAJOR=22
export FILENAME=node-v${NODE_VERSION}-linux-x64.tar.xz
export DOWNLOAD_URL=https://nodejs.org/download/release/v${NODE_VERSION}/${FILENAME}
export DOWNLOAD_PATH=/mnt/Shared/LinuxSetups/NodeJSArchives/$NODE_VERSION
export INSTALL_PATH=/opt/nodejs/${NODE_VERSION}
export PATH=$PWD:$PATH
echo $PATH

#  download and extract node
mkdir -p $DOWNLOAD_PATH
cd $DOWNLOAD_PATH
pwd
curl -O $DOWNLOAD_URL
extract.sh -i $FILENAME -o $INSTALL_PATH


