DATE=`date +%d-%m-%Y-%H-%M`

CHEME_XC="MyFirstChoice-cal"
APPNAME="MyFirstChoice"
BUILD_CONFIG="Debug"
PROJECT_PATH="features"
PROJ="MyFirstChoice.xcodeproj"
ARCHITECTURE_SELECTED=i386
BUNDLE=uk.tui.firstchoice

cd ../meine.tui/build/iphone/
BUILT_PRODUCTS_DIR=$(xcodebuild ARCHS="${ARCHITECTURE_SELECTED}" ONLY_ACTIVE_ARCH=NO -sdk iphonesimulator  -configuration "${BUILD_CONFIG}" -showBuildSettings | grep -m 1 "BUILT_PRODUCTS_DIR" | grep -oEi "\/.*" | xargs -L1 dirname)


echo $BUILT_PRODUCTS_DIR
APP_BUNDLE_PATH_VAR="${BUILT_PRODUCTS_DIR}"/"${BUILD_CONFIG}"-iphonesimulator/"${APPNAME}".app

cd ../../../meine.tui.ui-automation
sleep 1
#NO_LAUNCH=0 DEVICE_TARGET=simulator SDK_VERSION=6.0 BUNDLE_ID=$BUNDLE DEVICE=iphone OS=ios6  APP_BUNDLE_PATH="${APP_BUNDLE_PATH_VAR}" cucumber -p ios features/ -v
RESET_BETWEEN_SCENARIOS=1 SDK_VERSION=6.0 BUNDLE_ID=$BUNDLE DEVICE=iphone APP_BUNDLE_PATH="${APP_BUNDLE_PATH_VAR}" cucumber -p ios features/ -v

