require_relative 'base_module'
module HomeModule
  include BaseModule

  def self.included(receiver)
    puts self.name+"::#{$g_hw_module}"
    receiver.send :include, Module.const_get(self.name+"::#{$g_hw_module}")
  end


  def logout_from_home_screen
    click_acc_label @@home_page_sidepanel_acc_label
    sleep 2
    scroll_side_panel(@@log_out_text)
    touch($g_query_txt+"text:'#{@@log_out_text}'")
    sleep(2)
    touch($g_query_txt+"text:'#{@@logout_confirm}'")
    sleep(5)
  end

  def click_booking_summary_biscuit
    scroll_page_and_assert_text("booking_summary", "down")
    click_acc_label "booking_summary"
    verify_page_title @@booking_summary_title
  end

  module Phone
    include BaseModule

    def check_temp_present
      res=query("view marked:'#{@@weather_temp_acc}'", :text)[0] if $g_ios
      res=query("* marked:'destination_temperature.'",:text).first if $g_android
      fail("temperature is empty") if res.match(/\d+/)==nil
    end

    def scroll_to_biscuit var
      case var
        when "checklist Biscuit"
          fail "TODO"
        when "Currency Biscuit"
          fail "TODO"
        when "extras Biscuit"
          fail "TODO"
        when "Excursions Biscuit"
          fail "TODO"
        when "flights Biscuit"
          scroll_page_till_acc(@@home_page_flights_Biscuit_acc, "down")
      end
      sleep 1
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

    def check_countdown_biscuit
      assert_wait_for_acc @@countdown_biscuit_acc
      assert_wait_for_text @@days_to_go
      assert_wait_for_text $g_booking.get_countdown_days.to_s
    end

    def click_countdown_biscuit
      scroll_page_and_assert_text(@@countdown_biscuit_acc) if $g_phone
      click_acc_label @@countdown_biscuit_acc
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
      click_acc_label @@home_page_account_acc
      wait_for_account_page_to_load
      verify_page_title @@my_bookings_title
    end

    def wait_for_account_page_to_load
      sleep 5
      wait_for_progress_to_disappear(@@loading_hold_on)
    end

    def click_weather_biscuit
      sleep 2
      assert_wait_for_acc @@weather_biscuit_acc
      click_acc_label @@weather_biscuit_acc
      sleep 2
      verify_page_title @@weather_page_title
    end

    def check_days_left_to_travel
      res1=$g_booking.get_countdown_days.to_s.to_i
      res2=get_acc_label_text("days_to_go").to_i
      write_verified_text_to_file("#{res2} days to go")
      puts "#{res1} != #{res2}"
      fail("Number of days are wrong") if (res1 != res2)
    end
  end

  module Tablet
    include BaseModule

    def check_temp_present
      res=query("view marked:'#{@@weather_biscuit_acc}' view marked:'temp'", :text)[0]
      fail("temperature is empty") if res.match(/\d+/)==nil
    end

    def navigate_to_check_list
      begin
        scroll_side_panel_and_assert capitalize_first_letter_of_each_word @@holiday_checklist
        click_on_text capitalize_first_letter_of_each_word @@holiday_checklist
      rescue
        scroll_side_panel_and_assert @@holiday_checklists
        click_on_text @@holiday_checklists
      end
      assert_wait_for_text @@holiday_checklist_start_packing_list
    end

    def verify_checklist_biscuit
      wait_for_text "items still to-do"
      assert_element "view marked:'checklist_Biscuit' label text:'items still to-do'"
      assert_text_present $g_booking.get_checklist_count.to_s
    end


    def de_extras_biscuit_removed
      count=5
      while count >0
        scroll_view "right"
        sleep 0.5
        fail("extras biscuit must not be found") if element_exists("view marked:'extras_Biscuit'")
        count-=1
      end
    end

    def scroll_to_biscuit var
      case var
        when "checklist Biscuit"
          scroll_view "right"
          scroll_page_till_acc(@@home_page_checklist_Biscuit_acc, "right")
        when "Currency Biscuit"
          scroll_page_till_acc(@@home_page_currency_Biscuit_acc, "right")
        when "extras Biscuit"
          scroll_page_till_acc(@@home_page_holiday_extra_Biscuit_acc, "right")
        when "Excursions Biscuit"
          scroll_page_till_acc(@@home_page_excursions_Biscuit_acc, "right")
        when "flights Biscuit"
          scroll_page_till_acc(@@home_page_flights_Biscuit_acc, "right")
      end
      sleep 1
    end


    def check_countdown_biscuit
      assert_wait_for_acc @@countdown_biscuit_acc
      assert_wait_for_text @@days_to_go
      assert_wait_for_text $g_booking.get_countdown_days.to_s
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
      sleep 2
      click_acc_label @@home_page_sidepanel_acc_label
      click_on_text "Peter Pan"
      wait_for_account_page_to_load
      assert_wait_for_text @@personal_details
    end

    def click_countdown_biscuit
      click_acc_label @@countdown_biscuit_acc
      sleep 2
    end

    def wait_for_account_page_to_load
      sleep 5
      wait_for_progress_to_disappear(@@loading_hold_on)
    end

    def click_weather_biscuit
      assert_wait_for_acc "weather_Biscuit"
      click_acc_label "weather_Biscuit"
    end

    def check_hotel_biscuit
      assert_wait_for_acc @@home_page_hotel_Biscuit_acc
    end

    def verify_hotel_biscuit
      products=$g_booking.get_hotel_details
      products.each do |val|
        assert_wait_for_text val
      end
    end

    #check number of days left on countdown biscuit in home screen
    def check_days_left_to_travel
      res1=$g_booking.get_countdown_days.to_s.to_i
      res2=label("view marked:'#{@@countdown_biscuit_acc}' label index:0")[0]
      write_verified_text_to_file("#{res2} days to go")
      puts "#{res1} != #{res2}"
      fail("Number of days are wrong") if (res1 != res2)
    end
  end

end
