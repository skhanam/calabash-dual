require_relative '../../../BasePages/login_base_page'

class LoginPage < LoginBasePage

  def initialize
    await
  end

  def verify_page
    wait_for_elements_exist([$g_query_txt+"marked:'#{@@login_page_text}'",
                             $g_query_txt+"marked:'#{@@email_text}'",
                             $g_query_txt+"marked:'#{@@email_hint_text}'",
                             $g_query_txt+"marked:'#{@@password_text}'",
                             $g_query_txt+"marked:'#{@@password_hint_text}'",
                             $g_query_txt+"marked:'#{@@login_button}'",
                             $g_query_txt+"marked:'#{@@password_reset}'"],
                            :timeout => 5)
    #TODO verify I need help & privacy policy text
  end


  def enter_credentials(username, password)
    verify_page
    touch($g_query_txt+"text:'#{@@email_hint_text}'")
    sleep 1
    keyboard_enter_text(username)
    touch("toolbarTextButton index:1")
    sleep 1
    keyboard_enter_text(password)
    touch("toolbarTextButton index:1")
    sleep 1
  end


end
