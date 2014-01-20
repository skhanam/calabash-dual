DATE=`date +%d-%m-%Y-%H-%M`

SCHEME_XC="meine TUI-cal"
BUILD_CONFIG="Debug"
PROJECT_PATH="features"
ARCHITECTURE_SELECTED=i386
APPNAME="meine TUI"

cd ~/projects/meine.tui/build/iphone
BUILT_PRODUCTS_DIR=$(xcodebuild ARCHS="${ARCHITECTURE_SELECTED}" ONLY_ACTIVE_ARCH=NO -sdk iphonesimulator  -configuration "${BUILD_CONFIG}" -showBuildSettings | grep -m 1 "BUILT_PRODUCTS_DIR" | grep -oEi "\/.*" | xargs -L1 dirname)

cd /Users/tejasvi.manmatha/projects/meine.tui.ui-automation

APP_BUNDLE_PATH_VAR="${BUILT_PRODUCTS_DIR}"/"${BUILD_CONFIG}"-iphonesimulator/"${APPNAME}".app
echo $APP_BUNDLE_PATH_VAR

cd /Users/tejasvi.manmatha/projects/meine.tui.ui-automation
sleep 1

#APP_BUNDLE_PATH_VAR="/Users/tejasvi.manmatha/Library/Developer/Xcode/DerivedData/meine_TUI-duqvirclbmdgamcsaqhrnzynqpmz/Build/Products/Debug-iphonesimulator/meine TUI.app"
echo TESTENV="DE_MT" SDK_VERSION=6.0 BUNDLE_ID=$BUNDLE DEVICE=iphone APP_BUNDLE_PATH="${APP_BUNDLE_PATH_VAR}" cucumber -p -f html -o report.html de_mt_ios features/ -v
 DEVICE_TARGET=simulator TESTENV=DE_MT TESTENV="DE_MT" BUNDLE_ID=$BUNDLE DEVICE=iphone APP_BUNDLE_PATH="${APP_BUNDLE_PATH_VAR}" cucumber -p de_mt_ios -f html -o report.html features/ -v
