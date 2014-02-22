require_relative '../../../common/BasePages/login_base_page'

class LoginPage < LoginBasePage

  def verify_login_page
    assert_wait_for_text @@login_page_text
    assert_wait_for_text @@email_text
    assert_wait_for_text @@password_text
    assert_wait_for_text @@login_forgot_password
    assert_wait_for_text @@login_button
    wait_for_partial_text_shown @@password_reset
    #TODO verify I need help & privacy policy text
  end

  def enter_valid_user_name
    puts "**************"
    username=$g_user_details[:username]
    enter_text(username,1,"enter")
    #set_text "textField index:0", username
    #sleep 1
    #touch("* marked:'#{username}'")
    #sleep 1
    #touch("toolbarTextButton index:2")
    #sleep 1
    return $g_user_details[:username]
  end


  def enter_credentials(username, password)
    #if ENV['OS']=="ios6"
    #  touch($g_query_txt+"text:'#{@@email_hint_text}'")
    #  sleep 1
    #  keyboard_enter_text(username)
    #  touch("toolbarTextButton index:1")
    #  sleep 1
    #  keyboard_enter_text(password)
    #  touch("toolbarTextButton index:1")
    #  sleep 1
    #elsif ENV['OS']=="ios7"
    puts "IOS 7 key board"
    enter_text(username,1,"enter")
    enter_text(password,2,"enter")

    #set_text "textField index:0", username
    #sleep 1
    #
    #set_text "textField index:1", password
    #sleep 1
    #touch("* marked:'#{username}'")
    #sleep 1
    #touch("toolbarTextButton index:1")
    #sleep 1
    #touch("toolbarTextButton index:1")
    #end
    assert_wait_for_text(username, 10)
  end

  def setCountry(country)
    touch "TextFieldLabel index:2"
    sleep 1
    index=picker[0].index(country)
    sleep 1
    # query("view:'UIPickerView'",[{:selectRow =>index},{:inComponent => 0}, {:animated => 0}])
    #sleep 1
    touch("view:'UIPickerView' label text:'"+country+"'")
    sleep 2
    touch "view marked:'Fertig'"
     sleep 1
  end
end
