require 'calabash-android/abase'
require_relative '../../../BasePages/home_base_page'

class HomePage < HomeBasePage

  def check_i_am_on_home_page
    check_i_am_on_home_screen
    #check_welcome_messages
  end

  #Check one element on home screen to confirm page is loaded
  def check_i_am_on_home_screen
    return wait_for_page_to_load(@@home_page_acc_label, 10)
  end

  def open_side_panel
    sleep 1
    touch ("* contentDescription:'navbarLeftButton.'")
    sleep 1
  end

  def click_booking_summary_biscuit
    scroll_page_till_text_found("booking_summary", "down")
    touch_and_verify("booking_summary", @@booking_summary_booking_code)
  end
end