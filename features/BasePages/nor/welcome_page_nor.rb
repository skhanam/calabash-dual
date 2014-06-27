require_relative '../Default/welcome_base_page'

class WelcomePage < WelcomeBasePage
  def navigate_to_login
    @welcomePage.close_whats_new_dialog
    @welcomePage.close_push_notifications
    assert_wait_for_text(@@welcome_page_text,10)
  end

  def check_welcome_screen
    return wait_for_text(@@welcome_page_text)
  end

  def verify_welcome_screen
    assert_wait_for_text(@@login_page_title)
  end

  def verify_welcome_page
    fail("TODO")
  end
end