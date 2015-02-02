#!/bin/env ruby
# encoding: utf-8

STEP_PAUSE||=0.5
$g_os=ENV['PLATFORM']
$g_hw=ENV['HW']

$first_run=0
$g_ios=false
$g_android=false

puts "$g_hw #{$g_hw} $g_os #{$g_os}"

if $g_hw=="phone"
  $g_phone=true
  $g_hw_module="Phone"
elsif $g_hw=="tablet"
  $g_tablet=true
  $g_hw_module="Tablet"
end

$g_lang=ENV['LANG']

require_relative 'page_world'
require_relative '../strings/application_strings'
require 'xmlsimple'
require 'unicode_utils'
require_relative '../support/users'
require 'require_all'
require File.join(File.dirname(__FILE__), 'page_world')


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

$g_lang_strings_file="features/test_data/de/strings.xml" if $g_lang=='de'
 if ($g_lang=='en_th' || $g_lang=='en_fc')
   $g_lang_strings_file="features/test_data/en_th/strings.xml" if $g_lang=='en_th'
   $g_lang_strings_file="features/test_data/en_fc/strings.xml" if $g_lang=='en_fc'
   $g_lang="uk"
   $g_lang_mod="Eng"
 end
$g_lang_strings_file="features/test_data/sv/strings.xml" if $g_lang=='sv'
$g_lang_strings_file="features/test_data/da/strings.xml" if $g_lang=='da'
$g_lang_strings_file="features/test_data/fi/strings.xml" if $g_lang=='fi'
$g_lang_strings_file="features/test_data/nb/strings.xml" if $g_lang=='nb'


if (ENV['TESTENV']=='DE_MT')
  $g_current_user_details=DE_USER
  $g_lang_mod="Deu"
elsif (ENV['TESTENV']=='EN_TH')
  $g_current_user_details=THOMSON_USER
  $g_lang_mod="Eng"
elsif (ENV['TESTENV']=='EN_FC')
  $g_current_user_details=FIRSTCHOICE_USER
  $g_lang_mod="Eng"
elsif (ENV['TESTENV']=='NOR')
  $g_current_user_details=NOR_USER
  $g_lang_mod="Nor"
end

require_relative '../../BasePages/base_page'

$g_verified_strings="features/z_dump/verified_strings.txt"
$g_messages_file="features/z_dump/welcome_messages#{Time.now.strftime("%Y-%m-%d_%H_%M")}.txt"

$g_user_details=$g_current_user_details[:valid]
$g_valid_user_details=$g_current_user_details[:valid]
$g_invalid_user_details=$g_current_user_details[:invalid]

World(TestModule)
World(AppStrings)
BasePage.new.set_strings

