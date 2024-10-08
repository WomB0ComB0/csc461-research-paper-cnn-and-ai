#!/bin/bash

cd src/python

for file in *.py
do
  python3 "$file" || echo "Error running $file"
done

cd ../..

echo -e "\n\n"
