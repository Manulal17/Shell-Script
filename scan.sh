#!/bin/bash

# This program for check whether IP is up or not

alive_ping() {
	ping -c 1 $1 > /dev/null
	[ $? -eq 0 ] && echo node with IP: $i is up
}

#define function

for i in 192.168.2.{1..254}
do
	alive_ping $i & disown
done
exit
