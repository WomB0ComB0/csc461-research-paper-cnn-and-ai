#!/bin/bash

# Change to the directory containing R files
cd "$(dirname "$0")/../.."
cd src/scripts

# Loop through each R file specified as command-line arguments
for file in "$@"
do
    # Run each R script
    Rscript "$file.r"
done
