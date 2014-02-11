class TUIServicePage < BasePage

  def check_tui_service_screen
    assert_wait_for_text @@tui_service_contact_title
  end

end
