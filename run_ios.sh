#!/bin/sh
clear
DATE=`date +%d-%m-%Y-%H-%M`

export LC_CTYPE=en_US.UTF-8

if [ "$#" -le "3" ]; then
	echo "\n4 ARGUMENTS NEEDED"
	echo "1) clean(clean project) or NA (for running project without cleaning"
	echo "2) Tags selected for test run ex: @sanity or @reg"
    echo "3) App to test ex: en_th / de / en_fc /sv / fi/ da /nb "
    echo "4) relative folder path where source code is located"

	echo "\nsample command: \n 1) sh run_ios.sh clean @sanity en_th ../meine.tui"
	echo " 2) sh run_ios.sh NA @sanity da ../meine.tui\n"
	exit
fi

if [ -z "$2" ] ; then
echo "Tags not specified using @failed"
exit
else
tagged_test=$2
fi

PROJ_FOLDER=$4

if [ $3 == "de" ] ; then
	TI_SCHEME="meinetui"
	ruby update_tiapp.rb $PROJ_FOLDER
	APPNAME="meineTUI"
	TESTENV='DE_MT'
	CUCUMBER_PROFILE=de_mt_ios
	calabash-ios sim locale en
elif [ $3 == "en_th" ] ; then
	TI_SCHEME="thomson"
	APPNAME="MyThomson"
	TESTENV='EN_TH'
	CUCUMBER_PROFILE=en_th_ios
	calabash-ios sim locale en
elif [ $3 == "en_fc" ] ; then
	TI_SCHEME="firstchoice"
	APPNAME="MyFirstChoice"
	CUCUMBER_PROFILE=en_fc_ios
	TESTENV='EN_FC'
	calabash-ios sim locale en
elif [ $3 == "sv" ] || [ $3 == "da" ] || [ $3 == "fi" ] || [ $3 == "nb" ] ; then
	calabash-ios sim locale $3
	TI_SCHEME="nordics"
	APPNAME="MinFerie"
	CUCUMBER_PROFILE=nor_ios
	TESTENV='NOR'
fi

BUILD_CONFIG="Debug"
PROJECT_PATH="features"
ARCHITECTURE_SELECTED=i386
SCHEME_XC="${APPNAME}-cal"
PROJ_LOC="${PROJ_FOLDER}/build/iphone/${APPNAME}.xcodeproj"

if [ "$1" == "clean" ] ; then
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
#	${PROJ_FOLDER}/app/themes/${TI_SCHEME}/i18n/
	sleep 1
    killall "iPhone Simulator"
	killall Xcode
    sleep 1
fi

#Do not perform below steps when there are no tests selected to run
if [ "$2" != "NA" ] ; then

BUILT_PRODUCTS_DIR=$(xcodebuild -project "${PROJ_LOC}" ARCHS="${ARCHITECTURE_SELECTED}" ONLY_ACTIVE_ARCH=NO -sdk iphonesimulator  -configuration "${BUILD_CONFIG}" -showBuildSettings | grep -m 1 "BUILT_PRODUCTS_DIR" | grep -oEi "\/.*" | xargs -L1 dirname)
if [ "$BUILT_PRODUCTS_DIR" == "" ] ; then
 BUILT_PRODUCTS_DIR=/usr/local/xcode/Build/Products
fi

echo $BUILT_PRODUCTS_DIR

APP_BUNDLE_PATH_VAR="${BUILT_PRODUCTS_DIR}"/"${BUILD_CONFIG}"-iphonesimulator/"${APPNAME}".app
echo $APP_BUNDLE_PATH_VAR

echo TESTENV=$TESTENV SCREENSHOT_PATH=features/report/ios_screens/$3 LANG=$3 BUNDLE_ID=$BUNDLE DEVICE=iphone APP_BUNDLE_PATH="${APP_BUNDLE_PATH_VAR}" bundle exec cucumber -p $CUCUMBER_PROFILE features/  --tag $tagged_test  -f html -o ios-$3-report.html  -f junit -o features/report/junit/$3
TESTENV=$TESTENV SCREENSHOT_PATH=features/report/ios_screens/$3 LANG=$3 BUNDLE_ID=$BUNDLE DEVICE=iphone APP_BUNDLE_PATH="${APP_BUNDLE_PATH_VAR}" bundle exec cucumber -p $CUCUMBER_PROFILE features/  --tag $tagged_test  -f html -o ios-$3-report.html  -f junit -o features/report/junit/$3

fi