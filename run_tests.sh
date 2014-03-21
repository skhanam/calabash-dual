#!/bin/sh

if [ "$#" != "3" ]; then
echo "\n\n\n2 ARGUMENTS NEEDED"
echo "1) platform"
echo "2) clean project ex: clean"
echo "3) tags ex: @sanity"
echo "\nsample command: sh run_tests.sh ios clean @sanity\n"
echo "\nsample command: sh run_tests.sh ios NA @sanity\n"
exit
fi


if [ -z "$2" ] ; then
echo "Tags not specified using @failed"
tagged_test=@failed
else
tagged_test=$2
fi

export PATH=/usr/local/bin:$PATH

echo "SETTING PROJECT TO MEINE TUI"
#cd ../meine.tui
#node build.js meinetui --syncLang -b

echo "CLEANING AND BUILDING PROJECT"
cd ../meine.tui.ui-automation/
#bundle install
rm -f *.png
rm -f *.html

#source /Users/qaautomation/.bashrc
#source /Users/qaautomation/.rvm/scripts/rvm
#echo "source completed"
bash -c "source ~/.rvm/scripts/rvm && rvm_install_on_use_flag=1 && rvm use --create 2.0.0-p353@global && export > rvm.env"
bundle install
#/Users/qaautomation/.rvm/gems/ruby-2.0.0-p353/bin/calabash-ios sim reset

if [ "$1" == "ios" ] ; then
echo sh runmeinetui.sh $2 $3
sh runmeinetui.sh $2 $3
else
sh runandroid.sh $2 $3
fi

