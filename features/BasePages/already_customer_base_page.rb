class AlreadyCustomerBasePage < BasePage

  def initialize
  end

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
    touch_and_verify(@@login_with_existing_credentials,@@login_page_text)
  end

  def click_register_to_tui
    fail("TODO")
  end

end
