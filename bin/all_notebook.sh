#!/bin/bash

# Store the current directory
current_dir=$(pwd)

# Navigate to the notebooks directory
cd "$(dirname "$0")/.." || exit

# Navigate to the notebooks directory
cd src/notebooks || exit

# Activate the virtual environment
source ../../venv/bin/activate

# Install requirements
pip3 install -q -r ../../requirements.txt

# For each .ipynb file in the directory
for file in *.ipynb
do
    # Execute the notebook
    python3 -m ipykernel install --user --name=my-python3-kernel || echo "Set your kernel environment for $file"

    jupytext --execute "$file" || echo "Set your kernel environment"
done

# Check if execution was successful
if [ $? -ne 0 ]; then
    echo "Failed to execute the notebooks."
    exit 1
fi

# Deactivate the virtual environment
deactivate

# Return to the original directory
cd "$current_dir" || exit

echo -e "\n\n"
