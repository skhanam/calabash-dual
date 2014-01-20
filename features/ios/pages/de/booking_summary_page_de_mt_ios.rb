=begin
  * Description : page to verify booking summary page
  * Author: Tejasvi K M
  * Date: 15 jan 2013
=end
require_relative '../../../../features/BasePages/base_page_ios'

class BookingSummaryPage < BasePage

  #this method checks booking_summary_page is shown, by verifying one element
  def check_booking_summary_screen
    sleep 2
    if wait_for_page_to_load(@@booking_summary_booking_code, 2)==false
      fail("#{@@booking_summary_booking_code} text not found")
    end
  end

  #this method checks check_booking_summary_page is shown, by verifying elements
  def check_booking_summary_page
    check_booking_summary_screen
    full_name=@@user_details[:first_name]+" "+@@user_details[:last_name]
    check_text_must_be_in_view(full_name)
    check_text_must_be_in_view(@@booking_summary_title)
    check_text_must_be_in_view(@@booking_summary_booking_code)
    check_text_must_be_in_view(@@booking_summary_passengers_text)
    sleep 1
  end

  def read_booking_information
    booking=Booking.new
    booking={:days_to_go => query("view marked:'daysToGo'", :text).first.to_i,
             :booking_id => query("view marked:'bookingReference'", :text).first.to_i}
    @@user_details[:Bookings]=booking
  end


  # Accessibility labels available
  #
  #daysToGoLabel
  #daysToGo
  #bookingReferenceLabel
  #bookingReference
  #referenceQuote
  #leadPassengerLabel
  #leadPassenger
  #yourPartyText
  #yourParty


end


