#!/bin/bash
#
#AUTHOR: JISHNU
#DATE: 10-06-2025

#Get the ms from the ping log file

time=$(cat connectivty.log | awk -F'[ =.]' 'NR==2,NR==21 {print $13}') 
my_array=()


for i in $time
do
	if [[ $i -ge 10 ]]
	then
#		echo "ISP Link Down Alerts" | mail -s "Latency is greater than 5" jishnuy2k@gmail.com
		echo $i
		my_array+=("$i")
	fi

done

echo $my_array
