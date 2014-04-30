class SidePanel < BasePage

  def navigate_to_contact_us_page
    scroll_side_panel(@@side_panel_contact_us)
    sleep 1
    touch_txt_and_verify_title(@@side_panel_contact_us, @@contact_us_contact_title)
    wait_for_text @@side_panel_contact_us
  end

  def navigate_to_booking_summary_page
    scroll_side_panel(@@holiday_summary)
    touch_txt_and_verify_title(@@holiday_summary, @@booking_summary_title)
  end
end
