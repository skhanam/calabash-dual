class SidePanel < BasePage

  def navigate_to_contact_us_page
    scroll_side_panel(@@side_panel_contact_us)
    sleep 1
    touch_txt_and_verify_title(@@side_panel_contact_us, @@side_panel_contact_us)
    wait_for_text @@side_panel_contact_us
  end
end
