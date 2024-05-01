#!/bin/bash

# Change to the python directory
cd "$(dirname "$0")/../.."
cd src/python

# Run the specified Python script
for file in "$@"
do
  python "$file.py"
done