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

# Check if the notebook file is provided as an argument
if [ $# -ne 1 ]; then
    echo "Usage: $0 <notebook>"
    exit 1
fi

# Assign the notebook filename to a variable
notebook="$1"

# Check if the notebook file exists
if [ ! -f "$notebook.ipynb" ]; then
    echo "Notebook file '$notebook.ipynb' not found."
    exit 1
fi

# Execute all cells in the notebook
jupytext --execute "$notebook.ipynb" || echo "Set your kernel environment"

# Check if execution was successful
if [ $? -ne 0 ]; then
    echo "Failed to execute the notebook."
    exit 1
fi

# Deactivate the virtual environment
deactivate

# Return to the original directory
cd "$current_dir"
