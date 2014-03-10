class MeetRepBasePage < BasePage

  def verify_meet_rep_screen
    assert_text_present @@meet_rep_text
    scroll_page_and_assert_text @@meet_rep_title
    scroll_page_and_assert_text @@meet_rep_email_link
    scroll_page_and_assert_text @@meet_rep_call_us
  end


  def check_name_of_rep
    if $g_current_booking["payload"]["meetYourRep"]==nil
      fail("No representative present")
    else
      rep_name=$g_current_booking["payload"]["meetYourRep"][0]["name"]
      CommonMethods.new.scroll_page_till_partial_text rep_name
      wait_for_partial_text_shown rep_name
    end
  end

end
