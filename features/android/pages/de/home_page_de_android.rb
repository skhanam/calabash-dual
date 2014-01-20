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

  def click_weather_biscuit
    scroll_page("destination_temperature", "down")
    touch_text_and_verify("destination_temperature", @@weather_page_title)
  end

  def navigate_to_weather_page
    scroll_page(@@side_panel_weather,"down")
    touch_text_and_verify(@@side_panel_weather, @@weather_page_title)
    return WeatherPage.new
  end

  def navigate_to_booking_summary_page
    scroll_side_panel(@@side_panel_booking_summary)
    touch_text_and_verify(@@side_panel_booking_summary, @@booking_summary_title)
    return BookingSummaryPage.new
  end

  def click_booking_summary_biscuit
    scroll_view_to_text(@@home_page_booking_summary)
    touch("view marked:'#{@@home_page_booking_summary}' index:1")
    wait_for_page_to_load(@@booking_summary_booking_code, 3)
  end

  def click_countdown_biscuit
    touch_text_and_verify("countdown_biscuit", @@countdown_page_title)
  end

  def navigate_to_countdown_page
    scroll_page(@@side_panel_countdown,"down")
    touch_text_and_verify(@@side_panel_countdown, @@countdown_page_title)
    return HolidayCountDownPage.new
  end

end