#!/bin/sh
if [ "$1" == "clean" ] ; then
echo "\n\n\nCleaning and building application for android tests...\n\n\n"
ti clean --project-dir ../meine.tui
ti build --platform android -b --project-dir ../meine.tui
cp ../meine.tui/build/android/bin/app-unsigned.apk app.apk
calabash-android resign app.apk
fi
calabash-android  run app.apk -p de_mt_android_jenkins
