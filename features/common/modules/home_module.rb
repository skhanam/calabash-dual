require_relative 'base_module'
module HomeModule
  include BaseModule

  def self.included(receiver)
    puts self.name+"::#{$g_hw_module}"
    receiver.send :include, Module.const_get(self.name+"::#{$g_hw_module}")
  end

  def navigate_to_check_list
    begin
      scroll_side_panel_and_assert @@holiday_checklist
      click_on_text @@holiday_checklist
    rescue
      scroll_side_panel_and_assert @@holiday_checklists
      click_on_text @@holiday_checklists
    end
    verify_page_title @@holiday_checklists
  end

  def logout_from_home_screen
    click_accessibility_label @@home_page_sidepanel_acc_label
    sleep 2
    scroll_side_panel(@@log_out_text)
    touch($g_query_txt+"text:'#{@@log_out_text}'")
    sleep(2)
    touch($g_query_txt+"text:'#{@@logout_confirm}'")
    sleep(5)
  end

  def click_booking_summary_biscuit
    scroll_page_and_assert_text("booking_summary", "down")
    click_accessibility_label "booking_summary"
    verify_page_title @@booking_summary_title
  end

  module Phone
    include BaseModule

    def click_countdown_biscuit
      scroll_page_and_assert_text(@@countdown_biscuit_acc) if $g_phone
      click_accessibility_label @@countdown_biscuit_acc
      verify_page_title @@countdown_page_title
    end

    def check_home_elements
      check_acc_label @@home_page_title_acc
    end

    def wait_for_home_elements
      wait_for_acc_label @@home_page_title_acc
    end

    def check_i_am_on_home_page
      check_home_screen
    end

    def navigate_to_account
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

    def click_weather_biscuit
      sleep 2
      assert_wait_for_acc_label "destination_temperature"
      click_accessibility_label "destination_temperature"
      sleep 2
      verify_page_title @@weather_page_title
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

    def navigate_to_account
      sleep 2
      click_accessibility_label @@home_page_sidepanel_acc_label
      click_on_text "Peter Pan"
      wait_for_account_page_to_load
      assert_wait_for_text @@personal_details
    end

    def click_countdown_biscuit
      click_accessibility_label @@countdown_biscuit_acc
      sleep 2
    end

    def wait_for_account_page_to_load
      sleep 5
      wait_for_progress_to_disappear(@@loading_hold_on)
    end


    def click_weather_biscuit
      sleep 2
      assert_wait_for_acc_label "weather_Biscuit"
      click_accessibility_label "weather_Biscuit"
      sleep 2
      verify_page_title @@weather_page_title
    end
  end

end
