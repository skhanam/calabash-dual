#!/bin/env ruby
# encoding: utf-8
require_relative 'page_world'
require_relative 'application_strings'


require File.join(File.dirname(__FILE__), 'page_world')

if ENV['PLATFORM'] == 'ios'
  require 'calabash-cucumber/cucumber'
  require_relative '../../ios/base_page_ios'
elsif ENV['PLATFORM'] == 'android'
  require 'calabash-android/cucumber'
  require_relative '../../android/base_page_android'
end

require_relative 'data_models'

$g_messages_file="features/z_dump/welcome_messages#{Time.now.strftime("%Y-%m-%d_%H_%M")}.txt"
#puts "\n before all scenarios &&&&&&&&&&& messages are in file #{$g_messages_file}  &&&&&&&&&&&&& \n"

$g_user_details = User.new #Create default user
#puts "#{$g_user_details}"

World(TestModule)
World(AppStrings)
BasePage.new.set_strings
#World(PageWorld)

