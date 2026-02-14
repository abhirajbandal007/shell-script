#!/bin/bash

<<comment
This script demonstrates usage of for loops in 
shell scrptinh
comment

for car in audi bww tata porche ferrari
do
	echo $car
done

for (( i=10; i>0; i--  ))
do
	echo "Printing number in reverse order: $i"
done

for file in ./*.txt
do
	echo $file
done
