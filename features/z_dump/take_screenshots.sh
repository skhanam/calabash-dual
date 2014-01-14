N=10
for VARIABLE in 1 2 3 4 5 .. N
do
adb shell screencap -p /sdcard/screen$VARIABLE.png
sleep 0.1
done

N=10
for VARIABLE in 1 2 3 4 5 .. N
do
adb pull /sdcard/screen$VARIABLE.png
sleep 0.1
done
~     
