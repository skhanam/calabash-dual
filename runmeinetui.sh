#!/bin/sh
DATE=`date +%d-%m-%Y-%H-%M`

if [ -z "$2" ] ; then
echo "Running tests on default directory \n\n"
PROJ_NAME="meine.tui"
else
PROJ_NAME=$2
fi

SCHEME_XC="meine TUI-cal"
BUILD_CONFIG="Debug"
PROJECT_PATH="features"
ARCHITECTURE_SELECTED=i386
APPNAME="meine TUI"
PROJ_LOC="${PROJ_NAME}/build/iphone/meine TUI.xcodeproj"

if [ "$1" == "clean" ] ; then
killall Xcode
./expect.sh $PROJ_NAME
open -a Xcode
sleep  5
echo $PROJ_LOC
open $PROJ_LOC
sleep 30
xcodebuild  -scheme "${SCHEME_XC}" -project "${PROJ_LOC}" -configuration Debug ONLY_ACTIVE_ARCH=NO -sdk iphonesimulator build
fi

BUILT_PRODUCTS_DIR=$(xcodebuild -project "${PROJ_LOC}" ARCHS="${ARCHITECTURE_SELECTED}" ONLY_ACTIVE_ARCH=NO -sdk iphonesimulator  -configuration "${BUILD_CONFIG}" -showBuildSettings | grep -m 1 "BUILT_PRODUCTS_DIR" | grep -oEi "\/.*" | xargs -L1 dirname)

APP_BUNDLE_PATH_VAR="${BUILT_PRODUCTS_DIR}"/"${BUILD_CONFIG}"-iphonesimulator/"${APPNAME}".app
echo $APP_BUNDLE_PATH_VAR

echo DEVICE_TARGET=simulator TESTENV=DE_MT TESTENV="DE_MT" BUNDLE_ID=$BUNDLE DEVICE=iphone APP_BUNDLE_PATH="${APP_BUNDLE_PATH_VAR}" cucumber -p de_mt_ios -f html -o report.html features/
DEVICE_TARGET=simulator TESTENV=DE_MT TESTENV="DE_MT" BUNDLE_ID=$BUNDLE DEVICE=iphone APP_BUNDLE_PATH="${APP_BUNDLE_PATH_VAR}" cucumber -p de_mt_ios -f html -o report.html features/

