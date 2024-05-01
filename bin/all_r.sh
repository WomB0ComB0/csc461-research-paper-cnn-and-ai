#!/bin/bash

# Change to the scripts directory
cd src/scripts

echo $(pwd)
# For each .R file in the directory
for file in *.r
do
  # Run the R script
  Rscript "$file" || echo "Error running $file"
done

# Return to the original directory
cd ../..

echo -e "\n\n"
