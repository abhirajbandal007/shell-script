#!/bin/bash
#
#THis  script can input multiple users
#
<<comment
THis is a multi line comment
comment

for i in {1..5}
do
	read -p "Enter the user name: " user_name

	sudo useradd -m $user_name
	echo "User $user_name created successfully"
done	
