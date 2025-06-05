#!/bin/bash

fi_clss=80
sec_clss=60
fi_result="First Class"
sec_result="Second Class"

read -p "Enter your marks: " marks

if [[ $marks -ge $fi_clss ]]
then
	echo "You are $fi_result"

elif [[ $marks -ge $sec_clss ]]
then
	echo "You are $sec_result"
else
	echo "You are fail"
fi
