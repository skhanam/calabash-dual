class SidePanel < BasePage

  def navigate_to_TandC_page
    scroll_side_panel(@@side_panel_TandC)
    touch_txt_and_verify_title @@side_panel_TandC, @@tui_service_terms_text
  end

  def navigate_to_contact_us_page
    scroll_side_panel(@@side_panel_contact_us)
    sleep 1
    touch_txt_and_verify_title(@@side_panel_contact_us, @@side_panel_contact_us)
    wait_for_text @@side_panel_contact_us
  end

  def verify_elements_booking(lang)
    @sidepanel=SidePanelEng.new if lang=="eng"
    @sidepanel=SidePanelNor.new if lang=="nor"
    @sidepanel.verify_side_panel_strings
  end

  def navigate_to_flights_page
    count=CommonMethods.new.find_number_of_flights
    txt=@@side_panel_flight if count==1
    txt=@@side_panel_flights if count>1

    scroll_page_and_assert_text(txt, "down")
    touch_txt_and_verify_title(txt, @@flights_page_title)
  end


  def navigate_to_countdown_page
    scroll_page_and_assert_text(@@side_panel_countdown, "down")
    touch_txt_and_verify_title(@@side_panel_countdown, @@countdown_page_title)
  end

  def navigate_to_hotel(num)
    scroll_page_and_assert_text @@side_panel_hotel
    touch "#{$g_query_txt}text:'#{@@side_panel_hotel}' index:#{num.to_i-1}"
    sleep 3
  end

  def navigate_to_weather_page
    scroll_page_and_assert_text(@@side_panel_weather, "down")
    touch_txt_and_verify_title @@side_panel_weather, @@weather_page_title
  end

  def navigate_to_insurance_page
    scroll_page_and_assert_text(@@side_panel_insurance, "down")
    touch_txt_and_verify_title @@side_panel_insurance, @@insurance_title
  end

  def navigate_to_my_tour_guide
    scroll_page_and_assert_text(@@side_panel_my_tour_guide, "down")
    touch_txt_and_verify_title @@side_panel_my_tour_guide, @@my_tour_guide_text
  end

  def validate_typical_booking_menu_items(var)
    case var
      when "Countdown"
        scroll_page_and_assert_text @@side_panel_countdown
      when "My Booking"
        scroll_page_and_assert_text UnicodeUtils.upcase(@@side_panel_my_booking)
      when "Booking summary"
        scroll_page_and_assert_text @@side_panel_booking_summary
      when "Flights"
        check_side_panel("flight", 2) # 2 flights
      when "Hotel"
        check_side_panel("hotel", 2) # 2 hotels
      when "Insurance"
        check_side_panel("insurance", 1) # 1 insurance
      when "Extra"
        check_side_panel("extra", 2) # 2 extras
      when "Destination information"
        scroll_page_and_assert_text UnicodeUtils.upcase(@@side_panel_destination_info)
      when "Weather"
        scroll_page_and_assert_text @@side_panel_weather
      when "Destination guide"
        scroll_page_and_assert_text @@side_panel_destination_guide
      when "excursions"
        scroll_page_and_assert_text @@side_panel_excursions
      when "Good to know"
        scroll_page_and_assert_text @@side_panel_good_to_know
      when "Kontakt heading"
        scroll_page_and_assert_text UnicodeUtils.upcase(@@side_panel_contact_heading)
      when "My travel agent"
        scroll_page_and_assert_text @@side_panel_my_tour_guide
      when "Kontakt"
        scroll_page_and_assert_text @@side_panel_contact_us
      when "My travel agent"
        scroll_page_and_assert_text @@side_panel_travel_agent
      when "TUI onsite service"
        scroll_page_and_assert_text @@side_panel_tui_service_on_site

    end
  end

  def navigate_to_booking_summary_page
    scroll_side_panel(@@side_panel_booking_summary)
    touch_txt_and_verify_title(@@side_panel_booking_summary, @@booking_summary_title)
  end


  def tui_service_onsite_from_sidepanel
    scroll_side_panel @@contact_us_contact_tui_service
    touch_txt_and_verify_title(@@contact_us_contact_tui_service,@@tui_service_title)
  end

  def verify_elements_for_typical_booking
    assert_wait_for_text @@side_panel_booking_summary
    res=CommonMethods.new.get_all_products_for_booking
    res.uniq.each do |var|
      count=res.count(var)
      check_side_panel(var)
    end
  end


  def navigate_to_travel_agent_page
    scroll_side_panel(@@side_panel_travel_agent)
    touch_txt_and_verify_title(@@side_panel_travel_agent,@@my_travel_agent_title)
  end

  def navigate_to_good_to_know_page
    scroll_side_panel(@@side_panel_good_to_know)
    touch_txt_and_verify_title(@@side_panel_good_to_know, @@good_to_know_page_title)
  end

  def verify_elements_for_flight_single_booking
    fail("unused")
    #$g_current_booking=FLIGHT_BOOKING
    assert_wait_for_text @@side_panel_booking_summary
    res=CommonMethods.new.get_all_products_for_booking
    res.uniq.each do |var|
      count=res.count(var)
      check_side_panel(var)
    end
  end


  def side_panel_elements
    fail("unused")
    scroll_page_and_assert_text @@side_panel_countdown

    scroll_page_and_assert_text @@side_panel_my_booking #heading
    scroll_page_and_assert_text @@side_panel_booking_summary

    scroll_page_and_assert_text @@side_panel_destination_info # heading
    scroll_page_and_assert_text @@side_panel_weather
    scroll_page_and_assert_text @@side_panel_destination_guide
    scroll_page_and_assert_text @@side_panel_excursions
    scroll_page_and_assert_text @@side_panel_good_to_know

    scroll_page_and_assert_text @@side_panel_contact_heading
    scroll_page_and_assert_text @@side_panel_travel_agent
    scroll_page_and_assert_text @@side_panel_tui_service_on_site
    scroll_side_panel(@@side_panel_contact_us, 2)
  end


  def check_side_panel(var, count=1)
    case var
      when "flight"
        assert_wait_for_text @@side_panel_flight if count==1
        assert_wait_for_text @@side_panel_flights if count>1
      when "extra"
        assert_wait_for_text @@side_panel_extra if count==1
        assert_wait_for_text @@side_panel_extras if count>1
      when "hotel"
        assert_wait_for_text @@side_panel_hotel if count==1
        assert_wait_for_text @@side_panel_hotels if count>1
      when "insurance"
        assert_wait_for_text @@side_panel_insurance if count==1
        assert_wait_for_text @@side_panel_insurances if count>1
      when "transfer"
        assert_wait_for_text @@side_panel_transfer
      else
        fail "product type not verified:#{var}:"
    end
  end

end
