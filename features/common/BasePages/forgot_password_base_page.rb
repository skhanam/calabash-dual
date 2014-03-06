class ForgotPasswordBasePage < BasePage

  def check_forgot_password_page
    assert_wait_for_text @@forgot_password_title
    assert_text_elements [@@forgot_password_username_or_email, @@forgot_password_send_button,
                          @@forgot_password_let_us_know_email, @@forgot_password_need_help]

  end

  def enter_wrong_username_or_email
    fail("unused")
    enter_username_or_email(USERS[:invalid][:email])
  end


  def submit_change_password
    click_on_text @@forgot_password_send_button
  end

  def check_wrong_username_email
    assert_wait_for_text @@forgot_password_email_help
  end

  def check_email_populated(username)
    assert_wait_for_text(username)
  end

  def check_email_field_empty
    if $g_android
      txt=query("all TiEditText index:1", :text).first
    elsif $g_ios
      txt=query("textField index:0", :text).first
    end
    fail "username field is not empty" if txt !=""
  end

  def enter_username_or_email(text)
    fail("unused")
    if $g_ios
      enter_text(text, 1, "enter")
      #set_text "textField index:0", text
      #sleep 1
      #touch("view marked:'#{text}'")
      #sleep 1
      #tap_keyboard_action_key
      #sleep 1
    elsif $g_android
      ti_enter_details(text, 1)
    end
  end
end



