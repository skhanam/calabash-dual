require_relative '../Default/home_base_page'

class HomePageUK < HomeBasePage
  def logout_from_home_screen
    touch($g_query_txt+"marked:'#{@@home_page_sidepanel_acc_label}'")
    sleep 2
    scroll_side_panel_and_assert("Log out")
    touch($g_query_txt+"text:'Log out'")
    sleep(2)
    touch($g_query_txt+"text:'Confirm'")
    sleep(5)
    return WelcomePage.new
  end


  def navigate_to_check_list
    begin
      scroll_side_panel_and_assert @@holiday_checklist
      click_on_text @@holiday_checklist
    rescue
      scroll_side_panel_and_assert @@holiday_checklists
      click_on_text @@holiday_checklists
    end
    verify_page_title @@holiday_checklists
  end

  def click_booking_summary_biscuit
    scroll_page_and_assert_text("booking_summary", "down")
    click_accessibility_label "booking_summary"
    verify_page_title @@booking_summary_title
  end

end



