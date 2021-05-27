#!/bin/bash

#Loop by new line
IFS=$'\n'

#Recording current process
old_process=$(ps -eo command)

while true; do
	#Record new processes
	new_process=$(ps -eo command)
	#Diff the two results
	diff <(echo "$old_process") <(echo "$new_process") | grep [\<\>]
	sleep 1
	old_process=$new_process
done
