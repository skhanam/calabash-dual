#require 'calabash-android/abase'
require_relative 'base_page_ios' if ENV['PLATFORM'] == 'ios'
require_relative 'base_page_android' if ENV['PLATFORM'] == 'android'

class HomeBasePage < BasePage

  def trait
    $g_query_txt+"text:'#{@@home_page_loading}'"
  end

  def await(opts={})
    wait_for_elements_exist([trait])
    wait_for_elements_do_not_exist([$g_query_txt+"text:'#{@@home_page_loading}'"])
    wait_for_elements_exist([ $g_query_txt+"text:'#{@@home_page_home}'"])
    sleep(2)
    self
  end

  def logout_from_home_screen
    performAction("go_back")
    performAction('wait_for_text', 'Log out', 2)
    touch( $g_query_txt+"text:'Log out'")
    performAction('wait_for_text', 'Confirm', 2)
    touch( $g_query_txt+"text:'Confirm'")
    sleep(2)
  end

end