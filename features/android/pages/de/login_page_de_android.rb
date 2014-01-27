require 'calabash-android/abase'
require_relative '../../../../features/BasePages/login_base_page'

class LoginPage < LoginBasePage
  def verify_page
    wait_for_elements_exist([$g_query_txt+"marked:'#{@@login_page_text}'"],
                            :timeout => 5)
    assert_text_present(@@login_page_text)
    assert_text_present(@@email_text)
    assert_text_present(@@password_text)
    assert_text_present(@@login_page_text)
    assert_text_present(@@login_button)
    assert_text_present(@@password_reset)
  end

  def enter_credentials(username, password)
    verify_page
    sleep 1
    ti_enter_details(username, 2)
    sleep 1
    ti_enter_details(password, 4)
    sleep 1
  end



end