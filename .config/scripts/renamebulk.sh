#!/usr/bin/env bash

cd /home/eamoc/mYsTuFf/Images/
filename=101;

for file in Impressi*
do
	echo "$filename"
	cp -v $file /home/eamoc/mYsTuFf/Images/$filename.jpg
	filename=$((filename++)) 
done
cd -
#set -eou pipefail

