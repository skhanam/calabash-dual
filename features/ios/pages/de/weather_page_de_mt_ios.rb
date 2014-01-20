=begin
  * Description : page to verify weather
  * Author: Tejasvi K M
  * Date: 15 jan 2013
=end

require_relative '../../../../features/BasePages/base_page_ios'

class WeatherPage < BasePage

  #this method checks weather the page is shown by verifying one element
  def check_weather_screen
    sleep 2
    if wait_for_page_to_load(@@weather_page_title, 2)==false
      fail("#{@@weather_page_title} text not found")
    end
  end

  #this method checks weather the page is shown by verifying one element
  def check_weather_page
    check_weather_screen
    sleep 1
  end
end


