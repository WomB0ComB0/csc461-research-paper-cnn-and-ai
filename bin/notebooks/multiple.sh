#!/bin/bash

# Store the current directory
current_dir=$(pwd)

# Navigate to the root directory
cd "$(dirname "$0")/../.."

# Navigate to the notebooks directory
cd "src/notebooks" || exit

source ../../venv/bin/activate

# Install requirements
pip3 install -q -r ../../requirements.txt

# Check if jupytext is installed, if not, install it
if ! command -v jupytext &> /dev/null; then
    pip3 install jupytext
fi

# Check if the notebook file is provided as an argument
if [ $# -eq 0 ]; then
    echo "Usage: $0 <notebook>"
    exit 1
fi

# For each provided notebook file
for file in "$@"
do
    # Check if the file exists
    if [ ! -f "$file.ipynb" ]; then
        echo "Notebook file '$file.ipynb' not found."
        exit 1
    fi

    # Execute the notebook
    jupytext --execute "$file.ipynb" || echo "Set your kernel environment"
done

# Deactivate the virtual environment
deactivate
