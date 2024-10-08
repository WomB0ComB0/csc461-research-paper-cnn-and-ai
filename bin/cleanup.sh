#!/bin/bash

python_dir="src/python"
notebooks_dir="src/notebooks"
scripts_dir="src/scripts"

scripts_image_dir="images/scripts/out"
python_image_dir="images/python/out"
notebooks_image_dir="images/notebooks/out"

scripts_misc_dir="out/scripts"
python_misc_dir="out/python"
notebooks_misc_dir="out/notebooks"

mv "$scripts_dir"/*.pdf "$scripts_image_dir" 2>/dev/null || true

mv "$python_dir"/*.csv "$python_image_dir" 2>/dev/null || true
mv "$python_dir"/*.txt "$python_image_dir" 2>/dev/null || true

mv "$notebooks_dir"/*.html "$notebooks_image_dir" 2>/dev/null || true
mv "$notebooks_dir"/*.pdf "$notebooks_image_dir" 2>/dev/null || true

exclude_extensions=("py" "r" "ipynb")

for file in "$scripts_dir"/*; do
    if [ -f "$file" ]; then
        extension="${file##*.}" 
        if [[ ! " ${exclude_extensions[@]} " =~ " $extension " ]]; then
            mkdir -p "$scripts_misc_dir/${extension}" && mv "$file" "$scripts_misc_dir/${extension}"
        fi
    fi
done

for file in "$python_dir"/*; do
    if [ -f "$file" ]; then
        extension="${file##*.}"
        if [[ ! " ${exclude_extensions[@]} " =~ " $extension " ]]; then
            mkdir -p "$python_misc_dir/${extension}" && mv "$file" "$python_misc_dir/${extension}"
        fi
    fi
done

for file in "$notebooks_dir"/*; do
    if [ -f "$file" ]; then
        extension="${file##*.}"
        if [[ ! " ${exclude_extensions[@]} " =~ " $extension " ]]; then
            mkdir -p "$notebooks_misc_dir/${extension}" && mv "$file" "$notebooks_misc_dir/${extension}"
        fi
    fi
done