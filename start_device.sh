#!/bin/bash
#First argument is genymotion device name
killall -9 genymotion
killall -9 adb
killall -9 player

adb kill-server
sleep 2

c=1
while [ $c -le 5 ]
do
    adb kill-server
    player --vm-name $1 &
    sleep 2
    adb start-server
    sleep 15
    res=`adb get-state`;echo $res

    if [ $res = "device" ]
    then
        break
    else
        echo "repeat simulator launch"
    fi
done


