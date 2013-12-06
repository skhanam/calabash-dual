require_relative '../../../BasePages/welcome_page'

class WelcomePage < WelcomeBasePage

  def navigate_to_login
    sleep 2
    scroll("view",:down)
    await()
    sleep(2)
    click_on_text(@@welcome_page_ready_to_login)
    return LoginPage.new
  end

end