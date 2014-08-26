class ForgotPasswordBasePage < BasePage

  def check_forgot_password_page
    assert_wait_for_text @@forgot_password_title
    assert_text_elements [@@forgot_password_username_or_email, @@forgot_password_send_button,
                          @@forgot_password_let_us_know_email, @@forgot_password_need_help]

  end

  def submit_change_password
    click_on_text @@forgot_password_send_button
  end

  def check_wrong_username_email
    assert_wait_for_text @@forgot_password_email_help
  end

end



