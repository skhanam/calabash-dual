require_relative '../Default/login_base_page'
require_relative '../../ios/modules/login_module' if $g_ios
require_relative '../../android/modules/login_module'  if $g_android

module Tablet

end


module Phone
end

class LoginPage < LoginBasePage
  include LoginModule
  include LoginModule::Deu
  include Module.const_get "#{$g_hw_module}"

  def check_login_title
    assert_wait_for_text @@login_welcome
  end


  def verify_login_page
    assert_wait_for_text @@login_page_text
    assert_text_present @@email_text
    assert_text_present @@password_text
    scroll_page_and_assert_text @@login_forgot_password
    assert_text_present @@login_forgot_password
    assert_text_present @@login_button
    wait_for_partial_text_shown @@password_reset
  end

  def check_login_error_messages
    assert_wait_for_text @@general_login_error
  end


  def check_buttons
    scroll_page_and_assert_text @@login_forgot_password
    assert_text_present @@login_forgot_password
    scroll_page_and_assert_text UnicodeUtils.upcase(@@new_user_registration_register)
    scroll_page_and_assert_text @@new_user_registration_need_help
  end

  def click_register_button
    click_on_text UnicodeUtils.upcase @@new_user_registration_register
  end

  def check_alternate_country

  end

end
