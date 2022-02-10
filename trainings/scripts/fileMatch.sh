#!/bin/bash

# Check the file existency
filename=$2

if [[ -z $2 ]]; then
  echo "NO FILE ARGUMENT PASSED:"
  exit 1

#fi

elif [[ $2 ]] || [[-e $filename ]]; then
  echo "File $filename exists"
  #cat $filename
else
  echo "No file called $filename exists"
fi
#fi
