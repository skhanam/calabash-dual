#!/bin/sh
clear
DATE=`date +%d-%m-%Y-%H-%M`

export LC_CTYPE=en_US.UTF-8
export ANDROID_HOME=/Applications/adt/sdk
export PATH=$ANDROID_HOME/tools:$PATH
export PATH=$ANDROID_HOME/platform-tools:$PATH

if [ "$#" -le "3" ]; then
	echo "\n\n\n2 ARGUMENTS NEEDED"
	echo "1) clean(clean project) or NA (for running project without cleaning"
	echo "2) Tags selected for test run ex: @sanity or @reg"
    echo "3) App to test ex: thomson / firstchoice / meinetui"
    echo "4) folder source code"

	echo "\nsample command: sh runandroid.sh clean @sanity de ../meine.tui\n"
	echo "or\nsample command: sh runandroid.sh NA  @sanity-eng en_th ../meine.tui\n"
	exit
fi

#sh start_device.sh

if [ -z "$2" ] ; then
echo "Tags not specified using @failed"
exit
else
tagged_test=$2
fi

PROJ_FOLDER=$4

TI_SCHEME=$3
echo "TDA project location:"${PROJ_FOLDER}

if [ $TI_SCHEME == "de" ] ; then
	APK_NAME="meine TUI.apk"
	CUCUMBER_PROFILE=de_mt_android
	TI_SCHEME=meinetui
elif [ $TI_SCHEME == "en_th" ] ; then
	APK_NAME=MyThomson.apk
	CUCUMBER_PROFILE=en_th_android
	TI_SCHEME=thomson
elif [ $3 == "sv" ] || [ $3 == "da" ] || [ $3 == "fi" ] || [ $3 == "nb" ] ; then
	TI_SCHEME="nordics"
	APK_NAME="MinFerie.apk"
	CUCUMBER_PROFILE=nor_android
fi

if [ $1 == "install" ] || [ $1 == "clean" ] ; then

	if [ "$1" == "clean" ] ; then
		echo "\n\n\nCleaning and building application for android tests...\n\n\n"
   		cd ${PROJ_FOLDER}/;/usr/local/bin/node build.js $TI_SCHEME -l
    	ti clean
		ti build --platform android -b
		cd -
		cp $PROJ_FOLDER/build/android/bin/"$APK_NAME"  app.apk
		cp -r $PROJ_FOLDER/i18n/* features/test_data/
	fi

rm -rf test_servers/
calabash-android resign app.apk
calabash-android build app.apk
adb install -r app.apk
adb install -r test_servers/*.apk

fi

echo LANG=$3 bundle exec calabash-android run app.apk -p $CUCUMBER_PROFILE --tag $tagged_test
LANG=$3 bundle exec calabash-android run app.apk -p $CUCUMBER_PROFILE --tag $tagged_test   -f html -o android-$3-report.html  -f junit -o features/report/junit/$3
