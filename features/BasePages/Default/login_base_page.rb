class LoginBasePage < BasePage

  def trait
    $g_query_txt+"marked:'#{@@login_page_text}'"
  end

  def click_forgot_password
    click_on_text @@password_reset
    assert_wait_for_text @@forgot_password_title
  end

  def enter_default_username_password
    username= $g_user_details[:username]
    password= $g_user_details[:password]
    enter_credentials(username, password)
  end

  def navigate_to_forgot_password
    scroll_page_and_assert_text @@login_forgot_password
    click_on_text @@login_forgot_password
    assert_wait_for_text @@forgot_password_title
  end

  def submit_login_button
    sleep 1
    scroll_page_till_acc @@login_button_acc if $g_phone
    begin
      click_acc_label(@@login_button_acc)
    rescue
      press_down_button if $g_android # submit button may be hiding behind keyboard
      if $g_android && $g_tablet
        click_on_text @@submit_button
      else
        click_acc_label(@@login_button_acc)
      end
    end
  end

  def check_login_screen
    check_text_in_view @@login_welcome
  end

  def verify_login_screen
    assert_wait_for_text(@@login_welcome)
  end

  def navigate_to_terms
    scroll_page_and_assert_text @@privacy_terms_of_use
    click_on_text @@privacy_terms_of_use
  end

  def scroll_to_end_of_page
    scroll_page_and_assert_text(escape_quotes(@@welcome_help_link1))
  end

end