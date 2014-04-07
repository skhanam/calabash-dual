class MyTravelAgentBasePage < BasePage

  def verify_my_tour_guide_screen
    verify_page_title @@my_travel_agent_title
  end

  def verify_my_travel_agent_page
    verify_my_tour_guide_screen
    wait_for_text USER_INFO["payload"]["agency"]["title"]
    wait_for_text USER_INFO["payload"]["agency"]["text"]
    scroll_page_and_assert_text @@my_travel_email_txt
    scroll_page_and_assert_text @@my_travel_call_txt
  end

end
