#!/bin/bash
set -e  # Exit on error

curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh ./get-docker.sh --dry-run