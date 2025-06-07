#!/bin/bash


# set version
export PYTHON_VERSION=3.6.2
export PYTHON_MAJOR=3
export FILENAME=Python-${PYTHON_VERSION}.tgz
export DOWNLOAD_URL=https://www.python.org/ftp/python/${PYTHON_VERSION}/$FILENAME
export DOWNLOAD_PATH=/mnt/Shared/LinuxSetups/PythonSrcArchives/$PYTHON_VERSION
export EXTRACT_PATH=/opt/PythonSrc/
export BUILD_PATH=${EXTRACT_PATH}/Python-${PYTHON_VERSION}
export INSTALL_PATH=/opt/python/${PYTHON_VERSION}
export PATH=$PWD:$PATH
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
#    --enable-optimizations \
    --enable-ipv6 \
    --with-ensurepip=install \
    LDFLAGS=-Wl,-rpath=${INSTALL_PATH}/lib,--disable-new-dtags

make
sudo make altinstall


#make symbolic link
cd $INSTALL_PATH
cd bin
export PYTHON_BINARY=$(ls|grep python|grep -v config|head -n 1)
export PIP_BINARY=$(ls|grep pip|head -n 1)
ln -s $PYTHON_BINARY python
ln -s $PIP_BINARY pip
