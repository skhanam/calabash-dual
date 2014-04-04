require_relative '../../../common/BasePages/home_base_page'

class HomePage < HomeBasePage
  def logout_from_home_screen
    touch("view marked:'#{@@home_page_sidepanel_acc_label}'")
    sleep 2
    scroll_table_to_text("Log out")
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
end



