class CountDownBasePage < BasePage

  #def initialize
  #end

  def check_countdown_screen_title
    verify_page_title(@@countdown_page_title)
  end

  def check_count_down_page
    check_countdown_screen_title
    check_countdown_message
    sleep 1
    assert_text_elements([@@countdown_share_button_text, @@countdown_days_text, @@countdown_hours_text,
                          @@countdown_minutes_text, @@countdown_seconds_text])
    if @@countdown_message_from_screen.match(/#{@@countdown_countdown_message1}/)==nil &&
        @@countdown_message_from_screen.match(/#{@@countdown_countdown_message2}/)==nil
      fail ("expected:#{@@countdown_countdown_message}: actual text:#{@@countdown_message_from_screen}")
    end
  end

  def check_days_left_to_travel
    res1=CommonMethods.new.get_countdown_days.to_s.to_i
    res2=get_acc_label_text("days_to_go").to_i
    puts "#{res1} != #{res2}"
    fail("Number of days are wrong") if (res1 != res2)
  end

  def check_countdown_message
    sleep 2
    @@countdown_message_from_screen=get_acc_label_text("slogan_text")
    res=@@countdown_message_from_screen.match(@@countdown_countdown_message2)
    fail("countdown message is wrong") if res==nil
  end

end
