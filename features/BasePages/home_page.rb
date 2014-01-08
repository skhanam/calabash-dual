#require 'calabash-android/abase'
require_relative 'base_page_ios' if ENV['PLATFORM'] == 'ios'
require_relative 'base_page_android' if ENV['PLATFORM'] == 'android'

class HomeBasePage < BasePage

  def trait
    $g_query_txt+"text:'#{@@home_page_loading}'"
  end

  def await(opts={})
    text=$g_query_txt+"text:'#{@@home_page_loading}'"
    if (query(text))
      sleep 5
    end
    wait_for_elements_do_not_exist([$g_query_txt+"text:'#{@@home_page_loading}'"])
    #  wait_for_elements_exist([ $g_query_txt+"text:'#{@@home_page_home}'"])
    sleep(5)
    self
  end

end