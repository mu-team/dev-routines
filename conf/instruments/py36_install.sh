#!/usr/bin/env bash

sudo add-apt-repository ppa:jonathonf/python-3.6
sudo apt update
sudo apt install python3.6 python3.6-dev
# replace python3 symlink
# sudo ln -s /usr/bin/python3.6 /usr/local/bin/python3

wget https://bootstrap.pypa.io/get-pip.py
sudo python3.6 get-pip.py
# replace pip3 symlink
# sudo ln -s /usr/local/bin/pip /usr/local/bin/pip3
