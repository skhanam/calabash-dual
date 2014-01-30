DATE=`date +%d-%m-%Y-%H-%M`

SCHEME_XC="meine TUI-cal"
BUILD_CONFIG="Debug"
PROJECT_PATH="features"
ARCHITECTURE_SELECTED="i386"
APPNAME="meine TUI"

str1="xcodebuild SRCROOT='/Users/tejasvi.manmatha/projects/meine.tui/build/iphone' ARCHS='#{ARCHITECTURE_SELECTED}' ONLY_ACTIVE_ARCH=NO -sdk iphonesimulator  -configuration '#{BUILD_CONFIG}' -showBuildSettings"
res=`#{str1}`
BUILT_PRODUCTS_DIR=res.match(/BUILT_PRODUCTS_DIR\s.\s(.*)/)[1]
APP_BUNDLE_PATH_VAR="#{BUILT_PRODUCTS_DIR}/#{APPNAME}"+".app"
puts APP_BUNDLE_PATH_VAR
