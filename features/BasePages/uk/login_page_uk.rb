require_relative '../Default/login_base_page'

class LoginPage < LoginBasePage

  def check_login_error_messages
    assert_wait_for_text @@login_error_text
    assert_text_present @@welcome_login_surname_extra
    assert_text_present @@login_error_departure_date
    assert_text_present @@login_error_surname
  end
end
