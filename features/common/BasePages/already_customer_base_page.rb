class AlreadyCustomerBasePage < BasePage

  #def initialize
  #end

  def check_already_customer_screen
    assert_wait_for_text(@@already_customer_title)
  end

  def check_already_customer_page
    check_already_customer_screen
    assert_text_elements([@@already_customer_title,
                          @@already_registered,
                          @@login_with_existing_credentials,
                          @@not_yet_registered
                         ])
    sleep 2
    #TODO verify this @@register_with_booking_code

  end

  def click_already_registered
    touch_txt_and_verify_title(@@login_with_existing_credentials,@@login_page_text)
  end

  def click_register_to_tui
    fail("TODO")
  end

  def click_not_yet_registered_with_tui
    touch_txt_and_verify_title(@@not_yet_registered,@@new_user_registration_create_account_text1)
    return NewUserRegistrationBasePage.new
  end

end
