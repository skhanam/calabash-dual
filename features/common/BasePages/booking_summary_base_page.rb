class BookingSummaryBasePage < BasePage



  #this method checks booking_summary_page is shown, by verifying one element
  def check_booking_summary_screen
    fail("#{@@booking_summary_booking_code} text not found") if (assert_wait_for_text(@@booking_summary_booking_code) ==false)
  end


#this method checks check_booking_summary_page is shown, by verifying elements
  def check_booking_summary_page
    fail "TODO"
    #check_booking_summary_screen
    #full_name=@@user_details[:first_name]+" "+@@user_details[:last_name]
    #assert_text_present(full_name)
    #assert_text_elements([@@booking_summary_title, @@booking_summary_booking_code, @@booking_summary_passengers_text])
    #
    #sleep 1
  end

  def read_booking_information
    booking=Booking.new
    booking={:days_to_go => query("view marked:'daysToGo'", :text).first.to_i,
             :booking_id => query("view marked:'bookingReference'", :text).first.to_i}
    @@user_details[:Bookings]=booking
  end
end
