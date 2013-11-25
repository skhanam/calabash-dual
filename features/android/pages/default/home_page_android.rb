require 'calabash-android/abase'
require_relative 'base_page_android'

class HomeBasePage < BasePage

  def trait
    "* text:'#{@@home_page_loading}'"
  end

  def await(opts={})
    wait_for_elements_exist([trait])
    wait_for_elements_do_not_exist(["* text:'#{@@home_page_loading}'"])
    wait_for_elements_exist(["* text:'#{@@home_page_home}'"])
    sleep(2)
    self
  end

  def logout_from_home_screen
    performAction("go_back")
    performAction('wait_for_text', 'Log out', 2)
    touch("* text:'Log out'")
    performAction('wait_for_text', 'Confirm', 2)
    touch("* text:'Confirm'")
    sleep(2)
  end

end