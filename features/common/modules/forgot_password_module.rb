require_relative 'base_module'

module ForgotPwdModule
  include BaseModule

  def check_forgot_password_page
    assert_wait_for_text @@forgot_password_title
    assert_text_elements [@@forgot_password_username_or_email, @@forgot_password_send_button,
                          @@forgot_password_let_us_know_email, @@forgot_password_need_help]
  end


  module Phone
    include BaseModule

    def check_email_populated(username)
      assert_wait_for_text(username)
    end

    def check_email_field_empty
      txt=query("all TiEditText index:1", :text).first if $g_android
      txt=query("textField index:0", :text).first if $g_ios
      fail "username field is not empty" if txt !=""
    end

    def check_wrong_username_email
      assert_wait_for_text @@forgot_password_email_help
    end

    def submit_change_password
      click_on_text @@forgot_password_send_button
    end

  end

  module Tablet
    include BaseModule

    def submit_change_password
      sleep 1
      touch "view marked:'modalView' label text:'#{UnicodeUtils.upcase(@@forgot_password_send_button)}'"
      sleep 2
    end

    def check_email_populated(username)
      if $g_android
        fail("Email not populated") if !element_exists("ti.modules.titanium.ui.widget.TiUIText$TiEditText text:'#{username}'")
      elsif $g_ios
        fail("Email is not  prepopulated") if !element_exists("fieldEditor text:'#{username}'")
      end
    end

    def check_email_field_empty
      if $g_android
        fail("Email not populated") if !element_exists("ti.modules.titanium.ui.widget.TiUIText$TiEditText text:'#{@@email_hint_text}'")
      elsif $g_ios
        sleep 2
        fail("Email not empty") if !element_exists("textFieldLabel text:'#{@@email_hint_text}'")
      end
    end

    def check_wrong_username_email
      assert_wait_for_text @@login_credentials_error
    end
  end
end
