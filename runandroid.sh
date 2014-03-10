#!/bin/sh
clear

#echo "launching simulator"
#sh start_device.sh 


if [ "$#" != "2" ]; then
	echo "\n\n\n2 ARGUMENTS NEEDED"
	echo "1) clean(clean project) or NA (for running project without cleaning"
	echo "2) Tags selected for test run ex: @sanity or @reg"
	echo "\nExample: sh runandroid.sh clean @sanity"
	echo "or \nExample: sh runandroid.sh NA @sanity"

	exit
fi

PROJ_NAME="meine.tui"

if [ "$1" == "clean" ] ; then
	echo "\n\n\nCleaning and building application for android tests...\n\n\n"
	cd ../$PROJ_NAME
	node build.js -B meinetui
    ti clean 
	ti build --platform android -b
	cd -
	cp ../$PROJ_NAME/build/android/bin/meine\ TUI.apk  app.apk
fi

rm -rf test_servers/
calabash-android resign app.apk
calabash-android build app.apk
adb install -r app.apk
adb install -r test_servers/*.apk
echo calabash-android  run app.apk -p de_mt_android_jenkins --tag $2
calabash-android  run app.apk -p de_mt_android_jenkins --tag $2
