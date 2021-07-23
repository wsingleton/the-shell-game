#!/bin/bash

# This script is intended to run on the EC2 instance allocated for TSG
pemFile=$1
connectionStr=$2

getTsgTar="aws s3 cp s3://the-shell-game/tsg-setup.tar.gz ~/tsg-setup.tar.gz"
unpackTsgTar="tar -xzf ~/tsg-setup.tar.gz ~/tsg/ && mv ~/tsg/* . && rm -Rf ~/tsg/"
setNprocLimit="sudo sh setup-user-nproc-limit.sh"

echo "$getTsgTar; $unpackTsgTar; $setNprocLimit; exit" | ssh -tt -i $pemFile $connectionStr

