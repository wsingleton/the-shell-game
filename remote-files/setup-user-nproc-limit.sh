#!/bin/bash

sudo groupadd players
sudo printf '$-1i\n\n@players\t hard\t nproc\t 10\n.\n,p\n,w\n' | sudo ed -s /etc/security/limits.conf
