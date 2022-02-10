#!/bin/bash

# Print positional argiments
#echo $1 $2 $3 $4

# Print all positional args
#echo $@


echo "Please enter your name:"
read m



echo "Hello $m, Happy to see you here"


echo "Enter your phone Number:"
read ph
echo "Enter your DOB:"
read dob


echo "Hellow $m, Here are the details you shared. Plase check and confirm \n
	NAME: $m\n
	PHONE: $ph \n
	DOB: $dob
	"

