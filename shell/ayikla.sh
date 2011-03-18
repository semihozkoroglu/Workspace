#!/bin/bash
	:>numaralar.csv
	:>isimler.csv
	:>soyisimler.csv
	
	while read line ; do
		echo $line | awk -F, '{ print $1 }' >> numaralar.csv
		echo $line | awk -F, '{ print $2 }' >> isimler.csv
		echo $line | awk -F, '{ print $3 }' >> soyisimler.csv
	done < omuceng0809.csv


