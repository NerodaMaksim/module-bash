#!/bin/bash

input_arguments=( "$@" )
array_of_arguments=( "-s" "-m" "-o" "-e" )
number_array=( "${input_arguments[@]:1}" )
if [ "${#number_array[@]}" -eq 0 ]; then
	echo "0"
	exit 0
elif [[ ! "${number_array[0]}" =~ [[:digit:]] ]]; then
	echo "Error.."
	exit 1
fi
case "$1" in
	"${array_of_arguments[0]}")
		sum=0
		IFS='+' sum=`echo "scale=1;${number_array[*]}" | bc`
		echo "$sum"
	;;
	"${array_of_arguments[1]}")
		avg=0
		IFS='+'	avg=`echo "scale=0;(${number_array[*]})/${#number_array[@]} " | bc`
		echo "$avg"
	;;
	"${array_of_arguments[2]}")
		sum_of_odd=0
		for number in ${number_array[@]}; do
			if [ $((number % 2)) -ne 0 ]; then
				sum_of_odd=$((sum_of_odd + number))
			fi
		done
		echo "$sum_of_odd"
	;;
	"${array_of_arguments[3]}")
		sum_of_even=0
		for number in ${number_array[@]}; do
			if [ $((number % 2)) -eq 0 ]; then
				sum_of_even=$((sum_of_even + number))
			fi
		done
		echo "$sum_of_even"
	;;
	*)
		echo "Error.."
		exit 1
	;;
esac	


