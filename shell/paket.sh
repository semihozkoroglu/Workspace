#!/bin/bash

PROG_name=${0##*/}
echo $PROG_name

if [ $# -ge 2 ]; then
	case $1 in
		"-a" ) sudo apt-cache search $2;;
		"-k" ) sudo apt-get remove $2;;
		* ) echo "yanlis"
esac
else 
	sudo apt-get install $1
fi
