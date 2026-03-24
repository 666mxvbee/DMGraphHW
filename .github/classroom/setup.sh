#!/bin/bash
set -e

sudo apt-get update
sudo apt-get install -y g++ python3

chmod +x .github/classroom/*.sh
