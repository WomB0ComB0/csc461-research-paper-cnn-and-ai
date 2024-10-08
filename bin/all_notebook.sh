#!/bin/bash

current_dir=$(pwd)

cd "$(dirname "$0")/.." || exit

cd src/notebooks || exit

source ../../venv/bin/activate

pip3 install -q -r ../../requirements.txt

for file in *.ipynb
do
    python3 -m ipykernel install --user --name=my-python3-kernel || echo "Set your kernel environment for $file"
    jupytext --execute "$file" || echo "Set your kernel environment"
done

if [ $? -ne 0 ]; then
    echo "Failed to execute the notebooks."
    exit 1
fi

deactivate

cd "$current_dir" || exit

echo -e "\n\n"
