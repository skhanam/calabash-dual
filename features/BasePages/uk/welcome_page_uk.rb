require_relative '../Default/welcome_base_page'

class WelcomePage < WelcomeBasePage

  def check_welcome_screen
    return wait_for_text(@@welcome_page_text)
  end

  def verify_welcome_screen
    assert_wait_for_text(@@welcome_page_text)
  end

end
