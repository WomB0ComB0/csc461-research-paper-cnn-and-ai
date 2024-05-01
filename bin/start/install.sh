$currentdir=$(pwd)

# Check if pip is installed, if not, install it
if ! command -v pip3 &> /dev/null; then
    sudo apt-get install python3-pip
fi

# Check if virtualenv is installed, if not, install it
if ! command -v virtualenv &> /dev/null; then
    pip3 install -q virtualenv
fi

# Create a virtual environment if not already created
if [ ! -d "venv" ]; then
    virtualenv venv
fi

# Activate the virtual environment
source venv/bin/activate

# Install requirements
pip3 install -q -r requirements.txt

# Run r_package_installation.sh
cd ./scripts
bash r_package_installation.sh

# Deactivate the virtual environment
deactivate

# Go back to the original directory
cd $currentdir