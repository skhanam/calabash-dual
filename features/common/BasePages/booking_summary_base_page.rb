class BookingSummaryBasePage < BasePage

  #this method checks booking_summary_page is shown, by verifying one element
  def check_booking_summary_screen
    assert_wait_for_text(@@booking_summary_booking_code)
  end


#this method checks check_booking_summary_page is shown, by verifying elements
  def check_booking_summary_page
    title, value=CommonMethods.new.get_booking_summary("bookingCode")
    scroll_page_and_assert_text value
    check_partial_text_shown title
    title, value=CommonMethods.new.get_booking_summary("leadPassenger")
    scroll_page_and_assert_text value
    check_partial_text_shown title
    title, value=CommonMethods.new.get_booking_summary("otherPassengers")
    value.each do |var|
      scroll_page_and_assert_text var
    end
    check_partial_text_shown title
  end

  def read_booking_information
    booking=Booking.new
    booking={:days_to_go => query("view marked:'daysToGo'", :text).first.to_i,
             :booking_id => query("view marked:'bookingReference'", :text).first.to_i}
  end
end
