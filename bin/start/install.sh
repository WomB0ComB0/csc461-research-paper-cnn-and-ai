#!/bin/bash

set -e

log() {
    echo "$(date '+%Y-%m-%d %H:%M:%S') - $1"
}

check_python_version() {
    if ! command -v python3.10 &> /dev/null; then
        log "Python 3.10 is not installed. Attempting to install..."
        if command -v apt-get &> /dev/null; then
            sudo add-apt-repository ppa:deadsnakes/ppa -y
            sudo apt-get update
            sudo apt-get install -y python3.10 python3.10-venv
        elif command -v yum &> /dev/null; then
            sudo yum install -y python3.11 python3.10-devel
        else
            log "Unable to install Python 3.11. Please install it manually."
            exit 1
        fi
    fi
}

check_and_install_pip() {
    if ! python3.10 -m pip --version &> /dev/null; then
        log "pip for Python 3.10 not found. Attempting to install..."
        curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
        python3.10 get-pip.py
        rm get-pip.py
    fi
}

create_and_activate_venv() {
    if [ ! -d "venv" ]; then
        log "Creating virtual environment..."
        python3.10 -m venv venv
    fi
    log "Activating virtual environment..."
    source venv/bin/activate
    if [ "$VIRTUAL_ENV" == "" ]; then
        log "Virtual environment activation failed."
        exit 1
    fi
    echo "Using pip version: $(python3.10 -m pip --version)"
    echo "Packages install at $(which pip)"
}

install_R() {
    if ! command -v R &> /dev/null; then
        log "R is not installed. Attempting to install..."
        if command -v apt-get &> /dev/null; then
            sudo apt-get update
            sudo apt-get install -y r-base
        else
            log "Unable to install R. Please install it manually."
            exit 1
        fi
    else
        log "R is already installed."
    fi
}

main_install() {
    local currentdir=$(pwd)

    case "$(uname)" in
        Darwin)
            log "Mac OS X platform detected"
            ;;
        Linux)
            log "GNU/Linux platform detected"
            ;;
        MINGW32_NT*|MINGW64_NT*)
            log "Windows platform detected"
            log "This script is not optimized for Windows. Please use WSL or native Linux."
            exit 1
            ;;
        *)
            log "Unsupported platform"
            exit 1
            ;;
    esac

    check_python_version
    check_and_install_pip
    create_and_activate_venv
    install_R

    if [ -f "requirements.txt" ]; then
        log "Installing Python requirements..."
        python3.10 -m pip install --upgrade pip
        python3.10 -m pip install -r requirements.txt --no-deps
    else
        log "requirements.txt does not exist"
    fi

    if [ -d "./bin/start/scripts" ]; then
        log "Running r_package_installation.sh..."
        (cd "./bin/start/scripts" && bash r_package_installation.sh)
    else
        log "./bin/start/scripts directory does not exist"
    fi

    log "Deactivating virtual environment..."
    deactivate

    cd "$currentdir"
    log "Installation completed successfully."
}

main_install