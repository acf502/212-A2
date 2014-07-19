# Name: Aaron Colin Foote
# Date: 11th April 2013
# User: acf502, 4258770
# File Description: findcmds2.sh for Assignment 2 of CSCI212

#!/usr/bin/bash


line=""
rcount=0
i=0


echo "The current path to the command $1 is:"
which $1
cd /
for itemone in *
do
	if [ "$1" = "$itemone" ] && [ -f $itemone ]
	then
	line[rcount]="`pwd`/$1"
	let rcount=rcount+1
	fi
	if [[ ( -d $itemone ) || ( -h $itemone ) || ( -p $itemone) ]] && [ -r $itemone ]
	then
	cd /$itemone
	for itemtwo in *
	do
		if [ "$1" = "$itemtwo" ]  && [ -f $itemtwo ]
		then
		line[rcount]="`pwd`/$1"
		let rcount=rcount+1
		fi
		if [[ ( -d $itemtwo ) || ( -h $itemtwo ) || ( -p $itemtwo) ]] && [ -r $itemtwo ]
		then
		cd /$itemtwo
		for itemthree in *
		do
			if [ "$1" = "$itemthree" ]  && [ -f $itemthree ]
			then
			line[rcount]="`pwd`/$1"
			let rcount=rcount+1
			fi
			if [[ ( -d $itemthree ) || ( -h $itemthree ) || ( -p $itemthree) ]] && [ -r $itemthree ]
			then 
			cd /$itemthree
			for itemfour in *
			do
				if [ "$1" = "$itemfour" ]  && [ -f $itemfour ]
				then
				line[rcount]="`pwd`/$1"
				let rcount=rcount+1
				fi
			done
			fi
		done
		fi
	done
	fi
done
if [ $rcount -gt 0 ]
then
	echo "Other versions of the command $1 are:"
	for rcount
	do
	echo ${line[i]}
	let i=i+1
	done
else
echo "No other version of the command $1 is found."
fi

