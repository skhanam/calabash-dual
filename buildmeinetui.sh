DATE=`date +%d-%m-%Y-%H-%M`

SCHEME_XC="meine TUI-cal"
BUILD_CONFIG="Debug"
PROJECT_PATH="features"
ARCHITECTURE_SELECTED=i386
APPNAME="meine TUI"

cd /Users/tejasvi.manmatha/projects/meine.tui/build/iphone 
sleep 3
if [ "$1" == "clean" ] ; then
echo "clean build"
xcodebuild  -scheme "${SCHEME_XC}" -configuration Debug ONLY_ACTIVE_ARCH=NO -sdk iphonesimulator clean build
else
echo "build without cleaning"
xcodebuild  -scheme "${SCHEME_XC}" -configuration Debug ONLY_ACTIVE_ARCH=NO -sdk iphonesimulator build
fi


