require_relative 'base_module'
module WeatherModule

  module Phone
    include BaseModule
    #this method checks weather the page is shown by verifying one element
    def check_weather_page
      check_weather_screen_title
      sleep 1
      fail "TODO"
    end
  end

  module Tablet
    include BaseModule
    def check_weather_page
     assert_wait_for_text @@share_weather
     assert_wait_for_text @@facebook_share
     assert_wait_for_text @@twitter_share
    end
  end
end
