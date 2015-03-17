#!/bin/sh
clear
DATE=`date +%d-%m-%Y-%H-%M`

export LC_CTYPE=en_US.UTF-8



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
	exit 1
fi


#sh  build/shell_scripts/start_device.sh
LANG=$3
HW=$4
DEVICE_ID=$6

PROJ_FOLDER=$5
tagged_test=$2
LANG_STR=$LANG
FILENAME="../Appfiles/android$LANG$HW.apk"
mkdir -p ../Appfiles

if [ -z "$2" ] ; then
	echo "Tags not specified using @failed"
	exit 1
else
	tagged_test=$2
fi

echo "TDA project location:"${PROJ_FOLDER}

if [ $LANG == "de" ] ; then
	APK_NAME="meine TUI"
	CUCUMBER_PROFILE=de_mt_android
	TI_SCHEME=meinetui
  TESTENV='DE_MT'
  PACKAGE_ID="de.tui.meinetui"

elif [ $LANG == "en_th" ] ; then
	APK_NAME=MyThomson
	CUCUMBER_PROFILE=en_th_android
	TI_SCHEME=thomson
  TESTENV='EN_TH'
  PACKAGE_ID="com.thomson.mythomson"

elif [ $LANG == "en_fc" ] ; then
	APK_NAME=MyFirstChoice
	CUCUMBER_PROFILE=en_fc_android
	TI_SCHEME=firstchoice
  TESTENV='EN_FC'
  PACKAGE_ID="com.firstchoice.myfirstchoice"

elif [ $LANG == "sv" ] || [ $LANG == "da" ] || [ $LANG == "fi" ] || [ $LANG == "nb" ] ; then
	TI_SCHEME="nordics"
	APK_NAME="MinFerie"
	CUCUMBER_PROFILE=nor_android
	TESTENV='NOR'
  PACKAGE_ID="com.tuitravel.minferie"
fi

	if [ "$1" == "clean" ] ; then
		if [ $HW == "phone" ] ; then
			APK_NAME=$APK_NAME".apk"
			export ANDROID_HOME=$HOME/Library/android-sdk-macosx-R22
			echo "phone .. adb"
		elif [ $HW == "tablet" ] ; then
			APK_NAME=$APK_NAME" Tablet.apk"
			export ANDROID_HOME=$HOME/Library/android-sdk-macosx
			echo "tablet .. adb"
		fi
	else
		#Temp fix until android tablet is run on different machine
		export ANDROID_HOME=$HOME/Library/android-sdk-macosx
		export PATH=$ANDROID_HOME/tools:$PATH
		export PATH=$ANDROID_HOME/platform-tools:$PATH
		echo "$ANDROID_HOME"
	fi

	export PATH=$ANDROID_HOME/tools:$PATH
	export PATH=$ANDROID_HOME/platform-tools:$PATH
	STRINGS_FOLDER=features/test_data/$LANG_STR/

  if [ $DEVICE_ID  ] ; then
  	ADB_DEVICE="-s "$DEVICE_ID
  else
    echo "No Device specified"
  	exit 1
  fi

killall -9 adb
sleep 2
ADB=adb
#ADB=$ANDROID_HOME/platform-tools/adb
which $ADB
$ADB devices
	if [ $1 == "install" ] || [ $1 == "clean" ] ; then
		if [ "$2" != "NA" ] ; then
			if [ $HW == "phone" ] ; then
				ADB_DEVICE=""
				echo $ADB  $ADB_DEVICE uninstall $PACKAGE_ID
				$ADB version
				$ADB get-serialno
				$ADB get-state
				$ADB $ADB_DEVICE uninstall $PACKAGE_ID
				echo $ADB $ADB_DEVICE uninstall "$PACKAGE_ID".test
				$ADB $ADB_DEVICE uninstall "$PACKAGE_ID".test
			elif [ $HW == "tablet" ] ; then
				echo $ADB $ADB_DEVICE uninstall "$PACKAGE_ID".dev.tablet
				$ADB $ADB_DEVICE uninstall "$PACKAGE_ID".dev.tablet
				echo $ADB $ADB_DEVICE uninstall "$PACKAGE_ID".dev.tablet.test
				$ADB $ADB_DEVICE uninstall "$PACKAGE_ID".dev.tablet.test
			fi
		fi

		if [ "$1" == "clean" ] ; then
			echo "\n\n\nCleaning and building application for android tests...\n\n\n"
			cp Gemfile ${PROJ_FOLDER}
			cd ${PROJ_FOLDER}/
			rm -rf build/ Resources/
			ti clean

		  # fetch latest strings
		  if [ $HW == "phone" ]; then
		    node releaseScripts/build.js $TI_SCHEME
		    node releaseScripts/build.js $TI_SCHEME -l
		  else
		    /usr/local/bin/grunt
		    node releaseScripts/build.js --brand $TI_SCHEME
		    node releaseScripts/build.js --brand $TI_SCHEME -l
		  fi
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
			SRC_STR=${PROJ_FOLDER}/app/themes/nordics/i18n/$LANG/strings.xml
			echo cp $PROJ_FOLDER/build/android/bin/"$APK_NAME"  $FILENAME
			cp $PROJ_FOLDER/build/android/bin/"$APK_NAME"  $FILENAME
			fi
		fi

	calabash-android resign $FILENAME

	#Do not perform below steps when there are no tests selected to run
fi


if [ "$2" != "NA" ] ; then
	rm -rf test_servers/
	echo "Resigning APP"
	calabash-android resign $FILENAME
	calabash-android build $FILENAME

	echo adb $ADB_DEVICE install -r $FILENAME
	adb $ADB_DEVICE install -r $FILENAME

	echo adb $ADB_DEVICE install -r test_servers/*.apk
	adb $ADB_DEVICE install -r test_servers/*.apk
fi


echo "********* BEGINNING OF TESTS *********"

if [ "$2" != "NA" ] ; then

	if [ "$DEVICE_ID" != "" ] && [ "$7" == "ci" ] ; then
		echo "device selected"
		echo ADB_DEVICE_ARG=$DEVICE_ID SCREENSHOT_PATH=features/report/android$LANG TESTENV=$TESTENV HW=$HW OS=android LANG=$3 bundle exec calabash-android run $FILENAME -p $CUCUMBER_PROFILE --tag $tagged_test   -f html -o android-$3-report.html  -f junit -o features/report/junit/$3
	 	DEBUG=1 ADB_DEVICE_ARG=$DEVICE_ID SCREENSHOT_PATH=features/report/android$LANG TESTENV=$TESTENV HW=$HW OS=android LANG=$3 bundle exec calabash-android run $FILENAME -p $CUCUMBER_PROFILE --tag $tagged_test   -f html -o android-$3-report.html  -f junit -o features/report/junit/$3
	else
	echo "No device selected"
		echo SCREENSHOT_PATH=features/report/android$LANG TESTENV=$TESTENV HW=$HW OS=android LANG=$3 bundle exec calabash-android run $FILENAME -p $CUCUMBER_PROFILE --tag $tagged_test   -f html -o android-$3-report.html  -f junit -o features/report/junit/$3
		DEBUG=1 SCREENSHOT_PATH=features/report/android$LANG TESTENV=$TESTENV HW=$HW OS=android LANG=$3 bundle exec calabash-android run $FILENAME -p $CUCUMBER_PROFILE --tag $tagged_test   -f html -o android-$3-report.html  -f junit -o features/report/junit/$3
	fi
fi