#!/bin/bash

# Set source directories
python_dir="src/python"
notebooks_dir="src/notebooks"
scripts_dir="src/scripts"

# Set destination directories for non-image files
scripts_image_dir="images/scripts/out"
python_image_dir="images/python/out"
notebooks_image_dir="images/notebooks/out"

# Set destination directories for miscellaneous files
scripts_misc_dir="out/scripts"
python_misc_dir="out/python"
notebooks_misc_dir="out/notebooks"

# Move non-image files to the respective output directories
# Move PDF files to scripts_image_dir
mv "$scripts_dir"/*.pdf "$scripts_image_dir" 2>/dev/null

# Move Python output files to python_image_dir
mv "$python_dir"/*.csv "$python_image_dir" 2>/dev/null
mv "$python_dir"/*.txt "$python_image_dir" 2>/dev/null

# Move notebooks output files to notebooks_image_dir
mv "$notebooks_dir"/*.html "$notebooks_image_dir" 2>/dev/null
mv "$notebooks_dir"/*.pdf "$notebooks_image_dir" 2>/dev/null

for file in "$scripts_dir"/* "$python_dir"/* "$notebooks_dir"/*; do
    if [ -f "$file" ]; then
        extension="${file##*.}"
        case "$extension" in
            jpg|jpeg|png|gif) continue ;;
            *) mkdir -p "out/${extension}" ;;
        esac
    fi
done

# Move miscellaneous files to the respective directories based on file extensions
mv "$scripts_dir"/* "out/scripts" 2>/dev/null
mv "$python_dir"/* "out/python" 2>/dev/null
mv "$notebooks_dir"/* "out/notebooks" 2>/dev/null
