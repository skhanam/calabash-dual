require_relative '../Default/booking_summary_base_page'

class BookingSummaryPage < BookingSummaryBasePage

  def check_booking_summary_screen
    assert_wait_for_text(@@booking_summary_title)
  end

  def verify_booking_summary_details
    check_booking_summary_screen
    verify_booking_reference_number

    $g_current_booking["payload"]["bookingSummary"]["overview"]["infoList"].each do |var|
      arr=var["value"] if var["key"]=="bookingCode"
      arr=var["value"] if var["key"]=="leadPassenger"
      arr=var["value"] if var["key"]=="otherPassengers"

      arr.each do |var|
        assert_partial_text var
      end
    end

    assert_wait_for_text(@@bookingSummary_bookingReference) # "Booking reference number:"
    assert_wait_for_text(escape_quotes(@@bookingSummary_quote)) # "You'll need this number if you contact us with any questions."
    #assert_wait_for_text(@@bookingSummary_flighthotelRefNumber) # "Flight and hotel reference number:"
    #assert_wait_for_text(@@bookingSummary_flighthotelRefNumberQuote) # "You’ll need this number to book an extra for your holiday."
    assert_wait_for_text(@@bookingSummary_leadPassenger) # "Lead Passenger:"
    scroll_page_and_assert_text(@@bookingSummary_emailDescription) # "Send your full holiday summary to yourself or other passengers."
    scroll_page_and_assert_text(@@bookingSummary_emailTitle) # "Email my booking details"

  end

  def verify_booking_reference_number
    bookingReference=$g_current_user_details[:valid][:bookingnumber]
    puts "bookingReference #{bookingReference}"
    wait_for_partial_text_shown bookingReference
  end


  def verify_days_to_go
    get_countdown_days= $g_current_user_details[:valid][:departuredate]
    res1=Date.parse(get_countdown_days)
    days=res1.strftime("%e")
    suffix_days=CommonMethods.new.getDayNumberSuffix(days.to_i)

    str=res1.strftime("%e %B %Y")
    puts "Departure date :#{str}:"
    #assert_wait_for_text str.to_s
  end


end


