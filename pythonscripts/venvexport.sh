#!/bin/bash

OPTIONS=$(getopt -o n: --long num: -- "$@")

eval set -- "$OPTIONS"
echo $OPTIONS
whoami
# Default values
ENV_NUM=""

# Parse arguments
while [[ $# -gt 0 ]]; do
    key="$1"
    case "$key" in
        -n|--num)
            ENV_NUM="$2"
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

# --- Validate input ---
if [ -z "$ENV_NUM" ]; then
    echo "Error: Environment number not specified."
    echo "Use -h or --help for usage."
    exit 1
fi

# --- Set virtual environment path ---
VENV_LOC="/opt/venvs/env${ENV_NUM}/virtualenv/bin"

if [ ! -d "$VENV_LOC" ]; then
    echo "Error: Virtual environment directory $VENV_LOC does not exist."
    exit 2
fi

# --- Export PATH ---
export PATH="$VENV_LOC:$PATH"
echo "✅ Activated environment: env${ENV_NUM}"
echo "🔧 PATH updated: $VENV_LOC prepended to PATH"