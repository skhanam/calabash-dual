class PostLoginHomeBasePage < BasePage

  #this method checks booking_summary_page is shown, by verifying one element
  def check_post_login_screen(text)
        assert_wait_for_text(text)
  end


=begin


  def verify_login_screen
    wait_for_elements_exist([$g_query_txt+"marked:'#{@@login_page_text}'"])
  end

  def check_weather_screen_title
    verify_page_title @@weather_page_title
  end

  def verify_hotel_text(num)
    hotel_details=$g_booking.find_hotel_details(num)
    assert_wait_for_text hotel_details["name"]
    return hotel_details
  end


=end

end
