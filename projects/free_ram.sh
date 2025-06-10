#!/bin/bash
#
#Author: Jishnu
#Date: 07-Jun_2025


FREE_RAM=$(free -mt | grep "Total" | awk '{print $4}')
TH=700

if [[ $FREE_RAM -lt $TH ]]
then
	echo "Warning, Your RAM is low!!!!!!!!!!!!!, RAM left ${FREE_RAM}"
else
	echo "You're running good :), RAM left ${FREE_RAM} "
fi
