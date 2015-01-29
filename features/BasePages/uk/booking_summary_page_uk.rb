class BookingSummaryPage < BookingSummaryBasePage
  include eval($g_hw_module)
end



module Phone
  def check_products_in_booking_summary(var)
    if var=="flight"
      products=$g_booking.get_flights_details
      products.each do |val|
        scroll_page_and_assert_text val["departureAirportName"]+" #{@@to_flight_strings} "+val["arrivalAirportName"]
      end
    elsif var=="hotel"
      products=$g_booking.get_hotel_details
      products.each do |val|
        scroll_page_and_assert_text val
      end
    else
      fail("wrong argument")
    end
  end


  def verify_booking_summary_details
    check_booking_summary_screen
    verify_booking_reference_number

    assert_wait_for_text(@@bookingSummary_bookingReference) # "Booking reference number:"
    assert_wait_for_text(escape_quotes(@@bookingSummary_quote)) # "You'll need this number if you contact us with any questions."
    assert_wait_for_text(@@bookingSummary_flighthotelRefNumber) # "Flight and hotel reference number:"
    assert_wait_for_text(@@bookingSummary_flighthotelRefNumberQuote) # "You’ll need this number to book an extra for your holiday."
    assert_wait_for_text(@@bookingSummary_leadPassenger) # "Lead Passenger:"
    scroll_page_and_assert_text(@@bookingSummary_emailDescription) # "Send your full holiday summary to yourself or other passengers."
    scroll_page_and_assert_text(@@bookingSummary_emailTitle) # "Email my booking details"
  end



  def verify_days_to_go
    fail "MAY NOT BE NEEDED"
    get_countdown_days= $g_current_user_details[:valid][:departuredate]
    res1=Date.parse(get_countdown_days)
    days=res1.strftime("%e")
    suffix_days=CommonMethods.new.get_day_number_suffix(days.to_i)

    str=res1.strftime("%e#{suffix_days} %B %Y")
    puts "Departure date :#{str}:"
    scroll_page_and_assert_text str.to_s
  end

end

