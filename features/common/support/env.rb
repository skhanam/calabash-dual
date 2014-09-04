#!/bin/env ruby
# encoding: utf-8
require_relative 'page_world'
require_relative '../strings/application_strings'
require 'xmlsimple'
require 'unicode_utils'
require_relative '../support/users'
require 'require_all'
require File.join(File.dirname(__FILE__), 'page_world')

$g_os=ENV['PLATFORM']
$g_hw=ENV['HW']

$g_ios=false
$g_android=false

puts "$g_hw #{$g_hw} $g_os #{$g_os}"

if $g_hw=="phone"
  $g_phone=true
  $g_module="Phone"
elsif $g_hw=="tablet"
  $g_tablet=true
  $g_module="Tablet"
end

  if ENV['PLATFORM'] == 'ios'
  $g_ios=true
  $g_platform="Ios"
  require 'calabash-cucumber/cucumber'
elsif ENV['PLATFORM'] == 'android'
  $g_android=true
  $g_platform="Android"
  require 'calabash-android/cucumber'
end


$g_locale="./config/locale.yml"

$g_lang=ENV['LANG']
$g_lang_strings_file="features/test_data/de/strings.xml" if ENV['LANG']=='de'
 if (ENV['LANG']=='en_th' || ENV['LANG']=='en_fc')
   $g_lang_strings_file="features/test_data/en/strings.xml"
   $g_lang="uk"
 end
$g_lang_strings_file="features/test_data/sv/strings.xml" if ENV['LANG']=='sv'
$g_lang_strings_file="features/test_data/da/strings.xml" if ENV['LANG']=='da'
$g_lang_strings_file="features/test_data/fi/strings.xml" if ENV['LANG']=='fi'
$g_lang_strings_file="features/test_data/nb/strings.xml" if ENV['LANG']=='nb'

require_relative '../../BasePages/base_page'


if (ENV['TESTENV']=='DE_MT')
  $g_current_user_details=DE_USER
elsif (ENV['TESTENV']=='EN_TH')
  $g_current_user_details=THOMSON_USER
elsif (ENV['TESTENV']=='EN_FC')
  $g_current_user_details=FIRSTCHOICE_USER
elsif (ENV['TESTENV']=='NOR')
  $g_current_user_details=NOR_USER
end

$g_verified_strings="features/z_dump/verified_strings.txt"
$g_messages_file="features/z_dump/welcome_messages#{Time.now.strftime("%Y-%m-%d_%H_%M")}.txt"

$g_user_details=$g_current_user_details[:valid]
$g_valid_user_details=$g_current_user_details[:valid]
$g_invalid_user_details=$g_current_user_details[:invalid]

World(TestModule)
World(AppStrings)
BasePage.new.set_strings

