=begin
  * Description : page to verify my account details , change password page
  * Author: Tejasvi K M
  * Date: 21 jan 2013
=end
require_relative '../../../../features/BasePages/base_page_ios'

class MyAccountPage < BasePage

  def check_my_account_screen
    wait_for_text_to_appear_view(@@my_account_title, 5)
  end

  def check_my_account_page
    check_my_account_screen
    check_text_must_be_in_view(@@my_account_title)
    check_text_must_be_in_view(@@personal_details)
    check_text_must_be_in_view(@@my_account_username)
    check_text_must_be_in_view(@@my_account_first_name)
    check_text_must_be_in_view(@@my_account_surname)
    check_text_must_be_in_view(@@my_account_email)
    check_text_must_be_in_view(@@my_account_update_email)
    check_text_must_be_in_view(@@my_account_change_password)

    scroll_page_till_text_found(@@log_out, "down")
    check_text_must_be_in_view(@@my_account_newsletter_text)
    check_text_must_be_in_view(@@my_account_signup_newsletter)
    check_text_must_be_in_view(@@log_out)
  end


  def check_change_password_screen
    wait_for_text_to_appear_view(@@change_password_title,5)
  end

  def check_change_password_page
    check_change_password_screen
    check_text_must_be_in_view(@@change_password_title)
    check_text_must_be_in_view(@@change_password_create_new_password)
    check_text_must_be_in_view(@@change_password_info)
    check_text_must_be_in_view(@@change_password_text2)
    check_text_must_be_in_view(@@change_password_send_button)
  end

  def click_change_password_button
    touch_and_verify(@@my_account_change_password,@@change_password_title)
  end

end


