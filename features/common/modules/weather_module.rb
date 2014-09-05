require_relative 'base_module'
module WeatherModule
  include BaseModule

  module Phone
    #this method checks weather the page is shown by verifying one element
    def check_weather_page
      check_weather_screen_title
      sleep 1
    end
  end

  module Tablet
    def check_weather_page
     assert_wait_for_text "weather_share_title"
      fail "TODO"
    end
  end
end
