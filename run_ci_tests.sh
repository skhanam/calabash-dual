#!/bin/sh

clear
DATE
export LC_CTYPE=en_US.UTF-8
export PATH=/usr/local/bin:$PATH
export ANDROID_HOME=$HOME/Library/android-sdk-macosx-R22
export PATH=$ANDROID_HOME/tools:$PATH
export PATH=$ANDROID_HOME/platform-tools:$PATH
echo "$ANDROID_HOME"

HW=$5
PROJ_FOLDER=$6

if [ "$#" -le "7" ]; then
	echo "\n8 ARGUMENTS NEEDED"
	echo "1) ios or android - select platform"
	echo "2) clean(clean project) or NA (for running project without cleaning"
	echo "3) Tags selected for test run ex: @sanity or @reg"
    echo "4) App to test ex: thomson / firstchoice / meinetui /nordics"
    echo "5) phone or tablet"
    echo "6) relative folder path where source code is located"
    echo "7) device id if needed (optional) "

	echo "\nsample command"
	echo ' 1) sh run_ci_tests.sh ios clean @ph-sanity de phone ../tda NA "ci"'
	echo ' 2) sh run_ci_tests.sh ios clean @tab-sanity de tablet ../tda.tablet NA ci'
	echo "\n"
	exit
fi

echo "Removing old reports and jpeg files"

bash -c "source ~/.rvm/scripts/rvm && rvm_install_on_use_flag=1 && rvm use --create 2.0.0-p353@global && export > rvm.env"
source rvm.env

# install bundler only first time
#gem install bundler
#gem list

bundle install

if [ "$2" == "clean" ] ; then
	echo cp -r $PROJ_FOLDER ../source_de
	echo cp -r $PROJ_FOLDER ../source_en_th
	echo cp -r $PROJ_FOLDER ../source_en_fc
	echo cp -r $PROJ_FOLDER ../source_nor
	echo "*-*-*-*-*-*-*  Copying source code *-*-*-*-*-*-*"

	cp -r $PROJ_FOLDER ../source_de &
	cp -r $PROJ_FOLDER ../source_en_th &
	cp -r $PROJ_FOLDER ../source_en_fc &
	cp -r $PROJ_FOLDER ../source_nor &
	wait
	echo "*-*-*-*-*-*-*  Copying source completed *-*-*-*-*-*-* "
fi

if [ "$1" == "ios" ] ; then
	calabash-ios sim reset

	if [ "$2" == "clean" ] ; then
		sh run_ios.sh $2 $3 de $5 ../source_de $DEVICE_ID "ci" &
		sh run_ios.sh $2 $3 en_th $5 ../source_en_th $DEVICE_ID "ci" &
		sh run_ios.sh $2 $3 en_fc $5 ../source_en_fc $DEVICE_ID "ci" &
		sh run_ios.sh $2 $3 sv $5 ../source_nor $DEVICE_ID "ci" &
		wait
	  echo "*-*-*-*-*-*-* IOS builds completed successfully *-*-*-*-*-*-* "
	else
		echo sh run_ios.sh $2 $3 $4 $5 $6 $7 "ci"
		sh run_ios.sh $2 $3 $4 $5 $6 $7 "ci"
	fi
elif [ "$1" == "android" ] ; then
	if [ "$6" == "emulator" ] ; then
		sh shell_scripts/start_device.sh
	fi

	if [ $HW == "phone" ] ; then
    DEVICE_ID=192.168.56.102:5555
  elif [ $HW == "tablet" ] ; then
    DEVICE_ID=192.168.56.101:5555
  fi

	if [ "$2" == "clean" ] ; then

		sh run_android.sh $2 $3 de $5 ../source_de $DEVICE_ID "ci" &
		sh run_android.sh $2 $3 en_th $5 ../source_en_th $DEVICE_ID "ci" &
		sh run_android.sh $2 $3 en_fc $5 ../source_en_fc $DEVICE_ID "ci" &
		sh run_android.sh $2 $3 sv $5 ../source_nor $DEVICE_ID "ci" &
		wait
	else
		sh run_android.sh $2 $3 $4 $5 $6 $DEVICE_ID "ci"
	fi
else
	echo "wrong arguments"
	exit
fi

DATE