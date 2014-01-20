require File.join(File.dirname(__FILE__), 'page_world')

if ENV['PLATFORM'] == 'ios'
  require 'calabash-cucumber/cucumber'
elsif ENV['PLATFORM'] == 'android'
  require 'calabash-android/cucumber'
end

require_relative '../support/data_models'

$g_messages_file="features/z_dump/welcome_messages#{Time.now.strftime("%Y-%m-%d_%H_%M")}.txt"
puts "\n before all scenarios &&&&&&&&&&& messages are in file #{$g_messages_file}  &&&&&&&&&&&&& \n"

$g_user_details = User.new #Create default user
puts "#{$g_user_details}"

#World(PageWorld)

