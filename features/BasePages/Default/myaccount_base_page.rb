=begin
  * Description : contains methods for My accounts, change password and
  * Author: Tejasvi K M
  * Date: 15 jan 2013
=end

class MyAccountBasePage < BasePage
  include BaseModule

  def check_my_account_screen_title
    verify_page_title @@my_account_title if $g_phone
    assert_wait_for_text(@@my_bookings_title) if $g_tablet
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
    assert_text_present(@@signup_newsletter)
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
                          @@forgot_password_email_hint,
                          @@change_password_send_button
                          ])
  end

  def click_change_password_button
    touch_txt_and_verify_title(@@my_account_change_password, @@change_password_title) if $g_phone
    touch_txt_and_verify_text(@@my_account_change_password, @@change_password_title) if $g_tablet
  end

  def click_change_email_button
    touch_txt_and_verify_title(@@my_account_update_email, @@update_email_text) if $g_phone
    touch_txt_and_verify_text(@@my_account_update_email, @@update_email_text) if $g_tablet
  end

  def check_update_email_screen
    assert_wait_for_text(@@update_reminder)
  end

  def verify_change_email_page
    if $g_phone
      assert_text_elements([@@update_email_text,
                            @@update_email_new_email,
                            @@update_email_new_password,
                            @@update_reminder,
                            @@update_email_submit
                           ])
    elsif $g_tablet
      assert_text_elements([@@update_email_text,
                            @@update_reminder,
                            @@update_email_submit
                           ])
      assert_text_present "Neue E-Mail:" # @@update_email_new_email_hint
      assert_text_present "Ihr Passwort:" # @@update_email_new_password_hint
    end
    scroll_page_and_assert_text @@update_email_forgot_password
  end

  def change_password_prefilled_username
    res=query("TiTextField", :text).first
    assert_equal($g_current_user_details[:valid][:username], query("TiTextField", :text).first, "Username is not prefilled")
  end

  def logout_from_app
    scroll_page_and_assert_text(@@log_out_text)

    touch($g_query_txt+"marked:'#{@@log_out_text}'")
    assert_wait_for_text(@@my_account_logout_title)

    assert_text_present(@@my_account_logout_title)
    assert_text_present(@@logout_confirm)
    assert_text_present(@@my_account_logout_no)
    sleep 1
    touch("button marked:'#{@@logout_confirm}'")
    sleep 4
  end


  def click_on_logout_button
    scroll_page_and_assert_text(@@log_out_text)
    touch($g_query_txt+"marked:'#{@@log_out_text}'")
    assert_wait_for_text(@@my_account_logout_title)
  end

  def verify_logout_popup
    assert_wait_for_text(@@my_account_logout_title)
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
        scroll_page_and_assert_text(@@my_account_change_password)
      when "newsletter"
        scroll_page_and_assert_text(@@my_account_newsletter_text)
      when "logout"
        scroll_page_and_assert_text(@@log_out_text)
    end
  end

  def click_booking_biscuit
    scroll_view("right", 2) if !(check_acc_label @@booking_active_biscuit)
    touch($g_query_txt+"marked:'#{@@booking_active_biscuit}'")
  end

  def check_booking_biscuit_loaded
    assert_wait_for_acc(@@holiday_message_minus_548)
  end

  def verify_booking_biscuit_loaded
    assert_wait_for_text(@@weather_country)
  end

  def select_add_booking
    click_on_text @@add_a_booking_page_find_booking_button
  end

  def click_browse_holidays
    click_on_text @@browse_banner
  end

  def verify_browse_holidays
    assert_wait_for_text @@login_tablet_bottom_bar
    @@tui_holidays_arr.each { |var| assert_wait_for_text var }
  end
end

