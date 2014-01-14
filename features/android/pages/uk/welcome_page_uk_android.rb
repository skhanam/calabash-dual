require 'calabash-android/abase'
require_relative '../../../BasePages/welcome_page'

class WelcomePage < WelcomeBasePage
  def navigate_to_login
    await(:timeout => 5)
    sleep(2)
    click_on_text(@@welcome_page_ready_to_login)
    return LoginPage.new
  end
end