#!/bin/bash

cd src/scripts

echo $(pwd)
for file in *.r
do
  Rscript "$file" || echo "Error running $file"
done

cd ../..

echo -e "\n\n"
