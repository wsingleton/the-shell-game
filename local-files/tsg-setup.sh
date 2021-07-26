#!/bin/bash

pemFile=$1
connectionStr=$2

getTsgTar="aws s3 cp s3://the-shell-game/tsg.tar.gz ~/tsg.tar.gz"
unpackTsgTar="sudo tar -xzf ~/tsg.tar.gz && mv ~/remote-files/* . && rm -Rf ~/remote-files/"
setNprocLimit="sudo sh setup-user-nproc-limit.sh"

echo "$getTsgTar; $unpackTsgTar; $setNprocLimit; exit" | ssh -tt -i $pemFile $connectionStr

