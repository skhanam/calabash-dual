require_relative '../../../../features/BasePages/base_page_ios'

class WeatherPage < BasePage

  def check_weather_screen
    sleep 2
    if wait_for_page_to_load(@@weather_page_title, 2)==false
      fail("#{@@weather_page_title} text not found")
    end
  end

  def check_weather_page
    check_weather_screen
    sleep 1
  end
end


