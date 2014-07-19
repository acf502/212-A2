#!/usr/bin/bash

count=0

function func
{
	let count=count+1
	if [ $count -lt 2 ]
	then
	for path in `ls -d`
	do
		cd path
		echo $path
		if [ $? -eq '0' ]
		func
	done
	fi
	
}

echo "The current path to the command $1 is:"
which $1
cd /
paths=`ls -d`


