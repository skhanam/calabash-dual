#!/bin/bash

if [ "$1" == "ios" ] || [ "$1" == "both" ] ; then

#sh runandroid.sh clean NA sv ../meine.tui
#sh runandroid.sh clean NA en_fc ../meine.tui
#sh runandroid.sh clean NA en_th ../meine.tui
#sh runandroid.sh clean NA de ../meine.tui
echo "ios"
fi

if [ "$1" == "android" ] || [ "$1" == "both" ] ; then
echo "android"
#sh run_ios.sh clean NA sv ../meine.tui
#sh run_ios.sh clean NA en_fc ../meine.tui
#sh run_ios.sh clean NA en_th ../meine.tui
#sh run_ios.sh clean NA de ../meine.tui

fi

#i="0"

#while [ $i -lt 4 ]
#do
#i=$[$i+1]
#done
