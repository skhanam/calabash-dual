require_relative '../../../common/BasePages/countdown_base_page'

class HolidayCountDownPage < CountDownBasePage
  #
  #def check_countdown_screen
  #  if wait_for_page_to_load(@@countdown_page_title, 2)==false
  #    fail("#{@@countdown_page_title} text not found")
  #  end
  #end
  #
  #def check_count_down_page
  #  check_countdown_screen
  #  sleep 1
  #  assert_text_present(@@countdown_share_button_text)
  #  assert_text_present(@@countdown_days_text)
  #  assert_text_present(@@countdown_hours_text)
  #  assert_text_present(@@countdown_minutes_text)
  #  assert_text_present(@@countdown_seconds_text)
  #
  #  @@countdown_countdown_message_from_screen=query("view marked:'slogan_text'", :text).first
  #  if (@@countdown_countdown_message_from_screen.match(/#{@@countdown_countdown_message}/)==nil)
  #    fail ("text #{@@countdown_countdown_message_from_screen} not found")
  #  end
  #
  #end

end


