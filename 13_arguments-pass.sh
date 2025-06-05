#!/bin/bash

#NOTE
#To get no. of argument : $#
#To display all the argument : $@
#To use or display a argument : $1 $2

if [[ $# -eq 0 ]]
then
	echo "Please provide any argument"
	exit 1
fi


echo "first argument is : $1"
echo "second argument is : $2"

echo "all the arguments : $@"
echo "totla number of argument : $#"

for contents in $@
do
	echo "Displaying file $contents"
done
