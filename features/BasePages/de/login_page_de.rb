require_relative '../Default/login_base_page'

class LoginPage < LoginBasePage

  def check_login_error_messages
    assert_wait_for_text @@username_email_error
  end
end
