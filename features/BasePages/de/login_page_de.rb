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
end
