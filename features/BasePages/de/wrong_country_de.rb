require_relative '../base_page'
require_relative '../../common/modules/base_module'

module WrongCountryModule

  module Phone
    include BaseModule

    def check_wrong_country_screen
      fail("TODO")
    end

    def new_user_reg_screen
      fail("TODO")
    end
  end

  module Tablet
    include BaseModule

    def new_user_reg_screen
      scroll("view text:'#{@@add_a_booking_page_firstname}' parent scrollView","down")
      #scroll_page_and_assert_text
      check_text_in_modal_view(@@add_a_booking_page_salutation)
      check_text_in_modal_view(@@add_a_booking_page_firstname)
      check_text_in_modal_view(@@add_a_booking_page_last_name_hint)
      check_text_in_modal_view(@@add_a_booking_page_booking_code_hint)
      check_text_in_modal_view(@@add_a_booking_page_arrival_date_hint)
    end

    def check_wrong_country_screen
      assert_wait_for_text @@wrong_country_selected_text
      assert_text_present @@wrong_country_switch
    end

    def submit_country_details
      sleep 2
      click_on_text @@wrong_country_switch
      sleep 5
    end
  end
end

class WrongCountryPage < BasePage
  include Module.const_get "WrongCountryModule::"+$g_hw_module

end

