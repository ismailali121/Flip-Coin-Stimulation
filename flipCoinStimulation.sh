#!/bin/bash -x
function repeatAgain () {
headCount=0
tailCount=0
while true
do
        for((i=0;i<$noOfTimes;i++))
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
                diff=$(($headCount - $tailCount))
                if [ $diff -ge 2 ]
                then
                        echo HEAD has WON by $diff times
                        break
                else
                        continue
                fi
        elif [[ $headCount -lt $tailCount ]]
        then
                diff=$(($tailCount - $headCount))
                if [ $diff -ge 2 ]
                then
                        echo TAIL has WON by $diff times
                        break
                else
                        continue
                fi
        else
                echo "Its a TIE ( Trying Again )"
                continue
        fi
done
}

read -p "How many times you want to flip a coin" noOfTimes
headCount=0
tailCount=0
for((i=0;i<$noOfTimes;i++))
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
        diff=$(($headCount - $tailCount))
        echo HEAD has WON by $diff times
elif [[ $headCount -lt $tailCount ]]
then
        diff=$(($tailCount - $headCount))
        echo TAIL has WON by $diff times
else
        echo "Its a TIE ( Trying Again )"
        repeatAgain
fi
