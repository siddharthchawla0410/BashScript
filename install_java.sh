#!/bin/bash


# set version
export JAVA_VERSION=17.0.14
export JAVA_MAJOR=17
export FILENAME=jdk-${JAVA_VERSION}_linux-x64_bin.tar.gz
export DOWNLOAD_PATH=/mnt/Shared/LinuxSetups/JDKArchives
export INSTALL_PATH=/opt/JDK/${JAVA_MAJOR}
export PATH=$PWD:$PATH
echo $PATH

#  extract java




cd $DOWNLOAD_PATH
pwd
ls
read -p "Enter JDK version (e.g., 17.0.12, 8u451): " JAVA_VERSION
FILEPATTERN=jdk-${JAVA_VERSION}_linux-x64_bin.tar.gz
FILEPATTERN2=jdk-${JAVA_VERSION}-linux-x64.tar.gz
FILENAME=$(ls|grep $FILEPATTERN)
if [[ -z "$FILENAME" ]]; then
   FILENAME=$(ls|grep $FILEPATTERN2)
fi

if [[ -n "$FILENAME" ]]; then
  echo "Selected file: $FILENAME"
else
  echo "No matching file found for version: $JAVA_VERSION"
  exit 1
fi

if [[ "$JAVA_VERSION" == *u* ]]; then
  export JAVA_MAJOR="${JAVA_VERSION%%u*}"
else
  export JAVA_MAJOR="${JAVA_VERSION%%.*}"
fi

INSTALL_PATH=/opt/JDK/${JAVA_MAJOR}

echo $JAVA_VERSION
echo $JAVA_MAJOR
extract.sh -i $FILENAME -o $INSTALL_PATH

EXTRACTED_FOLDER=$(tar -tf $FILENAME | cut -d/ -f1 | sort -u | grep -v '^$')
EXTRACTED_PATH=${INSTALL_PATH}/${EXTRACTED_FOLDER}
echo $EXTRACTED_PATH
