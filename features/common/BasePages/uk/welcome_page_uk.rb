require_relative '../../../common/BasePages/welcome_base_page'

class WelcomePage < WelcomeBasePage

  def check_welcome_screen
    return wait_for_text(@@welcome_page_text)
  end

  def verify_welcome_screen
    assert_wait_for_text(@@welcome_page_text)
  end

  def verify_welcome_page
    check_welcome_screen
    assert_wait_for_text @@welcome_help_no_holiday_body
    assert_wait_for_text @@welcome_refuse
    assert_wait_for_text @@welcome_reasons
    assert_wait_for_text @@login_with_existing_credentials
    assert_wait_for_text @@welcome_help_link3
  end

end