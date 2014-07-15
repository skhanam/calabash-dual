require_relative '../../../BasePages/Default/login_base_page'

class LoginPage < LoginBasePage

  def verify_login_page
    assert_wait_for_text @@login_page_text
    assert_wait_for_text @@email_text
    assert_wait_for_text @@password_text

    scroll_page_and_assert_text @@login_forgot_password
    assert_wait_for_text @@login_forgot_password
    assert_wait_for_text @@login_button
    wait_for_partial_text_shown @@password_reset
  end

  def enter_valid_user_name
    puts "**************"
    username=$g_user_details[:username]
    enter_text(username,1,"enter")
    return $g_user_details[:username]
  end

  def enter_credentials(username, password)
    puts "IOS 7 key board"
    enter_text(username,1,"enter")
    enter_text(password,2,"enter")
    assert_wait_for_text(username, 10)
  end

  def setCountry(country)
    touch "textFieldLabel index:2"
    sleep 1
    index=picker[0].index(country)
    sleep 1
    touch("view:'UIPickerView' label text:'"+country+"'")
    sleep 2
    touch "view marked:'Fertig'"
     sleep 1
  end
end
