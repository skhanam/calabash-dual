killall Xcode
cd /Users/tejasvi.manmatha/projects/meine.tui.ui-automation
cd ../meine.tui
ti clean 
 ti build --platform ios  --target-deploy development --tall -b

cd build/iphone
open MyFirstChoice.xcodeproj &
sleep 5
calabash-ios setup



cd /Users/tejasvi.manmatha/projects/meine.tui.ui-automation
sh build.sh clean
sleep 2
sh run.sh
