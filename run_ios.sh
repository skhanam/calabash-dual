#!/bin/sh
clear
DATE=`date +%d-%m-%Y-%H-%M`

export LC_CTYPE=en_US.UTF-8

if [ "$#" -le "3" ]; then
	echo "\n\n\n2 ARGUMENTS NEEDED"
	echo "1) clean(clean project) or NA (for running project without cleaning"
	echo "2) Tags selected for test run ex: @sanity or @reg"
    echo "3) App to test ex: thomson / firstchoice / meinetui"
    echo "4) folder source code"

	echo "\nsample command: sh runmeinetui.sh clean @sanity meinetui ../meine.tui\n"
	exit
fi

if [ -z "$2" ] ; then
echo "Tags not specified using @failed"
exit
else
tagged_test=$2
fi

if [ -z "$4" ] ; then
PROJ_FOLDER=../meine.tui
else
PROJ_FOLDER=../$4
fi

TI_SCHEME=$3
BUILD_CONFIG="Debug"
PROJECT_PATH="features"
ARCHITECTURE_SELECTED=i386
SCHEME_XC="${APPNAME}-cal"

if [ $TI_SCHEME == "meinetui" ] ; then
	ruby update_tiapp.rb $PROJ_FOLDER
	APPNAME="meineTUI"
	CUCUMBER_PROFILE=de_mt_ios_jenkins
elif [ $TI_SCHEME == "thomson" ] ; then
	APPNAME="MyThomson"
	CUCUMBER_PROFILE=uk_th_ios
fi
PROJ_LOC="${PROJ_FOLDER}/build/iphone/${APPNAME}.xcodeproj"

if [ "$1" == "clean" ] ; then
	echo "project name:"${PROJ_FOLDER}
	cd ${PROJ_FOLDER}/;/usr/local/bin/node build.js $TI_SCHEME --syncLang;cd -

	if [ $TI_SCHEME == "meinetui" ] ; then
		ruby update_tiapp.rb $PROJ_FOLDER
	fi

	killall Xcode
	cp ./expect.exp ${PROJ_FOLDER}
	cd ${PROJ_FOLDER}/
	/usr/bin/expect ./expect.exp $APPNAME
	cd -
	open -a Xcode
	sleep  5
	echo ${PROJ_LOC}
	sleep 20
	xcodebuild  -scheme "${SCHEME_XC}" -project "${PROJ_LOC}" -configuration Debug ONLY_ACTIVE_ARCH=NO -sdk iphonesimulator build
	cp -r ${PROJ_FOLDER}/i18n/* features/test_data/
	killall Xcode
fi

BUILT_PRODUCTS_DIR=$(xcodebuild -project "${PROJ_LOC}" ARCHS="${ARCHITECTURE_SELECTED}" ONLY_ACTIVE_ARCH=NO -sdk iphonesimulator  -configuration "${BUILD_CONFIG}" -showBuildSettings | grep -m 1 "BUILT_PRODUCTS_DIR" | grep -oEi "\/.*" | xargs -L1 dirname)

APP_BUNDLE_PATH_VAR="${BUILT_PRODUCTS_DIR}"/"${BUILD_CONFIG}"-iphonesimulator/"${APPNAME}".app
echo $APP_BUNDLE_PATH_VAR


echo BUNDLE_ID=$BUNDLE DEVICE=iphone APP_BUNDLE_PATH="${APP_BUNDLE_PATH_VAR}" bundle exec cucumber -p $CUCUMBER_PROFILE features/ --tag $tagged_test -v
BUNDLE_ID=$BUNDLE DEVICE=iphone APP_BUNDLE_PATH="${APP_BUNDLE_PATH_VAR}" bundle exec cucumber -p $CUCUMBER_PROFILE features/  --tag $tagged_test
