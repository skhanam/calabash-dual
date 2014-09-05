class WelcomeBasePage < BasePage

  def await(opts={})
    wait_for_elements_exist([trait], :timeout => 5)
    self
  end

  #def navigate_to_login
  #  CommonMethods.new.close_whats_new_dialog
  #  CommonMethods.new.close_push_notifications
  #  assert_wait_for_text(@@welcome_page_text,10)
  #end



  def navigate_to_login
    sleep 2
    CommonMethods.new.close_whats_new_dialog
    CommonMethods.new.close_push_notifications
    check_welcome_screen
    sleep 1
    click_on_text(@@login_with_existing_credentials)
    sleep 1
    assert_wait_for_text(@@login_page_text, 5)
  end
end
