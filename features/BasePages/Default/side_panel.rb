class SidePanel < BasePage
  include SidePanelModule
  include Module.const_get "SidePanelModule::"+$g_hw_module
  include Module.const_get "SidePanelModule::"+$g_lang_mod

  def submit_change_password
    click_on_text @@forgot_password_send_button
  end

  def check_wrong_username_email
    assert_wait_for_text @@forgot_password_email_help
  end

  def check_sidepanel_based_on_bookings
    if ($g_current_booking["payload"]["excursions"]["numberOfExcursions"].to_i > 0)
      scroll_side_panel @@excursions
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

    scroll_side_panel(txt)
    touch_txt_and_verify_title(txt, title)
  end


  def navigate_to_weather_page
    @@side_panel_weather="Weather" #TODO update later
    scroll_side_panel(@@side_panel_weather)
    touch_txt_and_verify_title @@side_panel_weather, @@weather_page_title if $g_phone
    click_on_text @@side_panel_weather  if $g_tablet
  end

  def navigate_to_app_feedback
    scroll_side_panel(@@side_panel_app_feedback)
    touch_txt_and_verify_title @@side_panel_app_feedback, @@app_feed_back_title1
  end

  def navigate_to_hotel(num=1)
    scroll_side_panel @@side_panel_hotel
    touch "#{$g_query_txt}text:'#{@@side_panel_hotel}' index:#{num.to_i-1}"
    sleep 3
    wait_for_progress_to_disappear @@loading_hold_on
  end


  def navigate_from_side_menu(var)
    sleep 2
    case var
      when "Holiday summary"
        navigate_to_booking_summary_page
      when "Excursions"
        scroll_side_panel(@@side_panel_excursions)
        touch_txt_and_verify_title(@@side_panel_excursions, @@excursions_title)
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
        touch_txt_and_verify_title(@@duty_free, @@duty_free)
      when "Guide Online"
        scroll_side_panel(@@guide_online)
        touch_txt_and_verify_title(@@guide_online, nil)
      when "App Feedback"
        navigate_to_app_feedback
      when "Contact us"
        navigate_to_contact_us_page
      when "destination"
        scroll_side_panel(@@side_panel_destination)
        touch_txt_and_verify_title(@@side_panel_destination, @@destination_title)
      when "Log out"
        scroll_side_panel(@@log_out_text)
        touch_txt_and_verify_title(@@log_out_text, nil)
    end

  end

  private :navigate_to_countdown_page ,:navigate_to_hotel,:navigate_to_app_feedback ,:navigate_to_weather_page
end