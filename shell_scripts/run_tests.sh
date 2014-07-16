#!/bin/sh
clear
DATE=`date +%d-%m-%Y-%H-%M`

export LC_CTYPE=en_US.UTF-8

if [ "$#" -le "4" ]; then
	echo "\n4 ARGUMENTS NEEDED"
	echo "1) platform name ios / android / both"
	echo "2) clean(clean project) or NA (for running project without cleaning"
	echo "3) Tags selected for test run ex: @sanity or @reg"
    echo "4) App to test ex: en_th / de / en_fc /sv / fi/ da /nb "
    echo "5) relative folder path where source code is located"

	echo "\nsample command: \n 1) sh run_tests.sh both clean @basic-sanity en_th ../meine.tui"
	echo " 2) sh run_tests.sh ios clean @basic-sanity en_th ../meine.tui\n"
	exit
fi

if [ "$1" == "ios" ] ; then
	calabash-ios sim reset
	echo sh run_ios.sh $2 $3 $4 $5
	sh run_ios.sh $2 $3 $4 $5

elif [ "$1" == "android" ] ; then
	echo sh runandroid.sh $2 $3 $4 $5 "ci"
	sh runandroid.sh $2 $3 $4 $5 "ci"
else
	echo sh runandroid.sh $2 NA $4 $5 "ci" #just compile and generate apk test are NA
	sh runandroid.sh $2 NA $4 $5 "ci"
	sh runandroid.sh install $3 $4 $5 "ci" & #Install apk and run test in background

	calabash-ios sim reset # reset simulator
	echo sh run_ios.sh $2 $3 $4 $5 # run test for ios
	sh run_ios.sh $2 $3 $4 $5
fi
