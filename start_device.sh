
#!/bin/bash
c=1
while [ $c -le 5 ]
do
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
done
