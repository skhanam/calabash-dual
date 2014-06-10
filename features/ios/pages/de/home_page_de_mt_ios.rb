# encoding: utf-8
require_relative '../../../BasePages/Default/home_base_page'

class HomePage < HomeBasePage

  def click_booking_summary_biscuit
    scroll_page_and_assert_text("booking_summary", "down")
    touch("view marked:'booking_summary' text:'#{@@home_page_booking_summary}'")
    touch_transition("view marked:'booking_summary'", "view text:'#{@@booking_summary_booking_code}'", {:timeout => 5, :retry_frequency => 1})
  end

end

