require 'calabash-android/abase'
require_relative '../../../BasePages/home_base_page'

class HomePage < HomeBasePage

  def logout_from_home_screen
    performAction("go_back")
    performAction('wait_for_text', 'Log out', 2)
    touch( $g_query_txt+"text:'Log out'")
    performAction('wait_for_text', 'Confirm', 2)
    touch( $g_query_txt+"text:'Confirm'")
    sleep(5)
    return WelcomePage.new
  end

end