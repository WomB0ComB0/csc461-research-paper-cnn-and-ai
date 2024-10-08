#!/bin/bash

# Get the Python file name from the command-line argument
file=$1

# Change to the python directory
cd "$(dirname "$0")/../.."
cd src/python

# Run the specified Python script
python "$file.py"