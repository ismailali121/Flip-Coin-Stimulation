#!/bin/bash -x
headCount=0
tailCount=0
flag=0
while (($flag!=1))
do
	while (($headCount!=21&&$tailCount!=21))
	do
		result=$((RANDOM%2))
		if [ $result = 0 ]
		then
			((headCount++))
			echo HEADS
		else
			((tailCount++))
			echo TAILS
		fi
	done
	echo HEADS has won $headCount times
	echo TAILS has won $tailCount times
	if [[ $headCount -gt $tailCount ]]
	then
		difference=$(($headCount - $tailCount))
		if [$difference]
		echo HEAD has WON by $difference times
		#break
	elif [[ $headCount -lt $tailCount && $difference -ge 2 ]]
	then
        	difference=$(($tailCount - $headCount))
		echo TAIL has WON by $difference times
		#break
	else
		echo Its a TIE
		flag=1

		fi
done
