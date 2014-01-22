#require 'calabash-android/abase'
require_relative 'base_page_ios' if ENV['PLATFORM'] == 'ios'
require_relative 'base_page_android' if ENV['PLATFORM'] == 'android'

class BookingSummaryBasePage < BasePage

  def initialize
  end

  #this method checks booking_summary_page is shown, by verifying one element
  def check_booking_summary_screen
    fail("#{@@booking_summary_booking_code} text not found") if (wait_for_text_to_appear_view(@@booking_summary_booking_code, 5) ==false)
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
