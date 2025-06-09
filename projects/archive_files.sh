#!/bin/bash
#
#Author:Jishnu
#Date:07-Jun-2025
#Version: v.0.1

#Variables
BASE=/home/batman/archived_folder
ARV_FLDR=/home/batman/archived_folder/archive
DAYS=10
DEPTH=1
RUN=0

#Check if the directory is present or not
if [[ ! -d $ARV_FLDR ]]
then
	echo "Directory doesn't exist"
	echo "Creating Directory!!!!!!!!!"
	mkdir /home/batman/archived_folder/archive
	exit 1
fi

#Find the list of files larger than 20MB

for i in `find $BASE -maxdepth $DEPTH -type -f -size +20MB`
do
	if [[ $RUM -eq 0]]
	then
		gzip $i || exit 1
		mv $i.gz $BASE/archive || exit 1
	fi
done

