#!/usr/bin/expect

spawn ti clean --project-dir ../../../meine.tui
spawn node ../../../meine.tui/build.js meinetui
spawn ti build --platform ios --project-dir ../../../meine.tui --target-deploy development
set timeout 60
expect "Alloy compiler completed successfully"
expect "Focusing the iOS Simulator"
expect "Application booted in"
spawn sleep 5
send \004
spawn killall Xcode
spawn sleep 5
set timeout 20
spawn calabash-ios setup ../../../meine.tui/build/iphone/
expect "Please answer yes (y) or no (n)"  { send "n\r" }
expect "Default target: meine TUI"  {  send "\r" }
expect "Setup done"

