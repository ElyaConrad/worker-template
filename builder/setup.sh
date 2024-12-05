#!/bin/bash

set -e # Stop script on error
apt-get update && apt-get upgrade -y # Update System

# Install System Dependencies
apt-get install -y --no-install-recommends software-properties-common curl git openssh-server gcc ffmpeg wget

# Install Python 3.10
add-apt-repository ppa:deadsnakes/ppa -y
apt-get update && apt-get install -y --no-install-recommends python3.10 python3.10-dev python3.10-distutils
update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.10 1

# Install pip for Python 3.10
curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
python3 get-pip.py

# Custom dependencies

# apt-get install -y gcc ffmpeg wget

# pip install --upgrade pip
# pip install -U fastapi uvicorn python-multipart
# pip install -U openai-whisper
# pip install -U FlagEmbedding

# Clean up, remove unnecessary packages and help reduce image size
apt-get autoremove -y && apt-get clean -y && rm -rf /var/lib/apt/lists/*
