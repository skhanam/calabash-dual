class WelcomeBasePage < BasePage

  def check_welcome_screen
    wait_for_text(@@already_customer_title, 2)
  end

  def verify_welcome_screen
    assert_wait_for_text(@@already_customer_title)
  end

  def verify_welcome_page
    wait_for_elements_exist([$g_query_txt+"marked:'#{@@already_customer_title}'"],
                            :timeout => 5)
    check_welcome_screen
    assert_text_elements([@@already_customer_title,
                          @@already_registered,
                          @@login_with_existing_credentials,
                          @@not_yet_registered
                         ])
    sleep 2
    #TODO verify this @@register_with_booking_code

  end

  def await(opts={})
    wait_for_elements_exist([trait], :timeout => 5)
    self
  end


  def navigate_to_login
    check_welcome_screen
    sleep 1
    click_on_text(@@login_with_existing_credentials)
    sleep 1
    assert_wait_for_text(@@login_page_text, 5)
    @@user_details= @@user_details || User.new
  end


  def click_new_here
    click_on_text @@did_not_book_with_tui
    assert_wait_for_text @@new_to_tui_discover_tui
  end

  def click_already_registered
    touch_txt_and_verify_title(@@login_with_existing_credentials, @@login_page_text)
  end

  def click_register_to_tui
    fail("TODO")
  end

  def click_not_yet_registered_with_tui
    touch_txt_and_verify_title(@@not_yet_registered, @@new_user_registration_create_account_text1)
    return NewUserRegistrationBasePage.new
  end


end