#!/bin/bash


myArray=( 32 4 33 2 ram raju )

length=${#myArray[*]}

for (( i=0;i<$length;i++ ))
do
	echo "Myarray values are: ${myArray[$i]}"
done
