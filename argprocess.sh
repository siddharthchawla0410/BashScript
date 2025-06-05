#!/bin/bash

# Default values
INDIR=""
OUTDIR=""
FILES=()
SHOW_HELP=false

# Help message
function show_help() {
    echo "Usage: $0 -i DIR -o DIR -f FILE1 [FILE2 ...] [-h]"
    echo ""
    echo "Options:"
    echo "  -i, --indir DIR      Input directory"
    echo "  -o, --outdir DIR     Output directory"
    echo "  -f, --files FILES    List of files (variable number)"
    echo "  -h, --help           Show this help message"
    exit 0
}

# Parse arguments
while [[ $# -gt 0 ]]; do
    key="$1"
    case "$key" in
        -i|--indir)
            INDIR="$2"
            shift 2
            ;;
        -o|--outdir)
            OUTDIR="$2"
            shift 2
            ;;
        -f|--files)
            shift
            # Collect files until next flag or end
            while [[ $# -gt 0 && "$1" != -* ]]; do
                FILES+=("$1")
                shift
            done
            ;;
        -h|--help)
            SHOW_HELP=true
            shift
            ;;
        *)
            echo "Unknown option: $1"
            exit 1
            ;;
    esac
done

# Show help if requested
if $SHOW_HELP; then
    show_help
fi

# Validate required options
if [[ -z "$INDIR" || -z "$OUTDIR" || ${#FILES[@]} -eq 0 ]]; then
    echo "Error: -i/--indir, -o/--outdir, and -f/--files are required"
    show_help
fi

# Output parsed values
echo "
