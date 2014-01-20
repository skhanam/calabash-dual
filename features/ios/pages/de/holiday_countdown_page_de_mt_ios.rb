require_relative '../../../BasePages/countdown_base_page'

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
  #  check_text_must_be_in_view(@@countdown_share_button_text)
  #  check_text_must_be_in_view(@@countdown_days_text)
  #  check_text_must_be_in_view(@@countdown_hours_text)
  #  check_text_must_be_in_view(@@countdown_minutes_text)
  #  check_text_must_be_in_view(@@countdown_seconds_text)
  #
  #  @@countdown_countdown_message_from_screen=query("view marked:'slogan_text'", :text).first
  #  if (@@countdown_countdown_message_from_screen.match(/#{@@countdown_countdown_message}/)==nil)
  #    fail ("text #{@@countdown_countdown_message_from_screen} not found")
  #  end
  #
  #end

end


