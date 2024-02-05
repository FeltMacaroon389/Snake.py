#!/bin/bash

# Check if Python3 is installed
if ! command -v python3 &>/dev/null; then
    echo "Python3 is not installed. Do you want to install it? (y/n)"
    read -r response
    if [[ $response =~ ^[Yy](es)?$ ]]; then
        apt update
        apt install python3
    else
        echo "Python3 is required for this script. Exiting."
        exit 1
    fi
fi

# Check if Git is installed
if ! command -v git &>/dev/null; then
    echo "Git is not installed. Do you want to install it? (y/n)"
    read -r response
    if [[ $response =~ ^[Yy](es)?$ ]]; then
        apt update
        apt install git
    else
        echo "Git is required for this script. Exiting."
        exit 1
    fi
fi

# Clone the GitHub repository
git clone https://github.com/FeltMacaroon389/Snake.py

# Change working directory
cd Snake.py || exit

# Remove unnecessary files 
rm requirements.txt
rm README.md
rm LICENSE
rm Compile.bat
rm AutoInstall.sh

# Install the requirements
pip3 install pygame

# Give the file executable permission
chmod +x Snake.py

# Run the file
python3 Snake.py
