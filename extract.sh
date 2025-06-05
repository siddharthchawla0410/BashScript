#!/bin/bash

OPTIONS=$(getopt -o i:o: --long infile:,outdir: -- "$@")
eval set -- "$OPTIONS"
echo $OPTIONS
whoami
# Default values
INFILE=""
OUTDIR="./"

# Parse arguments
while [[ $# -gt 0 ]]; do
    key="$1"
    case "$key" in
        -i|--infile)
            INFILE="$2"
            shift 2
            ;;
        -o|--outdir)
            OUTDIR="$2"
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

mkdir -p $OUTDIR
tar -x -v -f $INFILE -C $OUTDIR 
