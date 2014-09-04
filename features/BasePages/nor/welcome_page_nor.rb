require_relative '../Default/welcome_base_page'

class WelcomePage < WelcomeBasePage
  def navigate_to_login
    CommonMethods.new.close_whats_new_dialog
    CommonMethods.new.close_push_notifications
    assert_wait_for_text(@@welcome_page_text,10)
  end



  def verify_welcome_page
    fail("TODO")
  end
end