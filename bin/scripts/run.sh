#!/bin/bash

# Get the R file name from the command-line argument
file=$1

# Change to the scripts directory
cd "$(dirname "$0")/../.."
cd src/scripts

# Run the specified R script
Rscript "$file.r"