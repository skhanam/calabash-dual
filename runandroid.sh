#!/bin/sh
clear
DATE=`date +%d-%m-%Y-%H-%M`

sh start_device.sh

export LC_CTYPE=en_US.UTF-8


if [ "$#" -le "3" ]; then
	echo "\n\n\n2 ARGUMENTS NEEDED"
	echo "1) clean(clean project) or NA (for running project without cleaning"
	echo "2) Tags selected for test run ex: @sanity or @reg"
    echo "3) App to test ex: thomson / firstchoice / meinetui"
    echo "4) folder source code"

	echo "\nsample command: sh runandroid.sh clean @sanity meinetui ../meine.tui\n"
	echo "or\nsample command: sh runandroid.sh NA  @sanity-eng thomson ../meine.tui\n"
	exit
fi

export LC_CTYPE=en_US.UTF-8
if [ -z "$2" ] ; then
echo "Tags not specified using @failed"
exit
else
tagged_test=$2
fi

if [ -z "$4" ] ; then
PROJ_FOLDER=../meine.tui
else
PROJ_FOLDER=$4
fi

TI_SCHEME=$3
echo "TDA project location:"${PROJ_FOLDER}

if [ $TI_SCHEME == "meinetui" ] ; then
	APK_NAME="meine TUI.apk"
	CUCUMBER_PROFILE=de_mt_android_jenkins
elif [ $TI_SCHEME == "thomson" ] ; then
	APK_NAME=MyThomson.apk
	CUCUMBER_PROFILE=uk_th_android
fi

if [ "$1" == "clean" ] ; then
	echo "\n\n\nCleaning and building application for android tests...\n\n\n"
    cd ${PROJ_FOLDER}/;/usr/local/bin/node build.js $TI_SCHEME --syncLang
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
echo calabash-android  run app.apk -p $CUCUMBER_PROFILE --tag $tagged_test
bundle exec calabash-android run app.apk -p $CUCUMBER_PROFILE --tag $tagged_test
