#!/bin/bash

#GLOBAL VARS
# SETUP_PATH
# WORKSPACE_PATH

# LOCAL VARS
PYTHON_VERSION_INSTALL=3.12.4
FILENAME=Python-${PYTHON_VERSION_INSTALL}.tgz
DOWNLOAD_URL=https://www.python.org/ftp/python/${PYTHON_VERSION_INSTALL}/${FILENAME}
DOWNLOAD_PATH=${SETUP_PATH}/PythonSrcArchives/${PYTHON_VERSION_INSTALL}
EXTRACT_PATH=${WORKSPACE_PATH}/PythonSrc/
BUILD_PATH=${EXTRACT_PATH}/Python-${PYTHON_VERSION_INSTALL}
INSTALL_PATH=${WORKSPACE_PATH}/python/${PYTHON_VERSION_INSTALL}
PATH=$PWD:$PATH
echo $PATH

#  download and extract python
mkdir -p $DOWNLOAD_PATH
cd $DOWNLOAD_PATH
pwd
curl -O $DOWNLOAD_URL
extract.sh -i $FILENAME -o $EXTRACT_PATH

sudo apt-get update
sudo apt-get install \
    curl \
    gcc \
    libbz2-dev \
    libev-dev \
    libffi-dev \
    libgdbm-dev \
    liblzma-dev \
    libncurses-dev \
    libreadline-dev \
    libsqlite3-dev \
    libssl-dev \
    make \
    tk-dev \
    wget \
    zlib1g-dev \
    libgdbm-compat-dev

cd ${BUILD_PATH}
pwd
mkdir -p ${INSTALL_PATH}
chmod 0777 -R ${BUILD_PATH}
chmod 0777 -R ${INSTALL_PATH}
./configure \
    --prefix=${INSTALL_PATH} \
    --enable-shared \
    --enable-optimizations \
    --enable-ipv6 \
    --with-ensurepip=install \
    LDFLAGS=-Wl,-rpath=${INSTALL_PATH}/lib,--disable-new-dtags

make
sudo make altinstall


#make symbolic link
cd $INSTALL_PATH
cd bin
PYTHON_BINARY=$(ls|grep python|grep -v config|head -n 1)
PIP_BINARY=$(ls|grep pip|head -n 1)
ln -s $PYTHON_BINARY python
ln -s $PIP_BINARY pip
