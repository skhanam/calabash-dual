# encoding: utf-8
require 'calabash-android/abase'
require_relative '../common/support/reusable_methods'
require_relative '../common/strings/application_strings'
require_relative 'support/reusable_methods_android'
require_relative '../common/support/Z_view_functions'
require 'differ'

$g_strings_set=false
class BasePage < Calabash::ABase
  include AppStrings
  include AndroidReusableMethods
  include ViewModule
  include ReusableMethods

  def initialize

  end
  def write_hash_to_file(count)
    @@result_hash.each do |key, var|
      write_welcome_messages_to_file("#{key}:   is shown #{var}/#{count} times")
    end
  end


  def close_whats_new_dialog
    if element_exists("#{$g_query_txt}text:'#{@@app_update_popup_title}'")
      arr=@@app_update_popup_body.split(/\n/)
      arr.each do |var1|
        res=var1.match(/(\w+)/)
        assert_partial_text(res[0])
      end
      click_on_text @@ok
    end
  end

  def close_push_notifications
    if element_exists("#{$g_query_txt}text:'#{@@push_notifications}'")
      assert_wait_for_text @@we_would_like_to_send_push
      assert_wait_for_text @@push_not_now
      touch ("#{$g_query_txt}text:'#{@@push_not_now}'")
      sleep 2
    end
  end

end
