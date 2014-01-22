#require 'calabash-android/abase'
require_relative 'base_page_ios' if ENV['PLATFORM'] == 'ios'
require_relative 'base_page_android' if ENV['PLATFORM'] == 'android'

class WeatherBasePage < BasePage

  def initialize
  end

  #this method checks weather the page is shown by verifying one element
  def check_weather_screen
    sleep 2
    if wait_for_text_to_appear_view(@@weather_page_title, 5)==false
      fail("#{@@weather_page_title} text not found")
    end
  end

  def check_days
    time=get_current_time
    count=1
    while (count<6) #Check values for next 5 days
      next_day=time+add_days(count)
      next_day_text=next_day.strftime("%A")
      next_day_date_text=next_day.strftime("%e. %B %Y")
      puts "#{next_day_text} #{next_day_date_text}"

      scroll_page_till_text_found(next_day_text, "down")
      check_text_must_be_in_view(next_day_text)
      check_text_must_be_in_view(next_day_date_text)
      count+=1
    end
  end

  #this method checks weather the page is shown by verifying one element
  def check_weather_page
    check_weather_screen
    check_days
    sleep 1
  end

end
