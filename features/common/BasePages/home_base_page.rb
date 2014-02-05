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
    return wait_for_acc_label(@@home_page_acc_label, 10)
  end

  def check_i_am_on_home_page
    check_home_screen
    check_welcome_messages
  end

  def click_weather_biscuit
    scroll_page_and_assert_text("destination_temperature", "down")
    touch_and_verify("destination_temperature", @@weather_page_title)
  end

  def navigate_to_weather_page
    scroll_page_and_assert_text(@@side_panel_weather, "down")
    touch_and_verify(@@side_panel_weather, @@weather_page_title)
    return WeatherPage.new
  end

  def navigate_to_booking_summary_page
    scroll_side_panel(@@side_panel_booking_summary)
    touch_and_verify(@@side_panel_booking_summary, @@booking_summary_title)
    return BookingSummaryPage.new
  end

  def navigate_to_contact_us_page
    scroll_side_panel(@@side_panel_contact_us)
    touch_and_verify(@@side_panel_contact_us, @@contact_us_contact_tui_service)
    return ContactUsBasePage.new
  end


  def click_countdown_biscuit
    touch_and_verify("countdown_biscuit", @@countdown_page_title)
  end

  def navigate_to_countdown_page
    scroll_page_and_assert_text(@@side_panel_countdown, "down")
    touch_and_verify(@@side_panel_countdown, @@countdown_page_title)
  end

  def click_on_account_button
    touch_and_verify(@@home_page_account_acc_label, @@my_bookings_title)
  end


  def check_booking_in_past_message(txt)
    sleep 5
    welcome_message_from_screen=get_welcome_message_from_screen
    if (welcome_message_from_screen.match(/#{txt}/)==nil)
      fail("check_booking_in_past_message: Booking message is wrong")
    else
      puts "\n\n\ ** Found text #{txt} on home screen ** "
    end
  end

end