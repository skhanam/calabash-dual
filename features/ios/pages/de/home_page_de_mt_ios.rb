# encoding: utf-8
require_relative '../../../common/BasePages/home_base_page'

class HomePage < HomeBasePage


  def logout_from_home_screen
    return WelcomePage.new
  end


  def open_side_panel
    sleep 1
    touch "view marked:'navbarLeftButton'"
    #swipe_dir("right")
    sleep 1
  end

  def click_booking_summary_biscuit
    scroll_page_and_assert_text("booking_summary", "down")
    touch_transition("view marked:'booking_summary'", "view text:'#{@@booking_summary_booking_code}'", {:timeout => 5, :retry_frequency => 1})
  end

end

