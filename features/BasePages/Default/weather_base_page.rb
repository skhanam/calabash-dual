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

      if ($g_eng_app)
        days=next_day.strftime("%e")
        suffix_days=CommonMethods.new.getDayNumberSuffix(days.to_i)
        next_day_date_text=next_day.strftime("%e#{suffix_days} %B %Y")
        next_day=next_day_text
      elsif ($g_nordics_app)
        month=CommonMethods.new.get_month_translated(next_day.strftime("%B"))
        next_day_date_text=next_day.strftime("%e #{month} %Y")
        next_day=UnicodeUtils.downcase(CommonMethods.new.get_weekday_translated(next_day_text))
      elsif ($g_german_app)
        next_day_date_text=next_day.strftime("%e. %B %Y")
        next_day=next_day_text
      end

      puts "#{next_day} #{next_day_date_text}"

      scroll_page_till_partial_text next_day_date_text.strip if $g_eng_app
      scroll_page_and_assert_text(next_day.strip)
      wait_for_partial_text_shown(next_day_date_text.strip) if $g_eng_app
      count+=1
    end

    scroll_page_and_assert_text(@@share_weather, "down")

  end

  #this method checks weather the page is shown by verifying one element
  def check_weather_page
    check_weather_screen_title
    sleep 1
    check_weather_forecast
  end

end
