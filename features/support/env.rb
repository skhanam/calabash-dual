require File.join(File.dirname(__FILE__), 'page_world')

if ENV['PLATFORM'] == 'ios'
  require 'calabash-cucumber/cucumber'
elsif ENV['PLATFORM'] == 'android'
  require 'calabash-android/cucumber'
end

$g_messages_file="features/z_dump/welcome_messages#{Time.now.strftime("%Y-%m-%d_%H_%M")}.txt"
puts "\n before all scenarios &&&&&&&&&&& messages are in file #{$g_messages_file}  &&&&&&&&&&&&& \n"
#World(PageWorld)

