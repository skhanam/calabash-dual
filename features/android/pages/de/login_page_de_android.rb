require 'calabash-android/abase'
require_relative '../../../../features/BasePages/login_base_page'

class LoginPage < LoginBasePage
  def verify_page
    wait_for_elements_exist([$g_query_txt+"marked:'#{@@login_page_text}'"],
                            :timeout => 5)
    check_text_in_view(@@login_page_text)
    check_text_in_view(@@email_text)
    check_text_in_view(@@password_text)
    check_text_in_view(@@login_page_text)
    check_text_in_view(@@login_button)
    check_text_in_view(@@password_reset)
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