class WeatherBasePage < BasePage

  #this method checks weather the page is shown by verifying one element
  def check_weather_screen_title
    verify_page_title @@weather_page_title
  end

  def check_weather_forecast
    time=get_current_time
    count=1
    while (count<6) #Check values for next 5 days
      next_day=time+add_days(count)
      next_day_text=next_day.strftime("%A")

      if ($g_current_app=='EN_TH' ||$g_current_app=='EN_FC' || $g_current_app=='NOR_SW')
        days=next_day.strftime("%e")
        suffix_days=CommonMethods.new.getDayNumberSuffix(days.to_i)
        next_day_date_text=next_day.strftime("%e#{suffix_days} %B %Y")
        puts "#{next_day_text} #{next_day_date_text}"
      elsif ($g_current_app=='DE_MT')
        next_day_date_text=next_day.strftime("%e. %B %Y")
      end
      scroll_page_and_assert_text(next_day_text.strip)
      scroll_page_till_partial_text next_day_date_text.strip
      wait_for_partial_text_shown(next_day_date_text.strip)
      count+=1
    end

    scroll_page_and_assert_text(@@share_weather, "down")

  end

  #this method checks weather the page is shown by verifying one element
  def check_weather_page
    check_weather_screen_title
    sleep 1
  end

end
