require_relative '../Default/home_base_page'

class HomePage < HomeBasePage

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



