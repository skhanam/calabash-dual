#require 'calabash-android/abase'
require_relative 'base_page_ios' if ENV['PLATFORM'] == 'ios'
require_relative 'base_page_android' if ENV['PLATFORM'] == 'android'

class WelcomeBasePage < BasePage

  def trait
    @hasharr={}
    $g_query_txt+"marked:'#{@@welcome_page_text}'"
  end

  def navigate_to_login
    await(:timeout => 5)
    sleep(2)
    click_on_text(@@welcome_page_ready_to_login)
    return LoginPage.new
  end

  def click_login_text
    puts "waiting"
    sleep(5)
    click_on_text(read_str('welcome_cta_login'))
  end

  def await(opts={})
    wait_for_elements_exist([trait], :timeout => 5)
    self
  end

  def login_button_query
    $g_query_txt+"text:#{read_str('welcome_login_header')}"
  end


end