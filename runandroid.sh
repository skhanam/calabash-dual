#!/bin/sh

if [ -z "$2" ] ; then
	echo "Running tests on default directory \n\n"
	PROJ_NAME="meine.tui"
else
	if [ "$2" == "NA" ] ; then
			PROJ_NAME=$2
	else
		echo "Example command\n sh runandroid.sh NA meine.tui @android_test"
	fi
fi

if [ "$1" == "clean" ] ; then
	echo "\n\n\nCleaning and building application for android tests...\n\n\n"
	ti clean --project-dir ../$PROJ_NAME
	ti build --platform android -b --project-dir ../$PROJ_NAME
	cp ../$PROJ_NAME/build/android/bin/meine\ TUI.apk  app.apk
	rm -rf test_servers/
	calabash-android resign app.apk
	calabash-android build app.apk
fi

if [ -z "$3" ] ; then
	echo "Example command\n sh runandroid.sh NA meine.tui @android_test"
else
	calabash-android  run app.apk -p de_mt_android_jenkins --tag $3
fi