#!/bin/bash
#
#To chech the execution of the previous command is 
#successful or not use "echo $?"
#


read -p "check connectivity " site

ping -c 1 $site > /dev/null

if [[ $? -eq 0 ]]
then
	echo "Successful "
else
	echo "Failed"
fi
