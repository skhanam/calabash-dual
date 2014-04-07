#!/bin/env ruby
# encoding: utf-8
require_relative 'page_world'
require_relative '../strings/application_strings'
require 'xmlsimple'
require 'unicode_utils'
require_relative '../support/users'

require File.join(File.dirname(__FILE__), 'page_world')

if ENV['PLATFORM'] == 'ios'
  require 'calabash-cucumber/cucumber'
  require_relative '../../ios/base_page_ios'
elsif ENV['PLATFORM'] == 'android'
  require 'calabash-android/cucumber'
  require_relative '../../android/base_page_android'
end

$g_lang_strings_file="features/test_data/de/strings.xml" if ($g_current_app=='DE_MT')
$g_lang_strings_file="features/test_data/en/strings.xml" if ($g_current_app== 'EN_TH')
$g_lang_strings_file="features/test_data/sv/strings.xml" if ($g_current_app== 'NOR_SW')

$g_messages_file="features/z_dump/welcome_messages#{Time.now.strftime("%Y-%m-%d_%H_%M")}.txt"
#puts "\n before all scenarios &&&&&&&&&&& messages are in file #{$g_messages_file}  &&&&&&&&&&&&& \n"

$g_user_details=USERS[:valid]
$g_valid_user_details=USERS[:valid]
$g_invalid_user_details=USERS[:invalid]
#$g_user_details = User.new #Create default user
#puts "#{$g_user_details}"

World(TestModule)
World(AppStrings)
BasePage.new.set_strings
#World(PageWorld)

