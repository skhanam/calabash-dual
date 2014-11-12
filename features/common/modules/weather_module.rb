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
      #assert_wait_for_text @@weather_page_title
      assert_text_present @@share_weather
      assert_text_present @@facebook_share
      assert_text_present @@twitter_share
    end

    def check_days
      count =0
      res=$g_booking.get_weather_data
      res[0]["weatherData"].each do |var|
        day_num =((DateTime.parse(var["date"])).strftime("%d")).to_i
        day_suffix= CommonMethods.new.getDayNumberSuffix(day_num) if $g_eng_app
        day_suffix= "." if $g_german_app

        date_text=(DateTime.parse(var["date"])).strftime("%d#{day_suffix} %B %Y")
        day_name=(DateTime.parse(var["date"])).strftime("%A")
        date_text=day_name=@@today if count ==0

        assert_text_present date_text
        assert_text_present day_name

        count+=1
      end

    end

    def check_min_max_temp
      res=$g_booking.get_weather_data
      res[0]["weatherData"].each do |var|
        assert_text_present var["temperatureMin"].to_s+"°C"
        assert_text_present var["temperatureMax"].to_s+"°C"
      end
    end

    def check_city_name
      res=$g_booking.get_weather_data
      assert_text_present res[0]["city"]
    end
  end
end
