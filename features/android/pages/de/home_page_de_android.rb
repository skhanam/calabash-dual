require 'calabash-android/abase'
require_relative '../../../common/BasePages/home_base_page'

class HomePage < HomeBasePage

  def open_side_panel
    sleep 1
    touch ("* contentDescription:'navbarLeftButton.'")
    sleep 1
  end

  def click_booking_summary_biscuit
    scroll_page_and_assert_text("booking_summary", "down")
    touch_txt_and_verify_title("booking_summary", @@booking_summary_title)
  end
end