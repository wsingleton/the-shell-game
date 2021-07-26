#!/bin/bash

for i in 1 2 3 4 5
do
	mkdir "virus$i"
	touch "virus$i/virus$i.data"
	sleep 5
done
