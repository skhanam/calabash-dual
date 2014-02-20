class FlightsBasePage < BasePage

  #this method checks flights the page is shown by verifying one element
  def check_flights_screen_title
    verify_page_title @@flights_page_title
  end

  def check_flights_page
    check_from_to_airports
  end

  def check_from_to_airports
    count = CommonMethods.new.find_number_of_flights
    num=0
    while count > num
      num+=1
      res=CommonMethods.new.find_flight_details(num)
      wait_for_partial_text_shown res["departureAirportName"]
      wait_for_partial_text_shown res["arrivalAirportName"]
    end
  end

  def check_departures_dates
    count = CommonMethods.new.find_number_of_flights
    num=0
    while count > num
      num+=1
      res=CommonMethods.new.find_flight_details(num)
      val=Date.parse(res["departureDateTime"]).strftime("%d. %B %Y")
      wait_for_partial_text_shown val
    end

  end

  def check_passenger_names
    count = CommonMethods.new.find_number_of_flights
    num=0
    while count > num
      num+=1
      res=CommonMethods.new.find_flight_details(num)
      val=res["passengers"]
      val.each do |passenger|
        wait_for_partial_text_shown passenger["fullName"]
      end
    end
  end

end
