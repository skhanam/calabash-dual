class FlightsBasePage < BasePage

  #this method checks flights the page is shown by verifying one element
  def check_flights_screen_title
    verify_page_title @@flights_page_title
  end

  def check_flights_listing
    arr= CommonMethods.new.get_flights_details
    arr.each do |var|
      assert_text_present "#{var["departureAirportName"]} #{@@to_flight_strings} #{var["arrivalAirportName"]}"
    end
    puts arr.count
  end

  def check_details_of_flight
    arr= CommonMethods.new.get_flights_details
    arr.each do |var|
      txt="#{var["departureAirportName"]} #{@@to_flight_strings} #{var["arrivalAirportName"]}"
      assert_text_present txt
      click_on_text txt
      verify_flight_details_page
      navigate_back
      sleep 2
    end
  end

  def verify_flight_details_page
    puts ":#{@@flight_details_title}:"
    verify_page_title @@flight_details_title
    return if $g_eng_app  # just verify title and return for english app

    scroll_page_and_assert_text @@flight_details_title
    scroll_page_and_assert_text @@flight_details_airline
    scroll_page_and_assert_text @@flight_details_flight_number
    scroll_page_and_assert_text @@flight_details_passengers
    #scroll_page_and_assert_text @@flight_details_cabin_class  #not present in nordics & en
    #scroll_page_and_assert_text @@flight_details_airport_info  #not present in nordics & en
    #scroll_page_and_assert_text @@flight_details_carrier_info
  end

  def check_flights_page
    check_from_to_airports
  end

  def check_from_to_airports
    count = CommonMethods.new.find_number_of_flights
    num=0
    while count > num
      num+=1
      res=CommonMethods.new.find_flight_details_for_booking(num)
      wait_for_partial_text_shown res["departureAirportName"]
      wait_for_partial_text_shown res["arrivalAirportName"]
    end
  end

  def check_departures_dates
    count = CommonMethods.new.find_number_of_flights
    num=0
    while count > num
      num+=1
      res=CommonMethods.new.find_flight_details_for_booking(num)
      val=Date.parse(res["departureDateTime"]).strftime("%d. %B %Y")
      wait_for_partial_text_shown val
    end

  end

  def check_passenger_names
    count = CommonMethods.new.find_number_of_flights
    num=0
    while count > num
      num+=1
      res=CommonMethods.new.find_flight_details_for_booking(num)
      val=res["passengers"]
      val.each do |passenger|
        wait_for_partial_text_shown passenger["fullName"]
      end
    end
  end

end
