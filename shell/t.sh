#!/bin/sh 
	
	echo -n "Aranacak kullanici ismini gir: " # < n > paremetresi tirnaklar icindeki ifadenin sonuna \n koymaz.
	read isim #Stdin'e duserek kullanicidan girdi alir. 
	grep -wi "$isim" /etc/passwd >/dev/null # < w > paremetresiyle kelimemi soz dizisimi ayrimi yapilir. & < i > paremetresi buyuk kucuk harfe duyarliligi kaldirir. 
	
	if [ $? -eq 1 ] ; then #grep'in kullanıcı olmaması durumunda donecegi deger 1'dir.
		echo "Bu isimde kullanici yoktur."
	else
		echo "$isim kullanicisi bulunmaktadir."
	fi
