#!/bin/bash

input_array=( "$@" )
file=$1
words_to_find_array=( "${input_array[@]:1}" )

if [ -f "$file" ]; then
	for argument in ${words_to_find_array[@]}; do
		echo  "$argument `grep -c $argument $file`"
		 output_lines=`grep -n $argument $file | grep -oe "^[[:digit:]]*"`
		if [ ${#output_lines} -ne 0 ]; then
			echo "$output_lines"
		fi	
	done
	exit 0
else
	exit 1
fi
