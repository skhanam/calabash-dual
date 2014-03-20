#!/bin/sh

export PATH=/usr/local/bin:$PATH

echo "SETTING PROJECT TO MEINE TUI"
cd ../meine.tui
node build.js meinetui --syncLang -b

echo "CLEANING AND BUILDING PROJECT"
cd ../meine.tui.ui-automation/
#bundle install
rm -f *.png
rm -f *.html
calabash-ios sim reset
sh runmeinetui.sh clean @login1
