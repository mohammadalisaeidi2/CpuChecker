#! /bin/bash
COUNTER=0
while true
do
	CPU=$(top -bn1 | grep load | awk '{printf "%d", $(NF-2)*100}')

	echo CPU usage: $CPU%
	echo Restart times: $COUNTER 

	if [[ $CPU -gt 90 ]]
	then
		x-ui restart
		((COUNTER=COUNTER+1))
		sleep 50
	fi
	sleep 5
	clear
done
