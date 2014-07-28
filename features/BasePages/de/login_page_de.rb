require_relative '../Default/login_base_page'

class LoginPage < LoginBasePage
  include LoginModule::Deu

  def verify_login_page
    assert_wait_for_text @@login_page_text
    assert_text_present @@email_text
    assert_text_present @@password_text
    scroll_page_and_assert_text @@login_forgot_password
    assert_text_present @@login_forgot_password
    assert_text_present @@login_button
    wait_for_partial_text_shown @@password_reset
  end

  def check_login_error_messages
    assert_wait_for_text @@username_email_error
  end

  def check_input_elements
    assert_text_present @@email_hint_text
    assert_text_present @@login_password_hint
    assert_text_present @@login_default_country
  end

  def check_buttons
    scroll_page_and_assert_text @@login_forgot_password
    assert_text_present @@submit_button
    assert_text_present @@login_forgot_password
    assert_text_present @@new_user_registration_register
    assert_text_present @@new_user_registration_need_help
    assert_text_present @@contact_us_t_and_c
  end
end
