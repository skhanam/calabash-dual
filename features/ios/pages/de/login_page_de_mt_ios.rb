require_relative '../../../common/BasePages/login_base_page'

class LoginPage < LoginBasePage

  def verify_login_page
    assert_wait_for_text @@login_page_text
    assert_wait_for_text @@email_text
    assert_wait_for_text @@email_hint_text
    assert_wait_for_text @@password_text
    assert_wait_for_text @@password_hint_text
    assert_wait_for_text @@login_button
    assert_wait_for_text @@password_reset
    #TODO verify I need help & privacy policy text
  end

  def enter_valid_user_name
    puts "**************"
    username=USERS[:valid][:username]
    set_text "textField index:0", username
    sleep 1
    touch("* marked:'#{username}'")
    sleep 1
    touch("toolbarTextButton index:2")
    sleep 1
    return USERS[:valid][:username]
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
    set_text "textField index:0", username
    sleep 1
    set_text "textField index:1", password
    sleep 1
    touch("* marked:'#{username}'")
    sleep 1
    touch("toolbarTextButton index:1")
    sleep 1
    touch("toolbarTextButton index:1")
    #end
    assert_wait_for_text(username, 10)
  end
end
