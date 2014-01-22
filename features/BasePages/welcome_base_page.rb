#require 'calabash-android/abase'
require_relative 'base_page_ios' if ENV['PLATFORM'] == 'ios'
require_relative 'base_page_android' if ENV['PLATFORM'] == 'android'

class WelcomeBasePage < BasePage

  def trait
    @hasharr={}
    $g_query_txt+"marked:'#{@@welcome_page_text}'"
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

  def navigate_to_login
    verify_welcome_page

    click_on_text(@@have_already_booked_through_TUI)
    wait_for_text_to_appear_view(@@login_options_text, 3)
    wait_for_text_to_appear_view(@@already_registered, 3)
    sleep 1
    click_on_text(@@login_with_existing_credentials)
    wait_for_text_to_appear_view(@@login_page_text, 5)

    @@user_details= @@user_details || User.new
    return LoginPage.new
  end


  def verify_welcome_page
    wait_for_elements_exist([$g_query_txt+"marked:'#{@@welcome_page_text}'"],
                            :timeout => 5)

    check_text_must_be_in_view(@@welcome_page_text)
    check_text_must_be_in_view(@@already_a_customer)
    check_text_must_be_in_view(@@have_already_booked_through_TUI)
    check_text_must_be_in_view(@@am_new_here)
    check_text_must_be_in_view(@@have_never_booked_through_TUI_before)
  end
end