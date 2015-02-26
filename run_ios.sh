#!/bin/sh
clear
DATE=`date +%d-%m-%Y-%H-%M`

export LC_CTYPE=en_US.UTF-8

echo "Parameter list:::::---   sh $0 $1 $2 $3 $4 $5 $6 $7 $8 ---:::::"

if [ "$#" -le "4" ]; then
	echo "\n4 ARGUMENTS NEEDED"
	echo "1) clean(clean project) or NA (for running project without cleaning"
	echo "2) Tags selected for test run ex: @sanity or @reg"
    echo "3) App to test ex: en_th / de / en_fc /sv / fi/ da /nb "
    echo "4) Hardware on which tests are run tablet/ phone"
    echo "5) relative folder path where source code is located"

	echo "\nSample command: \n 1) sh run_ios.sh clean @sanity de phone ../tda"
	echo " 2)sh run_ios.sh NA @tab-sanity de phone ../tda "
	echo " 3)sh run_ios.sh NA @testnow en_fc phone ../tda\n"

	echo "\nSample command: \n 1) sh run_ios.sh clean @tab-sanity de tablet ../tda.tablet"
	echo " 2)sh run_ios.sh NA @tab-sanity en_th tablet ../tda.tablet"
	exit
fi

LANG=$3
HW=$4

DEVICE_ID=$6
PROJ_FOLDER=$5
tagged_test=$2
LANG_STR=$LANG
FILENAME="../Appfiles/ios$LANG$HW.app"
mkdir -p ../Appfiles

echo "******** ####  Command entered\t:sh run_ios.sh $1 $2 $3 $4 $5 $6 $7 :"

if [ $LANG == "de" ] ; then
	TI_SCHEME="meinetui"
	APPNAME="Meine TUI"
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

STRINGS_FOLDER=features/test_data/$LANG_STR/

if [ $4 == "tablet" ] ; then
	APPNAME=$APPNAME" Tablet"
fi

if [ "$1" == "clean" ] ; then
	echo "Cleaning and rebuilding project folder:${PROJ_FOLDER}"
	echo "******** ####  Updating All Projects"
	cp build/calabash.exp ${PROJ_FOLDER}
	cp Gemfile ${PROJ_FOLDER}
	cd ${PROJ_FOLDER}/
	rm -rf build/ Resources/

  if [ $HW == "phone" ]; then
		node releaseScripts/build.js $TI_SCHEME
		node releaseScripts/build.js $TI_SCHEME -l
		if [ $LANG == "de" ] ; then
			echo "Not needed delete it"
			#cd -; ruby build/update_tiapp.rb $PROJ_FOLDER; cd -
		fi
	else
	   /usr/local/bin/grunt
	    node releaseScripts/build.js --brand $TI_SCHEME
	    node releaseScripts/build.js --brand $TI_SCHEME -l
	fi

	echo "******** #### " expect expect.exp ${APPNAME}
	expect calabash.exp ${HW}
	cd -

  echo "******** ####  Deleting old App file "$FILENAME
  [ -d "$FILENAME" ] && rm -rf "$FILENAME"

  echo "******** ####  copying .app file"
  echo cp -r ${PROJ_FOLDER}/build/iphone/build/Debug-iphonesimulator/"${APPNAME}".app $FILENAME
  cp -r ${PROJ_FOLDER}/build/iphone/build/Debug-iphonesimulator/"${APPNAME}".app $FILENAME

fi

if [ "$1" == "clean" ] || [ "$7" != "ci" ] ; then
	killall "iPhone Simulator"
	killall Xcode                                                                 ]
	sleep 1

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

    DEST_STR=features/test_data/$LANG/
  	echo "******** ####  copying language strings $SRC_STR $DEST_STR"
    cp $SRC_STR $DEST_STR
fi

if [ $HW == "tablet" ] ; then
	DEVICE_TARGET='iPad Retina (64-bit) - Simulator - iOS 7.1'
	#DEVICE_TARGET='iPad Retina (8.1 Simulator)'
elif [ $HW == "phone" ] ; then
	DEVICE_TARGET='iPhone Retina (4-inch) - Simulator - iOS 7.1'
fi



if [ "$2" != "NA" ] ; then
 if [ $LANG == "sv" ] ; then
	ios-sim-locale -sdk 7.1  -language sv -locale sv_SE
	echo ios-sim-locale -sdk 7.1  -language sv -locale sv_SE
 elif [ "$LANG" == "da" ] ; then
	ios-sim-locale -sdk 7.1  -language da -locale da_DK
 elif [ "$LANG" == "fi" ] ; then
	ios-sim-locale -sdk 7.1  -language fi -locale fi_FI
 elif [ "$LANG" == "nb" ] ; then
	ios-sim-locale -sdk 7.1  -language nb -locale nb_NO
  elif [ "$LANG" == "de" ] ; then
	ios-sim-locale -sdk 7.1  -language de -locale de_DE
 elif [ "$LANG" == "en_th" ] || [ "$LANG" != "en_fc" ] ; then
	ios-sim-locale -sdk 7.1  -language en -locale en_EN
 fi
killall "iPhone Simulator"

{
if [ ! -d $FILENAME ]; then
    echo "\n\n**************************************************************************"
    echo "********* ${FILENAME} File not found! ****************"
    echo "******************* 		CLEAN AND BUILD		 ******************"
    echo "**************************************************************************\n\n"
    exit 0
fi
}
echo DEVICE_TARGET=$DEVICE_TARGET OS=ios HW=$HW TESTENV=$TESTENV SCREENSHOT_PATH=features/report/ios$LANG LANG=$LANG APP_BUNDLE_PATH=$FILENAME bundle exec cucumber -p $CUCUMBER_PROFILE features/ --tag $tagged_test -f html -o ios-$3-report.html  -f junit -o features/report/junit/$3
DEBUG=1 DEVICE_TARGET=$DEVICE_TARGET OS=ios HW=$HW TESTENV=$TESTENV SCREENSHOT_PATH=features/report/ios$LANG LANG=$LANG APP_BUNDLE_PATH=$FILENAME bundle exec cucumber -p $CUCUMBER_PROFILE features/ --tag $tagged_test -f html -o ios-$3-report.html  -f junit -o features/report/junit/$3
fi