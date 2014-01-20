require_relative '../../../../features/BasePages/home_base_page'

class HomePage < HomeBasePage

  def initialize
    @@user_details= @@user_details || User.new()
  end

  def logout_from_home_screen
    return WelcomePage.new
  end

  #Check one element on home screen to confirm page is loaded
  def check_i_am_on_home_screen
    return wait_for_page_to_load(@@home_page_acc_label, 10)
  end

  def check_i_am_on_home_page
    check_i_am_on_home_screen
    check_welcome_messages
  end

  def check_welcome_messages
    msg=nil
    no_of_days_to_go=-15 #Hard coded for now until test data is available
    if (no_of_days_to_go < -14 && no_of_days_to_go >= -548)
      msg="bald geht's in den Urlaub!"
    elsif (no_of_days_to_go < -3 && no_of_days_to_go >= -14)
      msg="nur noch dreimal schlafen, dann geht 's endlich los!"
    elsif (no_of_days_to_go == -3)
      msg="Ihre Reise steht vor der Tür.Sind Sie schon urlaubsreif?"
    elsif (no_of_days_to_go == -2)
      msg="schon aufgeregt? Wir freuen uns, Sie bald begrüßen zu dürfen!"
    elsif (no_of_days_to_go == -1)
      msg="morgen geht' s los! Haben Sie an alles gedacht?"
    elsif (no_of_days_to_go == 0)
      msg="wir wünschen Ihnen einen schönen Urlaub!"
    elsif (no_of_days_to_go > 1 && no_of_days_to_go <= 7)
      msg="willkommen zurück! Wir hoffen, Sie hatten einen schönen Urlaub."
    elsif (no_of_days_to_go > 7)
      msg="sind Sie schon wieder reif für die Insel?"
    else
      fail("Days are incorrect")
    end

    wait_for_label(msg, 20)

  end

  def open_side_panel
    sleep 1
    swipe_dir("right")
    sleep 1
  end


  def click_weather_biscuit
    touch_text_and_verify("destination_temperature", @@weather_page_title)
  end


  def navigate_to_weather_page
    scroll_side_panel(@@side_panel_weather)
    touch_text_and_verify(@@side_panel_weather, @@weather_page_title)
    return WeatherPage.new
  end

  def navigate_to_booking_summary_page
    scroll_side_panel(@@side_panel_booking_summary)
    touch_text_and_verify(@@side_panel_booking_summary, @@booking_summary_title)
    return BookingSummaryPage.new
  end


  def navigate_to_countdown_page
    scroll_side_panel(@@side_panel_countdown)
    touch_text_and_verify(@@side_panel_countdown, @@countdown_page_title)
    return HolidayCountDownPage.new
  end


  def click_booking_summary_biscuit
    scroll_view_to_text(@@home_page_booking_summary)
    touch("view marked:'#{@@home_page_booking_summary}' index:1")
    wait_for_page_to_load(@@booking_summary_booking_code,3)
  end

  def click_countdown_biscuit
    touch_text_and_verify("countdown_biscuit", @@countdown_page_title)
  end


end

