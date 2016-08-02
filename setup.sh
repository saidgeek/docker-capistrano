#!/bin/bash

eval $(ssh-agent -s)

$DIR=/root/.ssh

if [ -d "$DIR" ]
	then 
		echo "Added ssh keys to agent..."
		for rsa in $(ls /root/.ssh/); do
			ssh-add /root/.ssh/$rsa
		done
	else
		echo "Not ssh keys."
	fi


cd /source/app
bundle

exec cap $@
