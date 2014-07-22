require_relative 'base_module'
module HomeModule
  include BaseModule

  def logout_from_home_screen
    click_accessibility_label @@home_page_sidepanel_acc_label
    sleep 2
    scroll_side_panel(@@log_out_text)
    touch($g_query_txt+"text:'#{@@log_out_text}'")
    sleep(2)
    touch($g_query_txt+"text:'#{@@logout_confirm}'")
    sleep(5)
    return WelcomePage.new
  end

  def click_booking_summary_biscuit
    scroll_page_and_assert_text("booking_summary", "down")
    click_accessibility_label "booking_summary"
    verify_page_title @@booking_summary_title
  end

  module Phone
  end

  module Tablet
  end
end
