#!/bin/bash
if [ -f /etc/os-release ]; then
	
	. /etc/os-release
	OS=$NAME
	VER=$VERSION_ID

fi

echo "Your operating system is: $OS"
echo "Your system's version is: $VER"
echo  ""

echo "What is your word?: "
read $INPUT


if [ -z "$INPUT"]; then
	echo "Why did you put nothing?"
fi









