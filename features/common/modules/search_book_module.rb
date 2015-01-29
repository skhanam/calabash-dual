require_relative 'base_module'

module SearchBookModule
  include BaseModule

  def self.included(receiver)
    puts self.name+"::#{$g_hw_module}"
    receiver.send :include, Module.const_get(self.name+"::#{$g_hw_module}")
  end


  def get_details_for_tile(row_num, tile_num)
    row_num=row_num.to_i-1
    tile_num=tile_num.to_i-1
    all_rows=$g_search_book["searchAndBook"]["listing"]["items"]
    all_tiles=all_rows[row_num.to_i]["tiles"]
    arr=[]
    all_tiles[tile_num]["labels"].each { |val2| arr.push val2["text"] }
    link=all_tiles[tile_num]["link"]
    return arr, link
  end

  def get_search_row_count
    $g_search_book["searchAndBook"]["listing"]["items"].count
  end

  def get_search_tile_count(row_num)
    row_num=row_num.to_i-1
    all_rows=$g_search_book["searchAndBook"]["listing"]["items"]
    all_rows[row_num.to_i]["tiles"].count
  end

  module Phone

    def self.included(receiver)
      puts self.name+"::#{$g_lang_mod}"
      receiver.send :include, Module.const_get(self.name+"::#{$g_lang_mod}")
    end

    module Eng
      include BaseModule

      def check_every_row_every_tile
        count=get_search_row_count.to_i
        for i in 1..count
          check_each_tile_of_row i
        end
      end

      def verify_search_book_screen
        if $g_firstchoice_app
          assert_wait_for_text @@search_and_book_title.upcase
        else
          assert_wait_for_text @@search_and_book_title
        end
        sleep 2
      end

      def check_each_tile_of_row row_num
        scroll_table_to_row row_num
        count=get_search_tile_count(row_num).to_i
        puts "Tile count #{count}"
        for num in 1..count.to_i
          arr, link=get_details_for_tile row_num, num
          puts "arr = #{arr} row_num #{row_num}, num #{num}"
          arr.each { |var| assert_wait_for_text var }
          return if count==1
          scroll_search_book_items row_num, num+1, arr.last
          sleep 1
        end
      end

      def navigate_to_sign_up_for_offers
        sleep 1
        scroll_table_to_row 5
        sleep 1
        assert_wait_for_text @@search_book_sign_up
        click_on_text @@search_book_latest_offers
      end

      def verify_sign_for_offers
        assert_wait_for_text @@welcome_help_no_holiday_email_header
        assert_wait_for_text @@welcome_help_no_holiday_email_body
      end

      def verify_sign_up_offer_title
        arr=@@salutations_to_split_by_colon.split ':'
        #arr=["Mr", "Mrs", "Ms", "Miss", "Dr"]
        for cnt in 0..arr.count-1
          val=query("pickerView", :delegate, [{pickerView: nil}, {titleForRow: "#{cnt}"}, {forComponent: 0}]).first
          fail "#{val.to_s}!=#{arr[cnt].to_s} is not shown" if  val.to_s!="#{arr[cnt].to_s}"
        end
      end

      def fill_sign_up_details
        verify_sign_up_offer_title #verify picker view table

        if $g_ios
          touch "TiTextField index:0"
          wait_for_element_exists "checkedTextView text:'Mrs'"
          touch("view:'UIPickerView' label text:'"+"Mrs"+"'")
        elsif $g_android
          touch "TiEditText index:0"
          touch "checkedTextView text:'Mrs'"
        end

        #check hint text
        touch("TiTextField index:1 label", :text).first
        keyboard_enter_text "John"
        query("TiTextField index:2 label", :text).first
        query("TiTextField index:3 label", :text).first

        click_acc_label "signupToEmailsOptIn" # Sign up to emails tick
        click_acc_label "signupToEmailsAgree" # Sign up I agree
      end


      def verify_sign_for_offers_text
        assert_wait_for_text @@welcome_help_no_holiday_email_header # Sign up for offers
        assert_wait_for_text @@signup_salutation # Title:
        assert_wait_for_text @@signup_selector # Mr
        assert_wait_for_text @@signup_first_name # First name:
        assert_wait_for_text @@signup_first_name_hint # John
        assert_wait_for_text @@signup_lastName # Last name:
        assert_wait_for_text @@signup_lastName_hint # Smith
        assert_wait_for_text @@signup_email # Email address:
        assert_wait_for_text @@signup_email_hint # example@example.com

      end

      def scroll_to_page_end
        scroll_page_and_assert_text @@signup_signup_cta # Submit
      end

      def verify_sign_for_offers_options
        scroll_page_and_assert_text @@signup_privacy_cta # Privacy policy
        assert_wait_for_text @@optin_to_emails_blurb # I would like to receive great deals and holiday news via email (Your data will not be disclosed to a third party and you can revoke consent at any time). By opting in, you agree to our privacy policy.
        assert_wait_for_text @@optin_to_emails # I would like to receive great deals and holiday news via email (Your data will not be disclosed to a third party and you can revoke consent at any time). By opting in, you agree to our privacy policy.
        assert_wait_for_text @@agree_to_emails_blurb # Please read our Privacy Policy and Data Protection Notice and confirm you agree to our use of your information provided (which may in special situations include sensitive personal data) by ticking the box below.
        assert_wait_for_text @@agree_to_emails # I agree
        assert_wait_for_text escape_quotes @@welcome_help_no_holiday_email_disclaimer # By clicking 'Submit' you confirm that you have read and understood our Privacy Policy and consent to our use of your information.
        scroll_to_page_end

        #TODO remove
        #@@welcome_help_no_holiday_email_body=get_localized_string "welcome_help_no_holiday_email_body" #Our top deals tailored to you, straight to your inbox.
        #@@email_field_validation=get_localized_string "email_field_validation" #Please enter a valid email address
        #@@firstName_field_validation=get_localized_string "firstName_field_validation" #Please enter your first name
        #@@lastName_field_validation=get_localized_string "lastName_field_validation" #Please enter your last name
        #@@salutation_field_validation=get_localized_string "salutation_field_validation" #Please select a salutation
        #@@signup_successful=get_localized_string "signup_successful"# Sign up successful
        #@@signup_unsuccessful=get_localized_string "signup_unsuccessful"# Sign up unsuccessful. Please try again
        #@@time=get_localized_string "time"# time
        #@@email_signup_successful=get_localized_string "email_signup_successful" #Thanks for signing up. Keep an eye on your inbox for upcoming offers.
        #@@email_signup_failed=get_localized_string "email_signup_failed" #Oops, looks like something went wrong. Please check your connection and try again.
      end

      def check_submit_button_enabled
        query("button index:3 parent TiUIView index:1")[0]["enabled"] if $g_ios #works only for IOS
      end
    end
  end
end


