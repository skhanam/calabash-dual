require_relative 'base_module'

module TermsConditionsModule

  def self.included(receiver)
    puts self.name+"::#{$g_hw_module}"
    receiver.send :include, Module.const_get(self.name+"::#{$g_hw_module}")
  end

  module Phone
    include BaseModule
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
    include BaseModule
    def check_t_and_c_title
    end

    def check_t_and_c_page
    end

  end
end