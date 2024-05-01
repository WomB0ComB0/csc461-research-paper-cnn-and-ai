#!/bin/bash

# Run all the all_*.sh files in the bin directory
for script in $(find ./ -name 'all_*.sh'); do
    echo "Running $script..."
    bash "$script"
    echo "Finished running $script."
done
