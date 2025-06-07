#!/bin/bash


# LOCAL VARS
JAVA_VERSION_INSTALL=8u451
# export JAVA_MAJOR=17
FILENAME=jdk-${JAVA_VERSION_INSTALL}_linux-x64_bin.tar.gz
DOWNLOAD_PATH=${SETUP_PATH}/JDKArchives
INSTALL_PATH=${WORKSPACE_PATH}/JDK/${JAVA_VERSION_INSTALL}
PATH=$PWD:$PATH
echo $PATH

#  extract java




cd $DOWNLOAD_PATH
pwd
ls
read -p "Enter JDK version (e.g., 17.0.12, 8u451): " JAVA_VERSION_INSTALL
FILEPATTERN=jdk-${JAVA_VERSION_INSTALL}_linux-x64_bin.tar.gz
FILEPATTERN2=jdk-${JAVA_VERSION_INSTALL}-linux-x64.tar.gz
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

#if [[ "$JAVA_VERSION" == *u* ]]; then
#  export JAVA_MAJOR="${JAVA_VERSION%%u*}"
#else
#  export JAVA_MAJOR="${JAVA_VERSION%%.*}"
#fi

INSTALL_PATH=/opt/JDK/${JAVA_VERSION_INSTALL}

echo $JAVA_VERSION_INSTALL
#echo $JAVA_MAJOR
extract.sh -i $FILENAME -o $INSTALL_PATH

EXTRACTED_FOLDER=$(tar -tf $FILENAME | cut -d/ -f1 | sort -u | grep -v '^$')
EXTRACTED_PATH=${INSTALL_PATH}/${EXTRACTED_FOLDER}
echo $EXTRACTED_PATH
