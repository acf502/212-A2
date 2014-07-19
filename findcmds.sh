# Name: Aaron Colin Foote
# Date: 29th April 2013
# User: acf502, 4258770
# File Description: findcmds.sh for Assignment 2 of CSCI212

#!/usr/bin/bash

count=0
matches=0
line=""
cmd=$1

function func
{
	if [ $count -le '3' ]; then
		for path in `ls 2>/dev/null`; do
			`cd $path 2>/dev/null`
			if [ $? -eq '0' ]; then
				cd $path
				let count=count+1
				func
			fi
		done
	fi
	`ls $cmd > /dev/null 2>&1`
	if [ $? -eq '0' ]; then
		if [ $matches -eq '0' ]; then
			echo "Other versions of the command $cmd are:"
		fi
		line[matches]=`pwd`
		echo "${line[$matches]}/$cmd"
		let matches=matches+1
	fi
	cd ..
	let count=count-1
	
}

echo "The current path to the command $1 is:"
which $cmd
cd /
func
if [ $matches -eq '0' ]; then
	echo "No other versions of the command $cmd found"
fi
