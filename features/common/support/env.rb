#!/bin/env ruby
# encoding: utf-8
require_relative 'page_world'
require_relative '../strings/application_strings'
require 'xmlsimple'
require 'unicode_utils'
require_relative '../support/users'

require File.join(File.dirname(__FILE__), 'page_world')

`defaults write com.apple.iphonesimulator "SimulateDevice" '"iPhone (Retina)"'`

if ENV['PLATFORM'] == 'ios'
  require 'calabash-cucumber/cucumber'
  require_relative '../../ios/base_page_ios'
elsif ENV['PLATFORM'] == 'android'
  require 'calabash-android/cucumber'
  require_relative '../../android/base_page_android'
end

$g_locale="./config/locale.yml"
$g_lang_strings_file="features/test_data/de/strings.xml" if ENV['LANG']=='de'
$g_lang_strings_file="features/test_data/en/strings.xml" if (ENV['LANG']=='en_th' || ENV['LANG']=='en_fc')
$g_lang_strings_file="features/test_data/sv/strings.xml" if ENV['LANG']=='sv'
$g_lang_strings_file="features/test_data/da/strings.xml" if ENV['LANG']=='da'
$g_lang_strings_file="features/test_data/fi/strings.xml" if ENV['LANG']=='fi'
$g_lang_strings_file="features/test_data/nb/strings.xml" if ENV['LANG']=='nb'

if (ENV['TESTENV']=='DE_MT')
  $g_current_user_details=DE_USER
elsif (ENV['TESTENV']=='EN_TH')
  $g_current_user_details=THOMSON_USER
elsif (ENV['TESTENV']=='EN_FC')
  $g_current_user_details=FIRSTCHOICE_USER
elsif (ENV['TESTENV']=='NOR')
  $g_current_user_details=NOR_USER
end

$g_messages_file="features/z_dump/welcome_messages#{Time.now.strftime("%Y-%m-%d_%H_%M")}.txt"
#puts "\n before all scenarios &&&&&&&&&&& messages are in file #{$g_messages_file}  &&&&&&&&&&&&& \n"

$g_user_details=$g_current_user_details[:valid]
$g_valid_user_details=$g_current_user_details[:valid]
$g_invalid_user_details=$g_current_user_details[:invalid]

World(TestModule)
World(AppStrings)
BasePage.new.set_strings

