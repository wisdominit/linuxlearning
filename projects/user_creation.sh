#!/bin/bash
#
#Author: Jishnu
#Date: 09-Jun-2025


#script should be executed with sudo/root access

if [[ ${UID} -ne 0 ]]   # the user id of the root account is 0, in here we are checking if the user is root or not
then
	echo "You need root access to run this script"
	exit 1
fi

#User should provide one name as argument else guide him

if [[ ${#} -lt 1 ]]   #"$#" means length of the argument
then
	echo "Usage: ${0} USER_NAME [COMMENT]"
	echo "Create a user with name USER_NAME and comments field of COMMENT"
	exit 1
fi

#Store 1st argument as user name

USER_NAME="${1}"   	# "$1" means first argument, in here first argument assign to USER_NAME
echo "${USER_NAME}"

#Incase more than one argument, store it as account comments

shift
COMMENT="${@}"   # "$@" it means that the remaining arguments we assign to comments 
echo $COMMENT

#Create password

PASSWORD=$(date +%s%N)

#Create user

useradd -c "$COMMENT" -m $USER_NAME

#Check if the user is sucessfully created or not

if [[ $? -ne 0 ]]
then
	echo "There is a problem in creating the user"
	exit 1
fi

#Set the password for the user

echo "$USER_NAME:$PASSWORD" | chpasswd
#echo $PASSWORD | passwd --stdin $USER_NAME

#Check if the password is crated or not

if [[ $? -ne 0 ]]
then
	echo "Password could not be set"
	exit 1
fi

#Force password change on next logon

passwd -e $USER_NAME

#Display the username and password

echo
echo "Username: $USER_NAME"
echo
echo "Password: $PASSWORD"
echo
echo "$(hostname)"



