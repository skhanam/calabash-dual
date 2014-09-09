require_relative 'base_module'

module SidePanelModule
  include BaseModule

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

    def navigate_to_contact_us_page
      scroll_side_panel(@@log_out_text) if !$g_german_app
      scroll_side_panel(@@side_panel_contact_us)
      sleep 1
      touch_txt_and_verify_title(@@side_panel_contact_us, @@contact_us_contact_title)
    end

    def navigate_to_booking_summary_page
      scroll_side_panel(@@side_panel_booking_summary)
      touch_txt_and_verify_title(@@side_panel_booking_summary, @@booking_summary_title)
    end

  end

  module Tablet
    include BaseModule

    def check_email_populated(username)
      if $g_android
        fail("Email not populated") if !element_exists("ti.modules.titanium.ui.widget.TiUIText$TiEditText text:'#{username}'")
      elsif $g_ios
        fail("Email not populated") if !element_exists("fieldEditor text:'#{username}'")
      end
    end

    def navigate_to_booking_summary_page
      @@side_panel_booking_summary="Holiday Summary"
      scroll_side_panel(@@side_panel_booking_summary)
      click_on_text @@side_panel_booking_summary
      #TODO verify booking summary page
    end

    def navigate_to_contact_us_page
      scroll_side_panel(@@log_out_text) if !$g_german_app
      scroll_side_panel("Contact")
      #scroll_side_panel(@@side_panel_contact_us)
      sleep 1
      click_on_text "Contact" #TODO to change  click_on_text @@side_panel_contact_us
      #TODO verify contact us page
    end

    def check_email_field_empty
      if $g_android
        fail("Email not populated") if !element_exists("ti.modules.titanium.ui.widget.TiUIText$TiEditText text:'#{@@email_hint_text}'")
      elsif $g_ios
        fail("Email not empty") if !element_exists("label text:'#{@@email_hint_text}'")
      end
    end
  end


  module Eng
    include BaseModule

    def verify_side_panel_strings
      scroll_side_panel_and_assert @@home
      scroll_side_panel_and_assert @@side_panel_booking_summary
      scroll_side_panel_and_assert @@side_panel_countdown
      begin
        scroll_side_panel_and_assert @@holiday_checklist
      rescue
        scroll_side_panel_and_assert @@holiday_checklists
      end
      scroll_side_panel_and_assert @@side_panel_weather
      begin
        scroll_side_panel_and_assert @@side_panel_flight
      rescue
        scroll_page_and_assert_text(@@side_panel_flights,"up")
      end
      scroll_side_panel_and_assert @@side_panel_hotel
      scroll_side_panel_and_assert @@destination
      scroll_side_panel_and_assert @@getting_to_the_airport
      scroll_side_panel_and_assert @@holiday_extras
      scroll_side_panel_and_assert @@app_feedback
      scroll_side_panel_and_assert @@travel_money
      scroll_side_panel_and_assert @@important_information
      scroll_side_panel_and_assert @@app_feedback
      scroll_side_panel_and_assert @@side_panel_contact_us
      check_sidepanel_based_on_bookings
      scroll_side_panel_and_assert @@log_out_text
    end
  end

  module Deu
    include BaseModule

    def navigate_to_TandC_page
      scroll_side_panel(@@side_panel_TandC)
      touch_txt_and_verify_title @@side_panel_TandC, @@tui_service_terms_text
    end

    def navigate_to_hotel(num=1)
      scroll_page_and_assert_text @@side_panel_hotel
      touch "#{$g_query_txt}text:'#{@@side_panel_hotel}' index:#{num.to_i-1}"
      sleep 3
    end

    def navigate_to_insurance_page
      scroll_page_and_assert_text(@@side_panel_insurance, "down")
      touch_txt_and_verify_title @@side_panel_insurance, @@insurance_title
    end

    def navigate_to_my_tour_guide
      scroll_page_and_assert_text(@@side_panel_my_tour_guide, "down")
      touch_txt_and_verify_title @@side_panel_my_tour_guide, @@my_tour_guide_text
    end

    def validate_typical_booking_menu_items(var)
      puts "validate_typical_booking_menu_items (#{var})"
      case var
        when "Countdown"
          scroll_page_and_assert_text @@side_panel_countdown
        when "My Booking"
          scroll_page_and_assert_text UnicodeUtils.upcase(@@side_panel_my_booking)
        when "Booking summary"
          scroll_page_and_assert_text @@side_panel_booking_summary
        when "Flights"
          check_side_panel("flight", 2) # 2 flights
        when "Hotel"
          check_side_panel("hotel", 2) # 2 hotels
        when "Insurance"
          check_side_panel("insurance", 1) # 1 insurance
        when "Extra"
          check_side_panel("extra", 1) # 2 extras
        when "Weather"
          scroll_page_and_assert_text @@side_panel_weather
        when "Destination guide"
          scroll_page_and_assert_text @@side_panel_destination_guide
        when "excursions"
          scroll_page_and_assert_text @@side_panel_excursions
        when "Good to know"
          scroll_page_and_assert_text @@side_panel_good_to_know
        when "Kontakt heading"
          scroll_page_and_assert_text UnicodeUtils.upcase(@@side_panel_contact_heading)
        when "Kontakt"
          scroll_page_and_assert_text @@side_panel_contact_us
        when "My travel agent"
          scroll_page_and_assert_text @@side_panel_travel_agent
        when "TUI onsite service"
          scroll_page_and_assert_text @@side_panel_tui_service_on_site

      end
    end


    def tui_service_onsite_from_sidepanel
      scroll_side_panel @@contact_us_contact_tui_service
      touch_txt_and_verify_title(@@contact_us_contact_tui_service,@@tui_service_title)
    end

    def verify_elements_for_typical_booking
      assert_wait_for_text @@side_panel_booking_summary
      res=$g_booking.get_all_products_for_booking

      res.uniq.each do |var|
        count=res.count(var)
        check_side_panel(var)
      end
    end


    def navigate_to_travel_agent_page
      scroll_side_panel(@@side_panel_travel_agent)
      touch_txt_and_verify_title(@@side_panel_travel_agent,@@my_travel_agent_title)
    end

    def navigate_to_good_to_know_page
      scroll_side_panel(@@side_panel_good_to_know)
      touch_txt_and_verify_title(@@side_panel_good_to_know, @@good_to_know_page_title)
    end

    def check_side_panel(var, count=1)
      case var
        when "flight"
          assert_wait_for_text @@side_panel_flight if count==1
          assert_wait_for_text @@side_panel_flights if count>1
        when "extra"
          if (check_text_in_view @@side_panel_extra) != true
            assert_wait_for_text @@side_panel_extras
          end
        #assert_wait_for_text @@side_panel_extra if count==1
        #assert_wait_for_text @@side_panel_extras if count>1
        when "hotel"
          assert_wait_for_text @@side_panel_hotel if count==1
          assert_wait_for_text @@side_panel_hotels if count>1
        when "insurance"
          assert_wait_for_text @@side_panel_insurance if count==1
          assert_wait_for_text @@side_panel_insurances if count>1
        when "transfer"
          assert_wait_for_text @@side_panel_transfer
        else
          fail "product type not verified:#{var}:"
      end
    end
  end

  module Nor
    include BaseModule

    def verify_side_panel_strings
      scroll_side_panel_and_assert @@home
      scroll_side_panel_and_assert @@side_panel_booking_summary
      scroll_side_panel_and_assert @@side_panel_countdown
      scroll_side_panel_and_assert @@side_panel_weather
      begin
        scroll_side_panel_and_assert @@side_panel_flight
      rescue
        scroll_side_panel_and_assert @@side_panel_flights
      end
      scroll_side_panel_and_assert @@side_panel_hotel
      scroll_side_panel_and_assert @@destination
      scroll_side_panel_and_assert @@duty_free

      check_sidepanel_based_on_bookings
      scroll_side_panel_and_assert @@guide_online
      scroll_side_panel_and_assert @@app_feed_back
      scroll_side_panel_and_assert @@side_panel_contact_us
      scroll_side_panel_and_assert @@log_out_text
      # excursion

    end

  end

end
