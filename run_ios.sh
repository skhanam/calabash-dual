#!/bin/sh
clear
DATE=`date +%d-%m-%Y-%H-%M`

export LC_CTYPE=en_US.UTF-8


LANG=$3
PROJ_FOLDER=$5

if [ -z "$2" ] ; then
echo "Tags not specified using @failed"
exit
else
tagged_test=$2
fi

if [ "$#" -le "4" ]; then
	echo "\n4 ARGUMENTS NEEDED"
	echo "1) clean(clean project) or NA (for running project without cleaning"
	echo "2) Tags selected for test run ex: @sanity or @reg"
    echo "3) App to test ex: en_th / de / en_fc /sv / fi/ da /nb "
    echo "4) Hardware on which tests are run tablet/ phone"
    echo "5) relative folder path where source code is located"

	echo "\nSample command: \n 1) sh run_ios.sh clean @tab-sanity de tablet ../tda.tablet"
	echo " 2) sh run_ios.sh NA @sanity da tablet ../meine.tui\n"
	exit
fi

LANG_STR=$LANG

if [ $LANG == "de" ] ; then
	TI_SCHEME="meinetui"
	APPNAME="meineTui"
	TESTENV='DE_MT'
	CUCUMBER_PROFILE=de_mt_ios
	calabash-ios sim locale en
elif [ $LANG == "en_th" ] ; then
	TI_SCHEME="thomson"
	APPNAME="MyThomson"
	TESTENV='EN_TH'
	CUCUMBER_PROFILE=en_th_ios
	calabash-ios sim locale en
	LANG_STR=en
elif [ $LANG == "en_fc" ] ; then
	TI_SCHEME="firstchoice"
	APPNAME="MyFirstChoice"
	CUCUMBER_PROFILE=en_fc_ios
	TESTENV='EN_FC'
	calabash-ios sim locale en
	LANG_STR=en
elif [ $LANG == "sv" ] || [ $LANG == "da" ] || [ $LANG == "fi" ] || [ $LANG == "nb" ] ; then
	calabash-ios sim locale $LANG
	TI_SCHEME="nordics"
	APPNAME="MinFerie"
	CUCUMBER_PROFILE=nor_ios
	TESTENV='NOR'
fi

if [ $4 == "tablet" ] ; then
	APPNAME=$APPNAME"Tablet"
fi

if [ "$1" == "clean" ] ; then
	echo "project name:"${PROJ_FOLDER}
	echo "******** ####  Updating All Projects"

	cp expect.exp ${PROJ_FOLDER}
	cd ${PROJ_FOLDER}/
	ti clean
	/usr/local/bin/grunt
	node releaseScripts/build.js --brand $TI_SCHEME
	node releaseScripts/build.js --brand $TI_SCHEME -l
	cd -

  	echo ruby update_tiapp.rb $PROJ_FOLDER "${APPNAME}"
	ruby update_tiapp.rb $PROJ_FOLDER "${APPNAME}"

    cd ${PROJ_FOLDER}/
    ti build -p ios -Y ipad -b --retina
	expect expect.exp ${APPNAME}
    cd -


	cp -r ${PROJ_FOLDER}/i18n/ features/test_data/$LANG_STR
    cp -r ${PROJ_FOLDER}/build/iphone/build/Debug-iphonesimulator/"${APPNAME}".app ios$LANG.app

fi

if [ "$1" == "clean" ] || [ "$6" != "ci" ] ; then
	cp -r ${PROJ_FOLDER}/i18n/* features/test_data/
	killall "iPhone Simulator"
	killall Xcode
	sleep 1
fi

echo DEVICE_TARGET='iPad Retina (64-bit) - Simulator - iOS 7.1' OS=ios HW=tablet TESTENV=$TESTENV SCREENSHOT_PATH=features/report/ios$LANG LANG=$LANG APP_BUNDLE_PATH=./ios$LANG.app bundle exec cucumber -p $CUCUMBER_PROFILE features/ --tag @sanity312
DEVICE_TARGET='iPad Retina (64-bit) - Simulator - iOS 7.1' OS=ios HW=tablet TESTENV=$TESTENV SCREENSHOT_PATH=features/report/ios$LANG LANG=$LANG APP_BUNDLE_PATH=./ios$LANG.app bundle exec cucumber -p $CUCUMBER_PROFILE features/ --tag @sanity312