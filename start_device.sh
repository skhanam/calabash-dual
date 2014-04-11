#!/bin/bash
c=1
while [ $c -le 5 ]
do
    ps | grep "player" | awk '{print $1}' | xargs kill
    adb kill-server
    player --vm-name Nexus_5 &
    sleep 2
    adb start-server
    sleep 30
    res=`adb get-state`;echo $res

    if [ $res = "device" ]
    then
        break
    else
        echo "repeat simulator launch"
    fi

    c=$(($c+1))
done
