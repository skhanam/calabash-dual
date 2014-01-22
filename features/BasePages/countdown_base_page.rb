#require 'calabash-android/abase'
require_relative 'base_page_ios' if ENV['PLATFORM'] == 'ios'
require_relative 'base_page_android' if ENV['PLATFORM'] == 'android'

class CountDownBasePage < BasePage

  def initialize
  end

  def check_countdown_screen
    wait_for_text_to_appear_view(@@countdown_page_title, 5)
  end

  def check_count_down_page
    check_countdown_screen
    sleep 1
    check_text_must_be_in_view(@@countdown_share_button_text)
    check_text_must_be_in_view(@@countdown_days_text)
    check_text_must_be_in_view(@@countdown_hours_text)
    check_text_must_be_in_view(@@countdown_minutes_text)
    check_text_must_be_in_view(@@countdown_seconds_text)

    @@countdown_message_from_screen=get_acc_label_text("slogan_text")
    if @@countdown_message_from_screen.match(/#{@@countdown_countdown_message}/)==nil
      fail ("text #{@@countdown_message_from_screen} not found")
    end
  end
end
