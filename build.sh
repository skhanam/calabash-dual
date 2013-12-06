DATE=`date +%d-%m-%Y-%H-%M`

SCHEME_XC="Firstchoice-cal"
APPNAME="FirstChoice"
BUILD_CONFIG="Debug"
PROJECT_PATH="features"
PROJ="Firstchoice.xcodeproj"
ARCHITECTURE_SELECTED=i386
BUNDLE=uk.tui.firstchoice

cd /Users/tejasvi.manmatha/projects/meine.tui/build/iphone 

#sleep 2
#ti clean ; ti build --platform ios  --target-deploy development
#sleep 2

#calabash-ios setup

BUILT_PRODUCTS_DIR=$(xcodebuild ARCHS="${ARCHITECTURE_SELECTED}" ONLY_ACTIVE_ARCH=NO -sdk iphonesimulator  -configuration "${BUILD_CONFIG}" -showBuildSettings | grep -m 1 "BUILT_PRODUCTS_DIR" | grep -oEi "\/.*" | xargs -L1 dirname)


echo $BUILT_PRODUCTS_DIR
sleep 3
if [ "$1" == "clean" ] ; then
echo "clean build"
xcodebuild  -scheme Firstchoice-cal -configuration Debug ONLY_ACTIVE_ARCH=NO -sdk iphonesimulator clean build
else
echo "build without cleaning"
xcodebuild  -scheme Firstchoice-cal -configuration Debug ONLY_ACTIVE_ARCH=NO -sdk iphonesimulator build
fi
