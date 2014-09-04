module TermsConditionsModule
  module Phone
    def check_t_and_c_title
      verify_page_title @@terms_title
    end

    def check_t_and_c_page
      sleep 3
      terms_txt_from_screen=query("* css:'body>p:nth-child(1)>strong'").first["textContent"] if $g_android
      terms_txt_from_screen=query("webView css:'body>p:nth-child(1)>strong'").first["textContent"] if $g_ios
      fail("Terms webcontent not loaded") if @@de_terms_web_content_title != terms_txt_from_screen
    end
  end

  module Tablet
    def check_t_and_c_title
    end

    def check_t_and_c_page
    end

  end
  end

class TermsAndConditionsBasePage < BasePage
  include TermsConditionsModule
  include Module.const_get "TermsConditionsModule::"+$g_module

end

