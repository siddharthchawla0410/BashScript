
#!/bin/bash

OPTIONS=$(getopt -o p:v: --long path:,version: -- "$@")
eval set -- "$OPTIONS"
echo $OPTIONS

# Default values
# set version
export PYTHON_VERSION=3.12.4
export PYTHON_MAJOR=3
export VENV_PATH="./"
export PATH=$PWD:$PATH
echo $PATH

# Parse arguments
while [[ $# -gt 0 ]]; do
    key="$1"
    case "$key" in
        -p|--path)
            VENV_PATH="$2"
            shift 2
            ;;
        -v|--version)
            PYTHON_VERSION="$2"
            shift 2
            ;;
        --)
                shift
                break
                ;;
        *)
            echo "Unknown option: $1"
            exit 1
            ;;
    esac
done

export INSTALL_PATH=/opt/python/${PYTHON_VERSION}

$INSTALL_PATH/bin/python -m venv ${VENV_PATH}/virtualenv
