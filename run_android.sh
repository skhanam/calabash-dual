#!/bin/sh
clear
DATE=`date +%d-%m-%Y-%H-%M`

export LC_CTYPE=en_US.UTF-8

if [ "$5" == "ci" ]; then
echo "Running tests from CI"
export ANDROID_HOME=/Applications/adt/sdk
export PATH=$ANDROID_HOME/tools:$PATH
export PATH=$ANDROID_HOME/platform-tools:$PATH
fi

if [ "$#" -le "4" ]; then
	echo "\n4 ARGUMENTS NEEDED"
	echo "1) clean(clean project) or NA (for running project without cleaning"
	echo "2) Tags selected for test run ex: @sanity or @reg"
    echo "3) App to test ex: en_th / de / en_fc /sv / fi/ da /nb "
    echo "4) Hardware on which tests are run tablet/ phone"
    echo "5) relative folder path where source code is located"

	echo "\nSample command: \n 1) sh run_android.sh clean @sanity de phone ../tda"
	echo " 2)sh run_android.sh NA @tab-sanity de phone ../tda"
	echo " 3)sh run_android.sh NA @testnow en_fc phone ../tda\n"

	echo "\nSample command: \n 1) sh run_android.sh clean @tab-sanity de tablet ../tda.tablet"
	echo " 2)sh run_android.sh NA @tab-sanity en_th tablet ../tda.tablet"
	exit
fi


#sh  build/shell_scripts/start_device.sh
LANG=$3
HW=$4

PROJ_FOLDER=$5
tagged_test=$2
LANG_STR=$LANG
FILENAME="../Appfiles/android$LANG$HW.apk"
mkdir -p ../Appfiles


if [ -z "$2" ] ; then
echo "Tags not specified using @failed"
exit
else
tagged_test=$2
fi

echo "TDA project location:"${PROJ_FOLDER}

if [ $LANG == "de" ] ; then
	APK_NAME="meine TUI.apk"
	CUCUMBER_PROFILE=de_mt_android
	TI_SCHEME=meinetui
    TESTENV='DE_MT'

elif [ $LANG == "en_th" ] ; then
	APK_NAME=MyThomson.apk
	CUCUMBER_PROFILE=en_th_android
	TI_SCHEME=thomson
    TESTENV='EN_TH'

elif [ $LANG == "en_fc" ] ; then
	APK_NAME=MyFirstChoice.apk
	CUCUMBER_PROFILE=en_fc_android
	TI_SCHEME=firstchoice
    TESTENV='EN_FC'

elif [ $LANG == "sv" ] || [ $LANG == "da" ] || [ $LANG == "fi" ] || [ $LANG == "nb" ] ; then
	TI_SCHEME="nordics"
	APK_NAME="MinFerie.apk"
	CUCUMBER_PROFILE=nor_android
	TESTENV='NOR'
fi

STRINGS_FOLDER=features/test_data/$LANG_STR/

if [ $1 == "install" ] || [ $1 == "clean" ] ; then
	adb uninstall de.tui.meinetui.test
    adb uninstall de.tui.meinetui

    adb uninstall com.thomson.mythomson
    adb uninstall com.thomson.mythomson.test

	adb uninstall com.firstchoice.myfirstchoice.test
    adb uninstall com.firstchoice.myfirstchoice

    adb uninstall com.tuitravel.minferie.test
    adb uninstall com.tuitravel.minferie

	if [ "$1" == "clean" ] ; then
		echo "\n\n\nCleaning and building application for android tests...\n\n\n"
		cp Gemfile ${PROJ_FOLDER}
		cd ${PROJ_FOLDER}/
		rm -rf build/ Resources/
		ti clean
		node releaseScripts/build.js $TI_SCHEME
		node releaseScripts/build.js $TI_SCHEME -l
		ti build -p android -b
		cd -

    echo "******** ####  Deleting old App file "$FILENAME
    [ -d "$FILENAME" ] && rm -rf "$FILENAME"

		echo cp $PROJ_FOLDER/build/android/bin/"$APK_NAME"  $FILENAME
		cp $PROJ_FOLDER/build/android/bin/"$APK_NAME"  $FILENAME


		if [ $LANG == "de" ] ; then
			SRC_STR=${PROJ_FOLDER}/i18n/de/strings.xml
			SRC_STR=${PROJ_FOLDER}/app/themes/meinetui/i18n/de/strings.xml
		elif [ $LANG == "en_th" ] ; then
			SRC_STR=${PROJ_FOLDER}/app/themes/thomson/i18n/en/strings.xml
		elif [ $LANG == "en_fc" ] ; then
			SRC_STR=${PROJ_FOLDER}/app/themes/firstchoice/i18n/en/strings.xml
		elif [ "$LANG" == "da" ] || [ "$LANG" != "fi" ] || [ "$LANG" == "nb" ] || [ "$LANG" != "sv" ] ; then

		cp ../tda/app/themes/nordics/i18n/en/strings.xml features/test_data/en/
		killall "iPhone Simulator"
		SRC_STR=${PROJ_FOLDER}/app/themes/nordics/i18n/$LANG/strings.xml
		fi
	fi


	# Copy the required apk files
	if [ "$5" == "ci" ]; then
	echo cp $PROJ_FOLDER/build/android/bin/"$APK_NAME"  $FILENAME
	cp $PROJ_FOLDER/build/android/bin/"$APK_NAME"  $FILENAME
	calabash-android resign $FILENAME
	fi

	#Do not perform below steps when there are no tests selected to run

fi

if [ "$2" != "NA" ] ; then
	rm -rf test_servers/
	calabash-android resign $FILENAME
	calabash-android build $FILENAME
	adb install -r $FILENAME
	adb install -r test_servers/*.apk
fi

if [ "$2" != "NA" ] ; then
echo SCREENSHOT_PATH=features/report/android$LANG TESTENV=$TESTENV HW=$HW OS=android LANG=$3 bundle exec calabash-android run $FILENAME -p $CUCUMBER_PROFILE --tag $tagged_test   -f html -o android-$3-report.html  -f junit -o features/report/junit/$3
SCREENSHOT_PATH=features/report/android$LANG TESTENV=$TESTENV HW=$HW OS=android LANG=$3 bundle exec calabash-android run $FILENAME -p $CUCUMBER_PROFILE --tag $tagged_test   -f html -o android-$3-report.html  -f junit -o features/report/junit/$3
fi