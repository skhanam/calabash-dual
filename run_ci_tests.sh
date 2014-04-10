#!/bin/sh

clear
if [ "$#" -le "4" ]; then
	echo "\n4 ARGUMENTS NEEDED"
	echo "1) ios or android - select platform"
	echo "2) clean(clean project) or NA (for running project without cleaning"
	echo "3) Tags selected for test run ex: @sanity or @reg"
    echo "4) App to test ex: thomson / firstchoice / meinetui /nordics"
    echo "5) relative folder path where source code is located"

	echo "\nsample command"
	echo " 1) run_ci_tests.sh ios clean @sanity meinetui ../meine.tui"
	echo " 2) run_ci_tests.sh android clean @sanity meinetui ../meine.tui"
	echo "\n"
	exit
fi

export PATH=/usr/local/bin:$PATH

echo "Removing old reports and jpeg files"
rm -f *.png
rm -f *.html

echo "source completed"

bash -c "source ~/.rvm/scripts/rvm && rvm_install_on_use_flag=1 && rvm use --create 2.0.0-p353@global && export > rvm.env"
source rvm.env
gem install bundler
gem list
ls
bundle install
#/Users/qaautomation/.rvm/gems/ruby-2.0.0-p353/bin/
calabash-ios sim reset

if [ "$1" == "ios" ] ; then
echo sh runmeinetui.sh $2 $3 $4 $5
sh runmeinetui.sh $2 $3 $4 $5
else
echo sh runandroid.sh $2 $3 $4 $5
sh runandroid.sh $2 $3 $4 $5
fi

