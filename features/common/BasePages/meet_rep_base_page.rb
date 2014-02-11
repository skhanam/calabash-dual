class MeetRepBasePage < BasePage

   def verify_meet_rep_screen
     scroll_page_and_assert_text @@meet_rep_title
     scroll_page_and_assert_text @@meet_rep_email_link
     scroll_page_and_assert_text @@meet_rep_call_us
   end


  def check_name_of_rep
    scroll_page_and_assert_text(TEST_DATA[:meet_representative][:rep_name])
    assert_wait_for_text(TEST_DATA[:meet_representative][:Department])
  end

  def check_address_of_rep
    scroll_page_and_assert_text TEST_DATA[:meet_representative][:address1]
    scroll_page_and_assert_text TEST_DATA[:meet_representative][:address2]
  end
end
