class CountDownBasePage < BasePage
  include CountdownModule
  #def initialize
  #end
  def check_countdown_screen_title
    verify_page_title(@@countdown_page_title)
  end

  def check_sharing_text
    scroll_page_and_assert_text @@countdown_share_button_text
  end

  def check_days_left
    assert_wait_for_text $g_booking.get_countdown_days.to_s
  end

  def check_text_elements
    assert_text_elements([@@countdown_days_text, @@countdown_hours_text,
                          @@countdown_minutes_text, @@countdown_seconds_text, @@countdown_share_button_text])
  end
end
