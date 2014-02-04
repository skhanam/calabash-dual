#!/usr/bin/expect
set arg1 [lindex $argv 0]
 
set timeout 10
spawn ti clean --project-dir $arg1
expect "Project cleaned successfully"

spawn ti build --platform ios --project-dir ../$arg1 --target-deploy development
set timeout 60
expect "Alloy compiler completed successfully"
expect "Focusing the iOS Simulator"
expect "Application booted in"
spawn sleep 5
send \004
spawn killall Xcode
spawn sleep 5
set timeout 20
spawn calabash-ios setup ../$arg1/build/iphone/
expect "Please answer yes (y) or no (n)"  { send "n\r" }
expect "Default target: meine TUI"  {  send "\r" }
expect "Setup done"

