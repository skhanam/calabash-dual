
Install Appcelerator
===============

> Open - http://developer.appcelerator.com and log on to
> appcelerator.com On top right corner find download appcelerator studio
> link, download appcelerator studio and Complete installation

Check out code
===============

> Phone: Download application source code from stash -
> https://stash.akqa.net/scm/lontui/tda.git Tablet: Download application
> source code from stash -
> https://@stash.akqa.net/scm/lontui/tda.tablet.git Download calabash
> test source code from stash -
> https://stash.akqa.net/scm/lontui/tda.ui-automation.git (tablet branch

Changing locale:
===============
locale is changed using external library - https://code.google.com/p/ios-sim-locale/wiki/Usage
add ios-sim-locale to /usr/bin or add the path of ios-sim-locale to $PATH variable
list of languages supported - https://gist.github.com/jacobbubu/1836273#file-ioslocaleidentifiers-csv

Folder structure
===============
```` 
Gemfile   - gems required for running calabash test suite
README.md - Help file
run_ios.sh - Shell script required to run IOS tests

ios-report.html - IOS test report
android-report.html - android test report
app.apk - application file for android
features - tests

features/android - android specific test code
features/common	 - common testcode for IOS and android
features/ios	 - IOS specific test code
features/tests	 - feature files
features/z_dump	 - extra folder for dumping useful stuff and test data
````

####Test data

````
Test data is stored in file users.rb
to use simple input data use users.rb

````

Folder structure

```` 
---TDA (base folder for project)
 ------- TDA.ui.automation  (Automation source code)
 ------- Application_source_code  (Application source code)
````


Environment variables which can be configured
===============

```` 
ENV['LOG_VERIFIED_TXT']=="yes" # for writing verified text onto a file
ENV['TAKE_SS']=="yes" # for taking screenshots
ENV['ENDPOINT']=="dev" or "preprod"  # for testing dev or pre prod environments
ENV['HW']=="tablet" or "phone"  # select tablet or phone
ENV['OS']=="ios" or "android"
```` 

Taking screenshot to compare(for raf)
===============

    calabash-ios sim locale en
    TAKE_SS="yes" sh run_ios.sh NA @ss sv ../meine.tui
    calabash-ios sim locale da
    TAKE_SS="yes" sh run_ios.sh NA @ss da ../meine.tui
    calabash-ios sim locale nb
    TAKE_SS="yes" sh run_ios.sh NA @ss nb ../meine.tui
    calabash-ios sim locale fi
    TAKE_SS="yes" sh run_ios.sh NA @ss fi ../meine.tui

Execute tests
===============

####Clean and run project (run below command from folder where Automation code is present)
	 sh run_ios.sh clean @basic-sanity sv ../meine.tui
	 sh run_android.sh clean @basic-sanity sv ../meine.tui

####Clean and run regression project
	 sh run_ios.sh clean @basic-sanity de ../tda.tablet
	 sh run_android.sh clean @basic-sanity de ../tda.tablet


####Run tests without cleaning
	 sh runmeinetui.sh NA @sanity
	 sh run_android.sh NA @sanity

Getting Started
===============
#Install RUBY
* use ruby version >= 2.0.0
* Install source tree & clone 2 projects
* 1) application source code  - https://tejasvi.manmatha@stash.akqa.net/scm/LONTUI/meine.tui.git
* 2) Automation tests   - https://tejasvi.manmatha@stash.akqa.net/scm/LONTUI/meine.tui.ui-automation.git

#To install gems needed for this project
Gems needed for this project are present in Gemfile (located under meine.tui.ui-automation folder)

if bundler  is not installed install it

	gem install bundler
Run below command to install all gems needed

    bundle install

# Download and Build: Android

#Android

### Download and Install Android SDK
#####Set environment variables
	export PATH=/Users/<username>/Documents/adt-bundle-mac/sdk/tools:$PATH
	export PATH=/Users/<username>/Documents/adt-bundle-mac/sdk/platform-tools:$PATH
	export ANDROID_HOME=/Users/<username>/Documents/adt-bundle-mac/sdk
	export JAVA_HOME=/System/Library/Frameworks/JavaVM.framework/Versions/CurrentJDK/Home

ensure Android API 18 installed.:

	$ANDROID_HOME/tools/android #now install android-18

###Titanium commands for android:

* Create a folder for below that create two folders meine.tui & meine.tui.ui-automation
* Download meinetui code into meine.tui folder and automation code into meine.tui.ui-automation
* Open tiapp.xml (meine.tui/tiapp.xml) and add below line (if there is similar line replace it)


	<uses-sdk android:minSdkVersion="10" android:targetSdkVersion="14"/>

(run below commands from meine.tui folder)

	ti clean 						#clean titanium code meine.tui/build/iphone & meine.tui/build/android fodlers are cleaned
	node build.js firstchoice  		#Specify which app to build thomson or firstchoice
	ti build --platform android -b  #Build for android, -b option is to build without installing onto device

(switch to automation folder)

	cd /Users/<username>/projects/meine.tui.ui-automation
	cp /Users/<username>/projects/meine.tui/build/android/bin/app.apk . #copy apk into automation folder
	calabash-android resign app.apk  									#Resign android apk file
	calabash-android  run app.apk -p de_mt_android -v					#Run apk file using de_mt_android profile

    when tests are running (output looks like this)
    No test server found for this combination of app and calabash version. Recreating test server.
    Done signing the test server. Moved it to test_servers/80b8b6c0a44b6e16d2bd7f4aeba0d2ac_0.4.4.apk
    Using the android profile...
    Feature: Login
    ...

#IOS

##Download and Build: iOS
    calabash-ios setup (set up calabash framework to existing project)
##Meine tui commands
###Build
#### building for meine tui using UK 4.0 code
    meine.tui.ui-automation - Automation folder
    meine.tui - project folder

	cd /Users/tejasvi.manmatha/projects/meine.tui.ui-automation
	cd ../meine.tui
	node build.js meinetui
	killall Xcode
	ti clean
	ti build --platform ios  --target-deploy development --tall -b



#### building for meine tui using DE 3.1 code
	cd /Users/tejasvi.manmatha/projects/meine.tui.ui-automation
	cd ../meine.tui
	killall Xcode
	ti clean
	open -a Xcode
	ti build --platform ios  --target-deploy development   &
	sleep 200



### Run tests
	cd build/iphone
	open meine\ TUI.xcodeproj/ &
	sleep 10
	calabash-ios setup
	cd ../meine.tui.ui-automation
	sh buildmeinetui.sh
	sh runmeinetui.sh

-------------------------------------------------------------------------------
#Running tests on devices

DEVICE=device DEBUG=1 DEVICE_ENDPOINT=http://192.168.2.12:37265 BUNDLE_ID=de.tui.meinetui.dev.tablet DEVICE_TARGET=757d34b46f85cee1c2388d31f88dc04eb9a21e74 HW=tablet TESTENV=DE_MT SCREENSHOT_PATH=features/report/iosde LANG=de  bundle exec cucumber -p de_mt_ios features/ --tag @1prelogin

TI_SCHEME=meinetui
cd ../tda.tablet
ti clean
rm -rf build/ Resources
node releaseScripts/build.js --brand $TI_SCHEME
node releaseScripts/build.js --brand $TI_SCHEME -l
ti build -p ios --target device -b # select provisioning profile
calabash-ios setup build/iphone # select build
open xcode project build
select -cal target and change device orientation to ipad
build it on to device using xcode

-------------------------------------------------------------------------------


#how to share calabash commands between IOS and Android
===============
This example suits well for calabash x platform example (where code is shared between IOS and android)
set OS=ios in command line from where your cucumber tests are run (ex: OS=android calabash-android run <apkfile> )
value of @g_query_txt  is set based on env variable

	@g_query_txt="view " if ENV['OS']=="ios"
	@g_query_txt="* " if ENV['OS']=="android"

  Add the below method wait_for_similar_text_to_appear in a class that is accessible to both IOS and android code
or
  Create a common module (between ios & android) and then include that into ios or android classes

arguments:
  text: this can part of the text which we want to match
  time_out: is optional argument, default timeout value is 5 seconds

### Specify text to check and time to wait for
### This will return true even if text matches part of the sentence
	@g_query_txt="view " if ENV['OS']=="ios"
	@g_query_txt="* " if ENV['OS']=="android"

	def wait_for_similar_text_to_appear(text, time_out=5)
	  query_text=@g_query_txt+"{text LIKE '*#{text}'}"
	  begin
		wait_poll({:until_exists => query_text, :timeout => time_out.to_i}) do
		  puts text
		end
	  rescue
		fail("Failed to find text"+text)
	  end
	end



####Adding Accessibility labels
       if (Alloy.CFG.calabash) {
        if (OS_IOS) {
            $.message.accessibilityLabel=strMessage;
        	}
    	}

-------------------------------------------------------------------------------