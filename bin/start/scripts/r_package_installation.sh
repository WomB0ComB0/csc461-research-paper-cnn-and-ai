#!/bin/bash

if ! command -v R &> /dev/null; then
    echo "R is not installed. Please install R on your system."
    exit 1
fi

REQUIREMENTS_FILE="./requiments.txt"

case "$(uname)" in
    Darwin)
        echo "R installation scripts for Mac OS X platform"
        ;;
    Linux)
        echo "R installation scripts for GNU/Linux platform"
        if ! command -v apt-get &> /dev/null; then
            echo "apt-get command not found"
            exit 1
        fi
        if ! command -v sudo &> /dev/null; then
            echo "sudo command not found"
            exit 1
        fi
        echo "GNU/Linux platform detected."
        ;;
    MINGW32_NT*|MINGW64_NT*)
        echo "R installation scripts for Windows platform"
        if ! command -v choco &> /dev/null; then
            echo "Chocolatey command not found. Please install Chocolatey."
            exit 1
        fi
        ;;
    *)
        echo "Unsupported platform"
        exit 1
        ;;
esac

if [ -f "$REQUIREMENTS_FILE" ]; then
    if [ ! -d "~/R" ]; then
        echo "Creating R library directory"
        mkdir -p ~/R
        chmod 755 ~/R
    fi

    echo "Installing R packages into ~/R library..."
    
    Rscript -e 'install.packages("requiRements", lib = "~/R")' || { echo "Failed to install R packages"; exit 1; }
else
    echo "Requirements file $REQUIREMENTS_FILE not found."
    exit 1
fi
