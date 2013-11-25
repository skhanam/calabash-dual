require File.join(File.dirname(__FILE__), 'page_world')

if ENV['PLATFORM'] == 'ios'
  require 'calabash-cucumber/cucumber'
elsif ENV['PLATFORM'] == 'android'
  require 'calabash-android/cucumber'
end

#World(PageWorld)

