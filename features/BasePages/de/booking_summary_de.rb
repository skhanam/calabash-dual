require_relative '../Default/booking_summary_base_page'

class BookingSummaryPage < BookingSummaryBasePage

  def check_products_in_booking_summary(var)
    products=CommonMethods.new.find_de_products(var)
    if var=="flight"
      products.each do |val|
        txt_to_check=val["departureAirportName"]+" #{@@to_flight_strings} "+val["arrivalAirportName"]
        scroll_page_and_assert_text(txt_to_check,"down",nil,25)
      end
    elsif var=="hotel"
      products.each do |val|
        scroll_page_and_assert_text val["name"]
      end
    else
      fail("wrong argument")
    end
  end

  def verify_booking_reference_number
    get_booking_ref_number=$g_booking.get_booking_ref_number
    wait_for_text get_booking_ref_number
  end

  #returns elements to verify on booking summary page
  def verify_booking_summary_details
    title, value=CommonMethods.new.get_booking_summary("bookingCode")
    assert_wait_for_text value
    check_partial_text_shown title
    title, value=CommonMethods.new.get_booking_summary("leadPassenger")
    scroll_page_and_assert_text value
    check_partial_text_shown title
    title, value=CommonMethods.new.get_booking_summary("otherPassengers")
    value.each do |var|
      scroll_page_till_partial_text var
    end
    check_partial_text_shown title
  end
end
