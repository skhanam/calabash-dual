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
elif [ $LANG == "en_fc" ] ; then
	TI_SCHEME="firstchoice"
	APPNAME="MyFirstChoice"
	CUCUMBER_PROFILE=en_fc_ios
	TESTENV='EN_FC'
	calabash-ios sim locale en
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

	cp expect.exp ../${PROJ_FOLDER}/
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
fi

if [ "$1" == "clean" ] || [ "$1" != "ci" ] ; then
	cp -r ${PROJ_FOLDER}/i18n/* features/test_data/
	killall "iPhone Simulator"
	killall Xcode
	sleep 1
fi

#cp expect.exp ../tda.tablet/
#cd ../tda.tablet
#ti clean
#ti build -p ios -Y ipad -b --retina
#expect expect.exp
#cd -

exit

cp -r ../tda.tablet/build/iphone/build/Debug-iphonesimulator/"${APPNAME}".app ios$LANG.app
echo DEVICE_TARGET='iPad Retina (64-bit) - Simulator - iOS 7.1' OS=ios HW=tablet TESTENV=$TESTENV SCREENSHOT_PATH=features/report/ios$LANG LANG=$LANG APP_BUNDLE_PATH=./ios$LANG.app bundle exec cucumber -p $CUCUMBER_PROFILE features/ --tag @sanity312
DEVICE_TARGET='iPad Retina (64-bit) - Simulator - iOS 7.1' OS=ios HW=tablet TESTENV=$TESTENV SCREENSHOT_PATH=features/report/ios$LANG LANG=$LANG APP_BUNDLE_PATH=./ios$LANG.app bundle exec cucumber -p $CUCUMBER_PROFILE features/ --tag @sanity312
exit

---------------------------------


BUILD_CONFIG="Debug"
PROJECT_PATH="features"
ARCHITECTURE_SELECTED=i386
SCHEME="${SCHEME}-iPad"
SCHEME_CAL="${SCHEME}-cal"
PROJ_LOC="${PROJ_FOLDER}/build/iphone/${APPNAME}.xcodeproj"


#Do this below step only when compile option is selected -  used for CI
if [ "$1" == "compile" ] ; then
   cd ${PROJ_FOLDER}/
    titanium build --platform ios -S 7.1 -Y ipad -b
   cd -
fi

if [ "$1" == "clean" ] || [ "$1" == "compile" ] ; then

	echo "Compiling code .."
	echo xcodebuild  -scheme "${SCHEME_CAL}" -project "${PROJ_LOC}" -configuration Debug ONLY_ACTIVE_ARCH=NO build -sdk iphonesimulator7.1
	xcodebuild  -scheme "${SCHEME_CAL}" -project "${PROJ_LOC}" -configuration Debug ONLY_ACTIVE_ARCH=NO build -sdk iphonesimulator7.1
	#xcodebuild  -scheme "${SCHEME_CAL}" -project "${PROJ_LOC}" -configuration Debug ONLY_ACTIVE_ARCH=NO build -sdk iphonesimulator7.1
	cp -r ${PROJ_FOLDER}/i18n/* features/test_data/
	#	${PROJ_FOLDER}/app/themes/${TI_SCHEME}/i18n/
	sleep 1
	killall "iPhone Simulator"
	killall Xcode
	sleep 1
fi

#Do not perform below steps when there are no tests selected to run
if [ "$2" != "NA" ] ; then
	if [ "$6" != "ci" ] ; then
		BUILT_PRODUCTS_DIR=$(xcodebuild -project "${PROJ_LOC}" ARCHS="${ARCHITECTURE_SELECTED}" ONLY_ACTIVE_ARCH=NO -sdk iphonesimulator  -configuration "${BUILD_CONFIG}" -showBuildSettings | grep -m 1 "BUILT_PRODUCTS_DIR" | grep -oEi "\/.*" | xargs -L1 dirname)

		if [ "$BUILT_PRODUCTS_DIR" == "" ] ; then
			BUILT_PRODUCTS_DIR=/usr/local/xcode/Build/Products
		fi

		echo $BUILT_PRODUCTS_DIR
    	APP_BUNDLE_PATH_VAR="${BUILT_PRODUCTS_DIR}"/"${BUILD_CONFIG}"-iphonesimulator/"${APPNAME}".app
    	echo $APP_BUNDLE_PATH_VAR
	else
		APP_BUNDLE_PATH_VAR=../Debug-iphonesimulator/"${APPNAME}".app
	fi

tda.tablet/build/iphone/build/Debug-iphonesimulator/meineTuiTablet.app
	echo DEVICE_TARGET="iPad Retina - Simulator - iOS 7.1" OS=ios HW=tablet TESTENV=$TESTENV SCREENSHOT_PATH=features/report/ios$3 LANG=$3 BUNDLE_ID=$BUNDLE APP_BUNDLE_PATH=../tda.tablet/build/iphone/build/Debug-iphonesimulator/meineTuiTablet.app bundle exec cucumber -p $CUCUMBER_PROFILE features/  --tag $tagged_test  -f html -o ios-$3-report.html  -f junit -o features/report/junit/$3
	DEVICE_TARGET="iPad - Simulator - iOS 7.1" OS=ios HW=tablet TESTENV=$TESTENV SCREENSHOT_PATH=features/report/ios$3 LANG=$3 APP_BUNDLE_PATH=../tda.tablet/build/iphone/build/Debug-iphonesimulator/meineTuiTablet.app bundle exec cucumber -p $CUCUMBER_PROFILE features/  --tag $tagged_test  -f html -o ios-$3-report.html  -f junit -o features/report/junit/$3

	#echo DEVICE_TARGET='iPhone Retina (4-inch) - Simulator - iOS 7.1' TESTENV=$TESTENV SCREENSHOT_PATH=features/report/iosscreenshots/$3 LANG=$3 BUNDLE_ID=$BUNDLE DEVICE=phone APP_BUNDLE_PATH="${APP_BUNDLE_PATH_VAR}" bundle exec cucumber -p $CUCUMBER_PROFILE features/  --tag $tagged_test  -f html -o ios-$3-report.html  -f junit -o features/report/junit/$3
	#DEVICE_TARGET='iPhone Retina (4-inch) - Simulator - iOS 7.1' TESTENV=$TESTENV SCREENSHOT_PATH=features/report/iosscreenshots/$3 LANG=$3 BUNDLE_ID=$BUNDLE DEVICE=phone APP_BUNDLE_PATH="${APP_BUNDLE_PATH_VAR}" bundle exec cucumber -p $CUCUMBER_PROFILE features/  --tag $tagged_test  -f html -o ios-$3-report.html  -f junit -o features/report/junit/$3

fi