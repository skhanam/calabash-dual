require_relative '../Default/welcome_base_page'

class WelcomePage < WelcomeBasePage
  def verify_welcome_page
    check_welcome_screen
    assert_wait_for_text @@welcome_help_no_holiday_body
    assert_wait_for_text @@welcome_refuse
    assert_wait_for_text @@welcome_reasons
    assert_wait_for_text @@login_with_existing_credentials
    assert_wait_for_text @@welcome_help_link3
  end
end