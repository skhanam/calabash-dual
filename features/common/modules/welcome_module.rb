require_relative 'base_module'
module WelcomeModule
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

    def verify_welcome_screen
      txt = $g_german_app ? @@welcome_page_text : @@login_page_text
      assert_wait_for_text txt
    end


    module Deu
      include BaseModule

      def check_welcome_screen
        return wait_for_text(@@already_customer_title)
      end

      def navigate_to_login
        sleep 2
        CommonMethods.new.close_popup_dialog
        CommonMethods.new.close_push_notifications
        check_welcome_screen
        sleep 1
        click_on_text(@@login_with_existing_credentials)
        sleep 1
        assert_wait_for_text(@@login_page_text, 5)
      end


      def verify_welcome_page
        assert_wait_for_text @@already_customer_title
        assert_text_elements([@@already_customer_title,
                              @@already_registered,
                              @@login_with_existing_credentials,
                              @@not_yet_registered
                             ])
        sleep 2
      end

      def click_register_to_tui
        fail("TODO")
      end

      def click_not_yet_registered_with_tui
        sleep 2
        CommonMethods.new.close_popup_dialog
        CommonMethods.new.close_push_notifications

        click_on_text @@register_with_booking_code
        assert_wait_for_text @@signup_create_account
        return NewUserRegistrationBasePage.new
      end

      def check_already_registered
        assert_wait_for_text @@already_registered
        assert_wait_for_text @@login_with_existing_credentials
      end

      def check_not_registered
        assert_wait_for_text @@not_yet_registered
        assert_wait_for_text @@register_with_booking_code
      end

      def click_new_here
        scroll_page_and_assert_text @@have_never_booked_through_TUI_before
        click_on_text @@have_never_booked_through_TUI_before
        assert_wait_for_text @@new_to_tui_discover_tui
      end

      def click_already_registered
        CommonMethods.new.close_popup_dialog
        CommonMethods.new.close_push_notifications

        click_on_text @@login_with_existing_credentials
        assert_wait_for_text @@login_page_text
      end
    end

    module Eng
      include BaseModule

      def check_welcome_screen
        return check_text_in_view @@welcome_login_title
      end

      def navigate_to_login
        click_on_text @@welcome_login_title
      end

      def verify_welcome_screen
        assert_wait_for_text @@welcome_login_title
        assert_text_present @@welcome_login_subtitle
        assert_text_present @@welcome_nobooking_title
        assert_text_present @@welcome_nobooking_subtitle
      end
    end

    module Nor
      def navigate_to_login
        fail "TODO"
      end

    end
  end

  module Tablet
    include BaseModule

    def self.included(receiver)
      puts self.name+"::#{$g_lang_mod}"
      #  receiver.send :include, Module.const_get(self.name+"::#{$g_lang_mod}")
    end

    def verify_welcome_screen
      arr="#{@@login_page_text}".split(/\\n\\n/)
      arr.each do |var|
        assert_partial_text var
      end
    end

    def check_welcome_screen
      return wait_for_text(escape_quotes(@@login_lets_get_inspired), 2)
    end

  end
end