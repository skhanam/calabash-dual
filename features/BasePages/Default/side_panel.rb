class SidePanel < BasePage

  def navigate_to_contact_us_page
    scroll_side_panel(@@side_panel_contact_us)
    sleep 1
    touch_txt_and_verify_title(@@side_panel_contact_us, @@contact_us_contact_title)
    wait_for_text @@side_panel_contact_us
  end

  def navigate_to_booking_summary_page
    scroll_side_panel(@@holiday_summary)
    touch_txt_and_verify_title(@@holiday_summary, @@booking_summary_title)
  end

  def check_sidepanel_based_on_bookings
    if ($g_current_booking["payload"]["excursions"]["numberOfExcursions"].to_i > 0)
      scroll_side_panel_and_assert @@excursions
    end

    #verify holiday extras
  end

  def navigate_to_flights_page
    count=CommonMethods.new.find_number_of_flights
    if count==1
      txt=@@side_panel_flight
      title=@@flight_page_title
    end

    if count>1
      txt=@@side_panel_flights
      title=@@flights_page_title
    end

    scroll_page_and_assert_text(txt, "down")
    touch_txt_and_verify_title(txt, title)
  end


  def navigate_to_weather_page
    scroll_page_and_assert_text(@@side_panel_weather, "down")
    touch_txt_and_verify_title @@side_panel_weather, @@weather_page_title
  end

  def navigate_to_app_feedback
    scroll_side_panel_and_assert @@side_panel_app_feedback
    touch_txt_and_verify_title @@side_panel_app_feedback,@@app_feed_back_title1
  end

  def navigate_to_hotel(num=1)
    scroll_page_and_assert_text @@side_panel_hotel
    touch "#{$g_query_txt}text:'#{@@side_panel_hotel}' index:#{num.to_i-1}"
    sleep 3
  end

  def navigate_to_countdown_page
    scroll_page_and_assert_text(@@side_panel_countdown, "down")
    touch_txt_and_verify_title(@@side_panel_countdown, @@countdown_page_title)
  end

  def navigate_from_side_menu(var)
    case var
      when "Holiday summary"
        scroll_side_panel(@@side_panel_booking_summary)
        touch_txt_and_verify_title(@@side_panel_booking_summary, @@booking_summary_title)
      when "Countdown"
        navigate_to_countdown_page
      when "Weather"
        navigate_to_weather_page
      when "Flight"
        navigate_to_flights_page
      when "Hotel"
        navigate_to_hotel
      when "Destination"
        scroll_side_panel(@@destination)
        touch_txt_and_verify_title(@@destination, nil)
      when "Duty Free"
        scroll_side_panel(@@duty_free)
        touch_txt_and_verify_title(@@duty_free, nil)
      when "Guide Online"
        scroll_side_panel(@@guide_online)
        touch_txt_and_verify_title(@@guide_online, nil)
      when "App Feedback"
        scroll_side_panel(@@app_feed_back)
        touch_txt_and_verify_title(@@app_feed_back, nil)
      when "Contact us"
        scroll_side_panel(@@side_panel_contact_us)
        touch_txt_and_verify_title(@@side_panel_contact_us, @@contact_us_contact_title)
      when "Log out"
        scroll_side_panel(@@logout)
        touch_txt_and_verify_title(@@logout, nil)
    end


  end
end

