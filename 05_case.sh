#!/bin/bash


#Author: Jishnu
#Date: 02-Jun-2025

echo "Choose an option: "
echo "a - For print date"
echo "b - For listing the directory"
echo "c - For switch to root user"
echo "d - For current working dir"
echo "e - Your wish"

read -p "Enter your choice: " choice


echo "-------------------------------------------"
echo "[OUTPUT]"

case ${choice,,} in
	a)date;;
	b)ls -lart;;
	c)sudo -su;;
	d)pwd;;
	e)
		echo "Jishnu"
		echo "You are going to be a billionare"
		echo "Today is $(date)" 
		echo "------------------------------------------"
		;;

	*)echo "Invalid Value";;

esac
