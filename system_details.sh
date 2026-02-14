#!/bin/bash

<<comment
creates function for system information
-RAM user
-Storage used
-Top processes
comment

check_memory(){
	free -h | awk 'NR==2 {print $7}'
}

check_storage(){
	df -h | awk 'NR==2 {print $4}'

}

check_most_consuming_process(){

ps aux --sort=-%mem | awk 'NR==2 {print $1, $2, $4}'
}

show_details(){
	echo "***********SYSTEM DETAILS***************"
	echo "Available memory: "
	check_memory
	echo "Available STorage: "
	check_storage
	echo "Most memory intensive process: "
	check_most_consuming_process

}

show_details
