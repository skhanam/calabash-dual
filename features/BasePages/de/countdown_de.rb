require_relative '../Default/contact_us_base_page'

## verify contact us page
class CountDownDE < CountDownBasePage

  def check_count_down_page
    check_countdown_screen_title
    check_countdown_message
    sleep 1
    assert_text_elements([@@countdown_days_text, @@countdown_hours_text,
                          @@countdown_minutes_text, @@countdown_seconds_text])
    assert_text_present @@countdown_share_button_text
    if @@countdown_message_from_screen.match(/#{@@countdown_countdown_message1}/)==nil &&
        @@countdown_message_from_screen.match(/#{@@countdown_countdown_message2}/)==nil
      fail ("expected:#{@@countdown_countdown_message}: actual text:#{@@countdown_message_from_screen}")
    end
  end

  def check_countdown_message
    sleep 2
    @@countdown_message_from_screen=get_acc_label_text("slogan_text")
    res=@@countdown_message_from_screen.match(@@countdown_countdown_message2)
    fail("countdown message is wrong #{@@countdown_message_from_screen}  #{@@countdown_countdown_message2} ") if res==nil
  end

end



