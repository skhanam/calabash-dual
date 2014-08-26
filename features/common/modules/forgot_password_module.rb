require_relative 'base_module'
module ForgotPwdModule
  include BaseModule

  module Phone
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
  end

  module Tablet
    def check_email_populated(username)
    end

    def check_email_field_empty
      if $g_android
      elsif $g_ios
      end
    end
  end
end
