# encoding: utf-8
#require_relative 'base_page_ios' if ENV['PLATFORM'] == 'ios'
#require_relative 'base_page_android' if ENV['PLATFORM'] == 'android'

class HomeBasePage < BasePage

  def initialize
    #set_strings
    @@user_details= @@user_details || User.new()
  end

  def trait
    $g_query_txt+"text:'#{@@home_page_loading}'"
  end

  def await(opts={})
    text=$g_query_txt+"text:'#{@@home_page_loading}'"
    if (query(text))
      sleep 5
    end
    wait_for_elements_do_not_exist([$g_query_txt+"text:'#{@@home_page_loading}'"])
    sleep(5)
    self
  end

  #Check one element on home screen to confirm page is loaded
  def check_home_screen
    return wait_for_acc_label(@@home_page_acc_label, 20)
  end

  def wait_for_home_page_to_load
    wait_for_progress_to_disappear(@@loading_finding_your_holiday, 40)
  end

  def check_i_am_on_home_page
    check_home_screen
    #check_welcome_messages
  end


  def click_weather_biscuit
    scroll_page_and_assert_text("destination_temperature", "down")
    click_accessibility_label "destination_temperature"
    verify_page_title @@weather_page_title
  end

  def navigate_to_hotel(num)
    scroll_page_and_assert_text @@side_panel_hotel
    touch "#{$g_query_txt}text:'#{@@side_panel_hotel}' index:#{num.to_i-1}"
  end

  def navigate_to_weather_page
    scroll_page_and_assert_text(@@side_panel_weather, "down")
    touch_txt_and_verify_title @@side_panel_weather,@@weather_page_title

  end

  def navigate_to_meet_rep_page
    scroll_page_and_assert_text(@@side_panel_meet_rep, "down")
    touch_txt_and_verify_title @@side_panel_meet_rep, @@side_panel_meet_rep
  end

  def navigate_to_TandC_page
    scroll_side_panel(@@side_panel_TandC)
    touch_txt_and_verify_title @@side_panel_TandC, @@terms_text
  end

  def navigate_to_booking_summary_page
    scroll_side_panel(@@side_panel_booking_summary)
    touch_txt_and_verify_title(@@side_panel_booking_summary, @@booking_summary_title)
  end

  def navigate_to_contact_us_page
    scroll_side_panel(@@side_panel_contact_us)
    touch_txt_and_verify_title(@@side_panel_contact_us, @@contact_us_contact_tui_service)
  end


  def click_countdown_biscuit
    scroll_page_and_assert_text("countdown_biscuit")
    click_accessibility_label "countdown_biscuit"
    verify_page_title @@countdown_page_title
  end

  def navigate_to_countdown_page
    scroll_page_and_assert_text(@@side_panel_countdown, "down")
    touch_txt_and_verify_title(@@side_panel_countdown, @@countdown_page_title)
  end

  def click_on_account_button
    wait_for_acc_label @@home_page_account_acc_label
    sleep 2
    click_accessibility_label @@home_page_account_acc_label
    verify_page_title @@my_bookings_title
  end


  def check_booking_in_past_message(txt)
    sleep 5
    welcome_message_from_screen=get_welcome_msg_from_screen
    if (welcome_message_from_screen.match(/#{txt}/)==nil)
      fail("check_booking_in_past_message: Booking message is wrong")
    else
      puts "\n\n\ ** Found text #{txt} on home screen ** "
    end
  end

end