#!/bin/sh
clear
DATE=`date +%d-%m-%Y-%H-%M`

export LC_CTYPE=en_US.UTF-8

if [ "$#" != "2" ]; then
	echo "\n\n\n2 ARGUMENTS NEEDED"
	echo "1) clean(clean project) or NA (for running project without cleaning"
	echo "2) Tags selected for test run ex: @sanity or @reg"
	echo "\nsample command: sh runmeinetui.sh clean @sanity\n"
	exit
fi

if [ -z "$2" ] ; then
echo "Tags not specified using @failed"
tagged_test=@failed
else
tagged_test=$2
fi

PROJ_NAME="${PROJ_NAME:=meine.tui}"
echo "project name:"${PROJ_NAME}
cd ../${PROJ_NAME}/;/usr/local/bin/node build.js meinetui --syncLang;cd -

ruby update_tiapp.rb $PROJ_NAME

SCHEME_XC="meineTUI-cal"
BUILD_CONFIG="Debug"
PROJECT_PATH="features"
ARCHITECTURE_SELECTED=i386
APPNAME="meineTUI"
PROJ_LOC="../${PROJ_NAME}/build/iphone/meineTUI.xcodeproj"


if [ "$1" == "clean" ] ; then
killall Xcode
cp ./expect.exp ../${PROJ_NAME}/
cd ../${PROJ_NAME}/
/usr/bin/expect ./expect.exp
cd -
open -a Xcode
sleep  5
open ../${PROJ_NAME}/build/iphone/*.xcodeproj
sleep 30
xcodebuild  -scheme "${SCHEME_XC}" -project "${PROJ_LOC}" -configuration Debug ONLY_ACTIVE_ARCH=NO -sdk iphonesimulator build
cp -r ../meine.tui/i18n/* features/test_data/
fi

BUILT_PRODUCTS_DIR=$(xcodebuild -project "${PROJ_LOC}" ARCHS="${ARCHITECTURE_SELECTED}" ONLY_ACTIVE_ARCH=NO -sdk iphonesimulator  -configuration "${BUILD_CONFIG}" -showBuildSettings | grep -m 1 "BUILT_PRODUCTS_DIR" | grep -oEi "\/.*" | xargs -L1 dirname)

APP_BUNDLE_PATH_VAR="${BUILT_PRODUCTS_DIR}"/"${BUILD_CONFIG}"-iphonesimulator/"${APPNAME}".app
echo $APP_BUNDLE_PATH_VAR


echo BUNDLE_ID=$BUNDLE DEVICE=iphone APP_BUNDLE_PATH="${APP_BUNDLE_PATH_VAR}" bundle exec cucumber -p de_mt_ios_jenkins features/ --tag $tagged_test -v
BUNDLE_ID=$BUNDLE DEVICE=iphone APP_BUNDLE_PATH="${APP_BUNDLE_PATH_VAR}" bundle exec cucumber -p de_mt_ios_jenkins features/  --tag $tagged_test
