#!/bin/bash
	
	:> 08.csv #csv ' yi bosalt	
	:> 09.csv	
	:> 10.csv	
	while read line ; do
		echo $line | awk -F, '{ print $1 }' |
		cut -d '-' -f1 | cut -d '"' -f2 |
		while read f; do 
			if [ $f -eq 08 ]; then		
				echo $line >> 08.csv
			fi
			if [ $f -eq 09 ]; then
				echo $line >> 09.csv
			fi
			if [ $f -eq 10 ]; then
				echo $line >> 10.csv
			fi
		done
	done < omuceng0809.csv	
