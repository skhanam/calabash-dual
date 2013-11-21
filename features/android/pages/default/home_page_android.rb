require 'calabash-android/abase'
require_relative 'base_page_android'

class HomeBasePage < BasePage

  def logout_from_home_screen
    performAction("go_back")
    performAction('wait_for_text', 'Log out', 2)
    touch("* text:'Log out'")
    performAction('wait_for_text', 'Confirm', 2)
    touch("* text:'Confirm'")
    sleep(2)
  end

end