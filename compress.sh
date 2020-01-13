#!/bin/bash

for i in $(ls /home/manulal/compress/)
	do
		tar -cf $i | 7za a -si $i.tar.7z
		mv /home/manulal/$i.tar.7z /home/manulal/compress
		rm -R `ls -1 -d /home/manulal/compress/$i/`
	done	


