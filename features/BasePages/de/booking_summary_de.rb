require_relative '../Default/booking_summary_base_page'

class BookingSummaryPage < BookingSummaryBasePage

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
