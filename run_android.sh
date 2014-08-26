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


if [ "$#" -le "3" ]; then
	echo "\n\n\n2 ARGUMENTS NEEDED"
	echo "1) clean(clean project) or NA (for running project without cleaning"
	echo "2) Tags selected for test run ex: @sanity or @reg"
    echo "3) App to test ex: en_th / de / en_fc /sv / fi/ da /nb"
    echo "4) relative folder path where source code is located"

	echo "\nsample command: sh run_android.sh clean @sanity de ../meine.tui\n"
	echo "or\nsample command: sh run_android.sh NA  @sanity-eng en_th ../meine.tui\n"
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
    TESTENV='DE_MT'

elif [ $TI_SCHEME == "en_th" ] ; then
	APK_NAME=MyThomson.apk
	CUCUMBER_PROFILE=en_th_android
	TI_SCHEME=thomson
    TESTENV='EN_TH'

elif [ $TI_SCHEME == "en_fc" ] ; then
	APK_NAME=MyFirstChoice.apk
	CUCUMBER_PROFILE=en_fc_android
	TI_SCHEME=firstchoice
    TESTENV='EN_FC'

elif [ $3 == "sv" ] || [ $3 == "da" ] || [ $3 == "fi" ] || [ $3 == "nb" ] ; then
	TI_SCHEME="nordics"
	APK_NAME="MinFerie.apk"
	CUCUMBER_PROFILE=nor_android
	TESTENV='NOR'
fi

if [ $1 == "install" ] || [ $1 == "clean" ] ; then
	adb uninstall de.tui.meinetui.test
    adb uninstall de.tui.meinetui

    adb uninstall com.thomson.mythomson
    adb uninstall com.thomson.mythomson.test

	adb uninstall com.firstchoice.myfirstchoice.test
    adb uninstall com.firstchoice.myfirstchoice

	adb uninstall com.tuitravelplc.myholiday
    adb uninstall com.tuitravelplc.myholiday.test

    adb uninstall com.tuitravel.minferie.test
    adb uninstall com.tuitravel.minferie

	adb uninstall de.tui.meinetui.tablet.test
	adb uninstall de.tui.meinetui.tablet


	if [ "$1" == "clean" ] ; then
		echo "\n\n\nCleaning and building application for android tests...\n\n\n"

		cd ${PROJ_FOLDER}/
			ti clean
			node releaseScripts/build.js --brand $TI_SCHEME
           	node releaseScripts/build.js --brand $TI_SCHEME -l
		cd -

		cp $PROJ_FOLDER/build/android/bin/"$APK_NAME"  "$3"app.apk
		cp $PROJ_FOLDER/build/android/bin/"$APK_NAME"  app.apk

		cp -r $PROJ_FOLDER/i18n/* features/test_data/

	fi

	# Copy the required apk files
	if [ "$5" == "ci" ]; then
	cp $PROJ_FOLDER/build/android/bin/"$APK_NAME"  "$3"app.apk
	cp $PROJ_FOLDER/build/android/bin/"$APK_NAME"  app.apk
	cp -r $PROJ_FOLDER/i18n/* features/test_data/
	fi

	#Do not perform below steps when there are no tests selected to run
	if [ "$2" != "NA" ] ; then
		rm -rf test_servers/
		calabash-android resign "$3"app.apk
		calabash-android build "$3"app.apk
		adb install -r "$3"app.apk
		adb install -r test_servers/*.apk
	fi

fi

if [ "$2" != "NA" ] ; then
echo SCREENSHOT_PATH=features/report/android_$3 TESTENV=$TESTENV LANG=$3 bundle exec calabash-android run "$3"app.apk -p $CUCUMBER_PROFILE --tag $tagged_test   -f html -o android-$3-report.html  -f junit -o features/report/junit/$3
SCREENSHOT_PATH=features/report/android_$3 TESTENV=$TESTENV LANG=$3 bundle exec calabash-android run "$3"app.apk -p $CUCUMBER_PROFILE --tag $tagged_test   -f html -o android-$3-report.html  -f junit -o features/report/junit/$3
#echo SCREENSHOT_PATH=features/report/androidscreenshots/$3 TESTENV=$TESTENV LANG=$3 bundle exec calabash-android run "$3"app.apk -p $CUCUMBER_PROFILE --tag $tagged_test   -f html -o android-$3-report.html  -f junit -o features/report/junit/$3
#SCREENSHOT_PATH=features/report/androidscreenshots/$3 TESTENV=$TESTENV LANG=$3 bundle exec calabash-android run "$3"app.apk -p $CUCUMBER_PROFILE --tag $tagged_test   -f html -o android-$3-report.html  -f junit -o features/report/junit/$3
fi