#!/bin/bash


if [ "$#" -eq 0 ]; then
	echo "Wrong input, script must take arguments!"
else
	input_array=( "$@" ) 
fi


for input_argument in ${input_array[@]}; do	
	result=$( ls -R | grep $input_argument )
	if [ ${#result} -ne 0 ]; then
		echo "$result"
	else 
		echo "the searched PATH is unexisting"
	fi

done


