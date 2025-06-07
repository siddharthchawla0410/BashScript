#!/bin/bash
# GLOBAL VARS
# SETUP PATH
# WORKSPACE PATH

# LOCAL VARIABLES
GIT_VERSION_INSTALL=2.48.0
FILENAME=git-${GIT_VERSION_INSTALL}.tar.gz
DOWNLOAD_URL=https://www.kernel.org/pub/software/scm/git/${FILENAME}
DOWNLOAD_PATH=${SETUP_PATH}/GitSrcArchives/${GIT_VERSION_INSTALL}
export EXTRACT_PATH=${WORKSPACE_PATH}/GitSrc/
export BUILD_PATH=${EXTRACT_PATH}/git-${GIT_VERSION_INSTALL}
export INSTALL_PATH=${WORKSPACE_PATH}/git/${GIT_VERSION_INSTALL}
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
