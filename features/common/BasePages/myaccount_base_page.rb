=begin
  * Description : contains methods for My accounts, change password and
  * Author: Tejasvi K M
  * Date: 15 jan 2013
=end

class MyAccountBasePage < BasePage

  def check_my_account_screen_title
    verify_page_title @@my_account_title
    #assert_wait_for_text(@@personal_details)
  end

  def verify_my_details
    sleep 2
    scroll_page_and_assert_text(@@personal_details, "up")

  end

  def check_my_account_page
    check_my_account_screen_title
    assert_wait_for_text(@@personal_details)
    assert_text_present(@@my_account_username)
    assert_text_present(@@my_account_first_name)
    assert_text_present(@@my_account_surname)
    assert_text_present(@@my_account_email)
    assert_text_present(@@my_account_update_email)
    assert_text_present(@@my_account_change_password)

    scroll_page_and_assert_text(@@log_out_text)
    assert_text_present(@@my_account_newsletter_text)
    assert_text_present(@@my_account_signup_newsletter)
    assert_text_present(@@log_out_text)
  end


  def check_change_password_screen
    assert_wait_for_text(@@change_password_title)
  end

  def check_change_password_page
    check_change_password_screen
    assert_text_elements([@@change_password_title,
                          @@change_password_create_new_password,
                          @@change_password_info,
                          @@change_password_text2,
                          @@change_password_send_button])
  end

  def click_change_password_button
    touch_txt_and_verify_title(@@my_account_change_password, @@change_password_title)
  end


  def click_update_email_button
    touch_txt_and_verify_title(@@my_account_update_email, @@update_email_text)
  end

  def check_update_email_screen
    assert_wait_for_text(@@update_email__text2)
  end

  def check_update_email_page
    assert_text_elements([@@update_email_text,
                          @@update_email_new_email,
                          @@update_email_new_password,
                          @@update_email__text2,
                          @@update_email_submit,
                          @@update_email_forgot_password])
    assert_text_present(@@update_email_new_email_hint) if $g_ios
    assert_text_present(@@update_email_new_password_hint) if $g_ios
  end


  def logout_from_app
    scroll_page_and_assert_text(@@log_out_text)

    touch($g_query_txt+"marked:'#{@@log_out_text}'")
    assert_wait_for_text(@@my_account_logout_title)

    assert_text_present(@@my_account_logout_title)
    assert_text_present(@@my_account_logout_yes)
    assert_text_present(@@my_account_logout_no)
    sleep 1
    touch("button marked:'#{@@my_account_logout_yes}'")
    sleep 4
  end


  def validate_menu_items(var)
    case var
      when "username"
        assert_text_present($g_user_details[:username])
      when "first name"
        assert_text_present($g_user_details[:firstname])
      when "surname"
        assert_text_present($g_user_details[:lastname])
      when "email"
        assert_text_present($g_user_details[:email])
      when "update email button"
        assert_text_present(@@my_account_update_email)
      when "password change button"
        assert_text_present(@@my_account_change_password)
      when "newsletter"
        scroll_page_and_assert_text(@@my_account_newsletter_text)
        assert_text_present(@@my_account_newsletter_text)
      when "logout"
        scroll_page_and_assert_text(@@log_out_text)
        assert_text_present(@@log_out_text)
    end
  end

end

