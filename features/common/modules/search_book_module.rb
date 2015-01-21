require_relative 'base_module'

module SearchBookModule
  include BaseModule

  def self.included(receiver)
    puts self.name+"::#{$g_hw_module}"
    receiver.send :include, Module.const_get(self.name+"::#{$g_hw_module}")
  end


  module Phone

    def self.included(receiver)
      puts self.name+"::#{$g_lang_mod}"
      receiver.send :include, Module.const_get(self.name+"::#{$g_lang_mod}")
    end

    module Eng
      include BaseModule
      def verify_search_book_screen
        assert_wait_for_text @@search_and_book_title
      end

      def navigate_to_sign_up_for_offers
        scroll_to_row "scrollView",4
        assert_wait_for_text @@search_book_sign_up
        click_on_text @@search_book_latest_offers
      end

      def verify_sign_for_offers
        assert_wait_for_text @@welcome_help_no_holiday_email_header
        assert_wait_for_text @@welcome_help_no_holiday_email_body
      end
    end
  end
end