require_relative '../../../../features/BasePages/home_page'

class HomePage < HomeBasePage

  def initialize
  end

  def logout_from_home_screen
    return WelcomePage.new
  end

  def check_i_am_on_home_screen
    wait_for_page_to_load(@@home_page_acc_label, 10)
    return element_exists("view marked:'#{@@home_page_acc_label}'")
  end

  def check_i_am_on_home_page
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

  def navigate_to_countdown_page
    scroll_side_panel(@@side_panel_countdown)
    touch_text_and_verify(@@side_panel_countdown,@@countdown_page_title)
    return CountDownPage.new
  end

  def navigate_to_weather_page
    scroll_side_panel(@@side_panel_weather)
    touch_text_and_verify(@@side_panel_weather,@@weather_page_title)
    return WeatherPage.new
  end


  def click_countdown_biscuit
    touch_text_and_verify("countdown_biscuit",@@countdown_page_title)
  end

  def click_weather_biscuit
    touch_text_and_verify("destination_temperature",@@weather_page_title)
  end
end


