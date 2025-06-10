#!/bin/bash

#Author: Jishniu
#Date: 02-06-2025


File="/home/batman/shell_scripting/test.txt"

for name in $(cat $File)
do
	echo "My name is = $name"
done
