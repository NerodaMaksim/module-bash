#!/bin/bash

if [ "$#" -eq 0 ] || [ "$#" -eq 1 ]; then
	exit 1
else
	filename=`echo $2 |  grep -oP "(?<=\/).*$"` 
	echo "$filename"
	output=`grep -n $1 $2 | grep -oP "^[[:digit:]]+"`
	echo "$output"
fi
