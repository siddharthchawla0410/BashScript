#!/bin/bash

OPTIONS=$(getopt -o i:o: --long indir:,outfile: -- "$@")
eval set -- "$OPTIONS"
echo $OPTIONS
whoami
# Default values
INDIR=""
OUTFILE=""

# Parse arguments
while [[ $# -gt 0 ]]; do
    key="$1"
    case "$key" in
        -i|--indir)
            INDIR="$2"
            shift 2
            ;;
        -o|--outfile)
            OUTFILE="$2"
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

# Check for mandatory arguments
if [[ -z "$INDIR" || -z "$OUTFILE" ]]; then
    echo "Error: --indir and --outfile are required." >&2
    exit 1
fi

# Check if input directory exists
if [[ ! -d "$INDIR" ]]; then
    echo "Error: Input directory '$INDIR' does not exist." >&2
    exit 1
fi

# Create output directory if necessary
OUTFILE=$(readlink -m -n $OUTFILE)
OUTDIR=$(dirname $OUTFILE)
echo $OUTFILE
echo $OUTDIR
source path_utils.sh

if is_valid_path_format $OUTDIR; then
    echo "Path is valid"
    mkdir -p $OUTDIR
else
    echo "Path is invalid" >&2
    exit 1
fi

tar -c -v -f $OUTFILE $INDIR
