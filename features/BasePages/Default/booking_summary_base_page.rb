class BookingSummaryBasePage < BasePage

  #this method checks booking_summary_page is shown, by verifying one element
  def check_booking_summary_screen
    assert_wait_for_text(@@booking_summary_booking_code)
  end


  def verify_booking_reference_number
    get_booking_ref_number=CommonMethods.new.get_booking_ref_number
    puts "booking ref #{get_booking_ref_number}"
    wait_for_text get_booking_ref_number
  end

  def verify_days_to_go
    get_countdown_days=CommonMethods.new.get_countdown_days
    puts "days to go #{get_countdown_days}"
    wait_for_text get_countdown_days.to_s
  end

end
