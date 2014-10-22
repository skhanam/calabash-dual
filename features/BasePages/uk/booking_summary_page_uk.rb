class BookingSummaryPage < BookingSummaryBasePage
  include eval($g_hw_module)
end

module Tablet

  def verify_booking_reference_details
    visionShopNumber=$g_current_user_details[:valid][:VisionShopNumber]
    visionBookingRef=$g_current_user_details[:valid][:VisionBookingRef]
    puts "visionBookingRef #{visionBookingRef} vision shop number #{visionShopNumber}"
    wait_for_partial_text_shown visionShopNumber
    wait_for_partial_text_shown visionBookingRef
  end

  #returns elements to verify on booking summary page
  def verify_booking_summary_details
    puts "$g_booking.get_passenger_details #{$g_booking.get_passenger_details}"
    hash_arr= $g_booking.get_passenger_details
    assert_text_present hash_arr["LeadPassenger"][0]
    hash_arr["OtherPassenger"].each { |var| assert_text_present var }
  end

  def verify_flight_summary_details
    hash_arr= $g_booking.get_flight_details
    scroll_at_text_element "Your Party"
    puts " ********** TODO: remove sroll"
    hash_arr["Departure"].each do |var|
      assert_wait_for_text var
    end
    hash_arr["Arrival"].each do |var|
      assert_wait_for_text var
    end
  end

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

  def verify_booking_reference_number
    visionShopNumber=$g_current_user_details[:valid][:VisionShopNumber]
    visionBookingRef=$g_current_user_details[:valid][:VisionBookingRef]
    puts "visionBookingRef #{visionBookingRef} vision shop number #{visionShopNumber}"
    wait_for_partial_text_shown visionShopNumber
    wait_for_partial_text_shown visionBookingRef
  end

  def verify_days_to_go
    get_countdown_days= $g_current_user_details[:valid][:departuredate]
    res1=Date.parse(get_countdown_days)
    days=res1.strftime("%e")
    suffix_days=CommonMethods.new.getDayNumberSuffix(days.to_i)

    str=res1.strftime("%e#{suffix_days} %B %Y")
    puts "Departure date :#{str}:"
    scroll_page_and_assert_text str.to_s
  end

  def check_booking_summary_screen
    assert_wait_for_text(@@booking_summary_title)
  end

end

