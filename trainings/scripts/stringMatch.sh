#!/bin/bash
echo "Enter your name: \c"
read name

if [[ $name == "test" ]];
then
  echo "You have entered correct name"
elif [[ $name == "mouli" ]]; then
  echo "You entered Mouli";
else
  echo "Wrong string entered"
fi
  #statements
