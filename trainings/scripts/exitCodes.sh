#!/bin/bash
#ls -4 2> /dev/null
#ls -l 1> /dev/null
#ls -l > /dev/null
ls -4 > /dev/null

if [ $? == 0 ];then
  echo "Prev commands ran success"
else
  echo "Prev commands not ran well"
fi
