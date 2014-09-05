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
    include BaseModule

    def check_home_elements
      check_acc_label @@home_page_title_acc
    end

    def wait_for_home_elements
      wait_for_acc_label @@home_page_title_acc
    end

    def check_i_am_on_home_page
      check_home_screen
    end

    def click_on_account_button
      wait_for_acc_label @@home_page_account_acc
      sleep 2
      wait_for_acc_label @@home_page_account_acc
      click_accessibility_label @@home_page_account_acc
      wait_for_account_page_to_load
      verify_page_title @@my_bookings_title
    end

    def wait_for_account_page_to_load
      sleep 5
      wait_for_progress_to_disappear(@@loading_hold_on)
    end

  end

  module Tablet
    include BaseModule

    def check_home_elements
      check_acc_label @@home_page_title_acc
    end

    def wait_for_home_elements
      wait_for_acc_label @@home_page_title_acc
    end

    def check_i_am_on_home_page
      check_home_screen
    end

    def click_on_account_button
      sleep 2
      click_accessibility_label @@home_page_sidepanel_acc_label
      click_on_text "Peter Pan"
      wait_for_account_page_to_load
      verify_page_title @@my_bookings_title
    end


    def wait_for_account_page_to_load
      sleep 5
      wait_for_progress_to_disappear(@@loading_hold_on)
    end

  end
end
