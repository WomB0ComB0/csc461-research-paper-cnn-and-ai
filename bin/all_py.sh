#!/bin/bash

# Change to the python directory
cd src/python

# For each .py file in the directory
for file in *.py
do
  # Run the Python script
  python3 "$file" || echo "Error running $file"
done

# Change back to the original directory
cd ../..

echo -e "\n\n"
