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
        echo "Configuration is not properly set up for Linux platform, depending on your R installation configuration, you may need to install the required packages manually."
        echo "Something like this: mkdir ~/R \ chmod 755 ~/R"
        echo "Rscript -e 'install.packages(\"requiRements\", lib = \"~/R\")'"
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
    Rscript install.r || { echo "Failed to run R installation script"; exit 1; }
else
    echo "Requirements file $REQUIREMENTS_FILE not found."
    exit 1
fi
