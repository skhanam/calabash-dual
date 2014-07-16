#!/bin/sh
clear
DATE=`date +%d-%m-%Y-%H-%M`

export LC_CTYPE=en_US.UTF-8

if [ "$#" -le "1" ]; then
	echo "\n4 ARGUMENTS NEEDED"
    echo "1) App to test ex: en_th / de / da / en_fc"
    echo "2) relative folder path where source code is located"

	echo "\nsample command: \n 1) sh build_ios.sh de ../meine.tui"
	exit
fi

if [ -z "$2" ] ; then
echo "Tags not specified using @failed"
exit
else
tagged_test=$2
fi

PROJ_FOLDER=$2

if [ $1 == "de" ] ; then
	TI_SCHEME="meinetui"
	ruby update_tiapp.rb $PROJ_FOLDER
	APPNAME="meineTUI"
	CUCUMBER_PROFILE=de_mt_ios
elif [ $1 == "en_th" ] ; then
	TI_SCHEME="thomson"
	APPNAME="MyThomson"
	CUCUMBER_PROFILE=en_th_ios
elif [ $1 == "en_fc" ] ; then
	TI_SCHEME="firstchoice"
	APPNAME="MyFirstChoice"
	CUCUMBER_PROFILE=en_fc_ios
elif [ $1 == "sv" ] || [ $1 == "da" ] || [ $1 == "fi" ] || [ $1 == "nb" ] ; then
	calabash-ios sim locale $1
	TI_SCHEME="nordics"
	APPNAME="MinFerie"
	CUCUMBER_PROFILE=nor_ios
fi

BUILD_CONFIG="Debug"
PROJECT_PATH="features"
ARCHITECTURE_SELECTED=i386
SCHEME_XC="${APPNAME}-cal"
PROJ_LOC="${PROJ_FOLDER}/build/iphone/${APPNAME}.xcodeproj"

	echo "project name:"${PROJ_FOLDER}
	cd ${PROJ_FOLDER}/;/usr/local/bin/node build.js $TI_SCHEME -l;cd -

	if [ $TI_SCHEME == "meinetui" ] ; then
		ruby update_tiapp.rb $PROJ_FOLDER
	fi

	killall Xcode
	cp ./expect.exp ${PROJ_FOLDER}
	cd ${PROJ_FOLDER}/
	echo /usr/bin/expect ./expect.exp $APPNAME
	/usr/bin/expect ./expect.exp $APPNAME
	cd -
	open -a Xcode
	sleep  5
	echo ${PROJ_LOC}
	open ${PROJ_LOC}
	sleep 20
	xcodebuild  -scheme "${SCHEME_XC}" -project "${PROJ_LOC}" -configuration Debug ONLY_ACTIVE_ARCH=NO -sdk iphonesimulator build
	cp -r ${PROJ_FOLDER}/i18n/* features/test_data/
	sleep 1
    killall "iPhone Simulator"
	killall Xcode
    sleep 1

