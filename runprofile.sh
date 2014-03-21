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
/bin/bash --login

source /Users/qaautomation/.bashrc
source /Users/qaautomation/.rvm/scripts/rvm
echo "source completed"
bash -c "source ~/.rvm/scripts/rvm && rvm_install_on_use_flag=1 && rvm use --create 1.9.3@projectname && export > rvm.env"
source rvm.env
type rvm | head -n 1
rvm use ruby-2.0.0-p353@global
/Users/qaautomation/.rvm/gems/ruby-2.0.0-p353/bin/calabash-ios sim reset
