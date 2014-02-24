require 'calabash-android/abase'
require_relative '../../../common/BasePages/login_base_page'

class LoginPage < LoginBasePage

  def verify_login_page
    wait_for_elements_exist([$g_query_txt+"marked:'#{@@login_page_text}'"],
                            :timeout => 5)
    assert_text_present @@login_page_text
    assert_text_present @@email_text
    assert_text_present @@password_text
    assert_text_present @@login_page_text
    assert_text_present @@login_button
    wait_for_partial_text_shown @@password_reset
  end

  def enter_credentials(username, password)
    ti_enter_details(username, 2)
    ti_enter_details(password, 4)
  end

  def enter_valid_user_name
    ti_enter_details($g_user_details[:username], 1)
    return $g_user_details[:username]
  end

  def setCountry(country)
    puts "TODO: handle country"
    country="Deutschland"
    sleep 1
    touch "* text:'Deutschland'"
    sleep 1
    res=query("CheckedTextView", :text)
    puts "setCountry #{res}"
    index=res.index(country)
    touch "CheckedTextView index:#{index}"
    sleep 1
  end
end