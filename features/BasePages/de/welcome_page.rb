require_relative '../Default/welcome_base_page'

class WelcomePage < WelcomeBasePage

  def check_welcome_screen
    return wait_for_text(@@already_customer_title)
  end

  def verify_welcome_page
    assert_wait_for_text @@already_customer_title
    assert_text_elements([@@already_customer_title,
                          @@already_registered,
                          @@login_with_existing_credentials,
                          @@not_yet_registered
                         ])
    sleep 2
  end

  def verify_welcome_page
    check_welcome_screen

  end

  def click_register_to_tui
    fail("TODO")
  end

  def click_not_yet_registered_with_tui
    sleep 2
    CommonMethods.new.close_whats_new_dialog
    CommonMethods.new.close_push_notifications

    click_on_text @@register_with_booking_code
    assert_wait_for_text @@signup_create_account
    return NewUserRegistrationBasePage.new
  end

  def check_already_registered
    assert_wait_for_text @@already_registered
    assert_wait_for_text @@login_with_existing_credentials
  end

  def check_not_registered
    assert_wait_for_text @@not_yet_registered
    assert_wait_for_text @@register_with_booking_code
  end

  def click_new_here
    scroll_page_and_assert_text @@have_never_booked_through_TUI_before
    click_on_text @@have_never_booked_through_TUI_before
    assert_wait_for_text @@new_to_tui_discover_tui
  end

  def click_already_registered
    CommonMethods.new.close_whats_new_dialog
    CommonMethods.new.close_push_notifications

    click_on_text @@login_with_existing_credentials
    assert_wait_for_text @@login_page_text
  end
end