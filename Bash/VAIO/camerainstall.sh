#!/bin/bash
sudo apt-get update -y
sudo apt-get install libglib2.0-dev libusb-dev build-essential gcc automake git
git clone https://github.com/tmn505/r5u87x ~/repo/r5u87x
cd ~/repo/r5u87x 
make 
sudo make install
sudo r5u87x-loader --reload
