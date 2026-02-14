#!/bin/bash
#
#THis script takes the package name from user and installs it
#

read -p "Enter the package name: " package_name

echo "checking if package is already installed..."

if dpkg -s $package_name > /dev/null 2>&1 ; then
	echo "$package_name already installed"
	exit 1
else
	echo "continuing installation..."
fi	
echo "Updating system and Installing $package_name"
sudo apt-get update
sudo apt install $package_name
