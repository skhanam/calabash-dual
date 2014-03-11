class MyTouristGuideBasePage < BasePage

  def verify_my_tour_guide_screen
    assert_text_present @@my_tour_guide_text
    scroll_page_and_assert_text @@my_tour_tui_service
  end


  def check_name_of_tour_guide
    if $g_current_booking["payload"]["meetYourRep"]==nil
      fail("No representative present")
    else
      rep_name=$g_current_booking["payload"]["meetYourRep"][0]["name"]
      CommonMethods.new.scroll_page_till_partial_text rep_name
      wait_for_partial_text_shown rep_name
    end
  end

end
