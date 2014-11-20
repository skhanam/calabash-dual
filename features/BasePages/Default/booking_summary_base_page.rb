class BookingSummaryBasePage < BasePage
  include Tablet if $g_tablet
  #this method checks booking_summary_page is shown, by verifying one element
  def check_booking_summary_screen
    assert_wait_for_text(@@booking_summary_booking_code)
  end

  def verify_days_to_go
    get_countdown_days=CommonMethods.new.get_countdown_days
    puts "days to go #{get_countdown_days}"
    wait_for_text get_countdown_days.to_s
  end

end

module Tablet

  def verify_booking_reference_details
    @booking_code, @lead_passenger, @other_passengers = $g_booking.en_get_booking_summary_info if $g_eng_app
    @booking_code, @lead_passenger, @other_passengers = $g_booking.de_get_booking_summary_info if $g_german_app

    assert_wait_for_acc "HolidaySummary_menuItems"
    sleep 2
    wait_for_partial_text_shown @booking_code
    wait_for_partial_text_shown @lead_passenger
    @other_passengers.each {|var| wait_for_partial_text_shown var}
  end

  #returns elements to verify on booking summary page
  def verify_booking_summary_details
    puts "$g_booking.en_get_passenger_details #{$g_booking.en_get_passenger_details}"
    hash_arr= $g_booking.en_get_passenger_details
    assert_wait_for_text hash_arr["LeadPassenger"][0]
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
