#!/bin/sh

export PATH=/usr/local/bin:$PATH

echo "SETTING PROJECT TO MEINE TUI"
#cd ../meine.tui
#node build.js meinetui --syncLang -b

echo "CLEANING AND BUILDING PROJECT"
cd ../meine.tui.ui-automation/
#bundle install
rm -f *.png
rm -f *.html
source /Users/qaautomation/.rvm/scripts/rvm
type rvm | head -n 1
rvm use ruby-2.0.0-p353@global
#calabash-ios sim reset
#sh runmeinetui.sh clean @login1
