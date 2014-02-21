#!/bin/sh
DATE=`date +%d-%m-%Y-%H-%M`

if [ -z "$2" ] ; then
echo "Running tests on default directory \n\n"
PROJ_NAME="meine.tui"
else
PROJ_NAME=$2
fi

if [ -z "$3" ] ; then
echo "Tags not specified using @failed"
tagged_test=@failed
else
tagged_test=$3
fi

ruby update_tiapp.rb $2

SCHEME_XC="meineTUI-cal"
BUILD_CONFIG="Debug"
PROJECT_PATH="features"
ARCHITECTURE_SELECTED=i386
APPNAME="meineTUI"
PROJ_LOC="../${PROJ_NAME}/build/iphone/meineTUI.xcodeproj"


if [ "$1" == "clean" ] ; then
killall Xcode
cp ./expect.exp ../${PROJ_NAME}/
cd ../${PROJ_NAME}/
./expect.exp
cd -
open -a Xcode
sleep  5
open ../${PROJ_NAME}/build/iphone/*.xcodeproj
sleep 30
xcodebuild  -scheme "${SCHEME_XC}" -project "${PROJ_LOC}" -configuration Debug ONLY_ACTIVE_ARCH=NO -sdk iphonesimulator build
fi

BUILT_PRODUCTS_DIR=$(xcodebuild -project "${PROJ_LOC}" ARCHS="${ARCHITECTURE_SELECTED}" ONLY_ACTIVE_ARCH=NO -sdk iphonesimulator  -configuration "${BUILD_CONFIG}" -showBuildSettings | grep -m 1 "BUILT_PRODUCTS_DIR" | grep -oEi "\/.*" | xargs -L1 dirname)

APP_BUNDLE_PATH_VAR="${BUILT_PRODUCTS_DIR}"/"${BUILD_CONFIG}"-iphonesimulator/"${APPNAME}".app
echo $APP_BUNDLE_PATH_VAR


echo BUNDLE_ID=$BUNDLE DEVICE=iphone APP_BUNDLE_PATH="${APP_BUNDLE_PATH_VAR}" bundle exec cucumber -p de_mt_ios_jenkins features/ --tag $tagged_test -v
BUNDLE_ID=$BUNDLE DEVICE=iphone APP_BUNDLE_PATH="${APP_BUNDLE_PATH_VAR}" bundle exec cucumber -p de_mt_ios_jenkins features/  --tag $tagged_test
