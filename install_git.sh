#!/bin/bash


# set version
export GIT_VERSION=2.49.0
export GIT_MAJOR=2
export FILENAME=git-${GIT_VERSION}.tar.gz
export DOWNLOAD_URL=https://www.kernel.org/pub/software/scm/git/${FILENAME}
export DOWNLOAD_PATH=/mnt/Shared/LinuxSetups/GitSrcArchives/$GIT_VERSION
export EXTRACT_PATH=/opt/GitSrc/
export BUILD_PATH=${EXTRACT_PATH}/git-${GIT_VERSION}
export INSTALL_PATH=/opt/git/${GIT_VERSION}
export PATH=$PWD:$PATH
echo $PATH

#  download and extract python
mkdir -p $DOWNLOAD_PATH
cd $DOWNLOAD_PATH
pwd
curl -O $DOWNLOAD_URL
extract.sh -i $FILENAME -o $EXTRACT_PATH

sudo apt update
sudo apt install libz-dev libssl-dev libcurl4-gnutls-dev libexpat1-dev gettext cmake gcc

cd $BUILD_PATH
make prefix=$INSTALL_PATH all
sudo make prefix=$INSTALL_PATH install
