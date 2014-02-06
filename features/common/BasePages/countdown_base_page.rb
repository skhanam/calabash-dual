#require_relative 'base_page_ios' if ENV['PLATFORM'] == 'ios'
#require_relative 'base_page_android' if ENV['PLATFORM'] == 'android'

class CountDownBasePage < BasePage

  #def initialize
  #end

  def check_countdown_screen
    assert_wait_for_text(@@countdown_page_title)
  end

  def check_count_down_page
    check_countdown_screen
    sleep 1
    assert_text_elements([@@countdown_share_button_text, @@countdown_days_text, @@countdown_hours_text,
                          @@countdown_minutes_text, @@countdown_seconds_text])
    #assert_text_present(@@countdown_share_button_text)
    #assert_text_present(@@countdown_days_text)
    #assert_text_present(@@countdown_hours_text)
    #assert_text_present(@@countdown_minutes_text)
    #assert_text_present(@@countdown_seconds_text)

    @@countdown_message_from_screen=get_acc_label_text("slogan_text")
    if @@countdown_message_from_screen.match(/#{@@countdown_countdown_message1}/)==nil &&
        @@countdown_message_from_screen.match(/#{@@countdown_countdown_message2}/)==nil
      fail ("expected:#{@@countdown_countdown_message}: actual text:#{@@countdown_message_from_screen}")
    end
  end
end
