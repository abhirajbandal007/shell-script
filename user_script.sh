#!/bin/bash
#take user name as input
#take password as input
#check if user already exist
#create the user
#

create_user(){
read -p "Enter the username: " username
read -p "Enter the password: " password

if id "$username" &>/dev/null; then  #ignore the output "&>/dev/null"
	echo "The user $username already exist."
	exit 1
else
	echo "The user $username does not exist and will be created..."
fi

sudo useradd -m $username -p $password

echo "user $username added successfully..."
}

create_user
