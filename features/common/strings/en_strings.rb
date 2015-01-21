# encoding: UTF-8

module EN_Strings
  def set_en_strings
    puts "*******  setting #{ENV['TESTENV']} strings ********"
    welcome_page_strings
    login_page_strings
    loading_strings
    side_panel_strings
    checklist_strings
    booking_summary_strings
    contact_us_strings
    weather_page_strings
    test_data
    travel_money_strings
    countdown_strings
    flights_strings
    flight_details_strings
    excursions_strings
    help_logging_in
    retrieve_booking_ref
    post_holiday_strings
    good_to_know_strings
    phone_welcome_strings
    search_book_strings
    sign_up_offers
  end

  def self.included(receiver)
    puts self.name+"::#{$g_hw_module}"
    receiver.send :include, Module.const_get(self.name+"::#{$g_hw_module}")
  end

  module Phone
    @@visionShopNumber_acc = "bookingReference1"
    @@visionBookingRef_acc = "bookingReference2"

  end

  module Tablet
    @@visionShopNumber_acc = "visionShopNumber"
    @@visionBookingRef_acc = "visionBookingRef"

    @@login_error_banner = "Sorry"
  end

  #All test data for different appication is in here
  def test_data
    $g_booking_data_file= 'features/z_dump/test_data/Bookings.xlsx'
  end

  def retrieve_booking_ref
    @@welcome_help_retrieve_booking_header = get_localized_string "welcome_help_retrieve_booking_header" # Retrieve my booking reference number
    @@welcome_help_retrieve_booking_body = get_localized_string "welcome_help_retrieve_booking_body" # We’ll send your booking reference number by email

    @@welcome_help_retrieve_booking_surname = get_localized_string "welcome_help_retrieve_booking_surname" # Surname of lead passenger:
    @@welcome_help_retrieve_booking_email = get_localized_string "welcome_help_retrieve_booking_email" # Email address used for booking:

    @@welcome_help_retrieve_booking_cta = get_localized_string "welcome_help_retrieve_booking_cta" # Submit
    @@welcome_help_i_need_help= get_localized_string "i_need_help"

    @@welcome_help_retrieve_booking_email_extra = get_localized_string "welcome_help_retrieve_booking_email_extra" # Please use the email address you provided when booking your holiday, as detailed on your invoice.
    @@welcome_help_retrieve_booking_email_hint = get_localized_string "welcome_help_retrieve_booking_email_hint" # Enter email address
    @@welcome_help_retrieve_booking_error = get_localized_string "welcome_help_retrieve_booking_error" # Sorry, we didn't recognise your details.
    @@welcome_help_retrieve_booking_success = get_localized_string "welcome_help_retrieve_booking_success"
    @@welcome_help_retrieve_booking_ref_validation = get_localized_string "welcome_help_retrieve_booking_ref_validation" # The first part of your booking reference number must be 4 numbers long. The second set can be between 4 and 8 numbers long.
    @@welcome_help_retrieve_booking_surname_extra = get_localized_string "welcome_help_retrieve_booking_surname_extra" # Please use the surname of the person that booked your holiday, as detailed on your invoice.
    @@welcome_help_retrieve_booking_surname_hint = get_localized_string "welcome_help_retrieve_booking_surname_hint" # Enter surname


  end

  def excursions_strings
    @@excursions_title= get_localized_string "excursions" #"Utflykter"
    @@side_panel_link=get_localized_string "excursions" #"Utflykter"

    @@experience_the_country= get_localized_string "experience_the_country" # Time to explore
    @@experience_the_country_subtitle= get_localized_string "experience_the_country_subtitle" # With First Choice Excursions
    @@excursions_here_available= get_localized_string "excursions_here_available" # Excursions available:

    @@excursions_overviewTitle= get_localized_string "excursions_overviewTitle" # Overview
    @@plan_your_excursions= get_localized_string "plan_your_excursions" # Plan your excursions
    @@share_my_excursion= get_localized_string "share_my_excursion" # Share this excursion
  end

  def flight_details_strings
    @@flight_details_title= get_localized_capitalized_string "flights" if $g_current_app=="EN_FC"
    @@flight_details_title= get_localized_string "flights" if $g_current_app=="EN_TH"
  end

  def countdown_strings
    @@countdown_page_title=get_localized_capitalized_string "countdown_header" if $g_current_app=="EN_FC"
    @@countdown_page_title=get_localized_string "countdown_header" if $g_current_app=="EN_TH"
  end

  def flights_strings
    @@flight_page_title=get_localized_string "flight"
    @@flights_page_title=get_localized_string "flights" if $g_current_app=="EN_TH"
    @@flights_page_title=get_localized_capitalized_string "flights" if $g_current_app=="EN_FC"
    @@flight_details_flight_number= get_localized_string "flight_number"
  end

  def welcome_page_strings

  end

  def login_page_strings

    @@welcome_help_cant_login_iosStore = get_localized_string "welcome_help_cant_login_iosStore"

    if $g_tablet
      @@welcome_login_surname_hint = get_localized_string "welcome_login_surname_hint" # Enter surname
      @@welcome_login_departure_date = get_localized_string "welcome_login_departure_date" # Departure date:
      @@welcome_login_booking_reference2_hint = get_localized_string "welcome_login_booking_reference2_hint" # 12345678
      @@welcome_login_booking_reference1_hint = get_localized_string "welcome_login_booking_reference1_hint" # 1234
      @@submit_button= get_localized_capitalized_string "submit" #Submit
      @@welcome_help_link1=get_localized_string "welcome_help_link1"
      @@login_welcome= get_localized_string "login_welcome" #Willkommen
      @@login_page_title = get_localized_string "welcome_header"
    elsif $g_phone
      @@welcome_login_surname=get_localized_string "welcome_login_surname" #"Surname of lead passenger:"
      @@welcome_login_departure_date=get_localized_string "welcome_login_departure_date" #"Departure date:"
      @@welcome_login_booking_reference=get_localized_string "welcome_login_booking_reference"
      @@welcome_login_booking_reference_extra=get_localized_string "welcome_login_booking_reference_extra"
      @@welcome_cta_help_login=get_localized_string "welcome_cta_help_login" #"Help logging in"
      @@login_welcome= get_localized_string "welcome_cta_login" #Log in
      @@welcome_header = get_localized_string "welcome_header"
      @@login_page_title = get_localized_string "welcome_cta_login"
      @@submit_button= get_localized_string "submit" #Submit

    end

    @@login_page_text = $g_phone ? get_localized_string("welcome_login_header") : "HAVE A BOOKING, LETS LOGIN"
    @@login_button=get_localized_string "welcome_login_cta_login" #"Log in"
    @@welcome_help_link2=get_localized_string "welcome_help_link2" #"Retrieve a booking reference number"

    @@login_page_help_logging_in=get_localized_string "welcome_cta_help_login"

    @@help_logging_text=get_localized_string "welcome_help_cant_login_description"
    @@login_error_text=get_localized_string "welcome_login_credential_error"
    @@login_error2_text=get_localized_string "welcome_login_error"

    @@login_error_booking_ref=get_localized_string "welcome_login_booking_reference_extra" if $g_current_app=="EN_TH"
    @@login_error_booking_ref='Tip: You should have received this number in an email a few days after you booked your holiday. It looks like this: 1234/567891. The number of digits may vary.' if $g_current_app=="EN_FC"
    @@login_error_departure_date=get_localized_string "welcome_login_departure_date_extra"
    @@login_error_surname=get_localized_string "welcome_login_surname_extra"


    #Book a visit page
    @@book_visit_header = get_localized_string "welcome_help_no_holiday_find_holiday_header"
    @@book_visit_holiday_blue_text = get_localized_string "welcome_book_holiday_blue_village_text"
    @@book_visit_find_holiday_header = get_localized_string "welcome_help_no_holiday_find_holiday_header"
    @@book_visit_no_holiday_header = get_localized_string "welcome_help_no_holiday_header"
    @@book_visit_no_holiday_body = get_localized_string "welcome_help_no_holiday_body"
    @@book_visit_no_holiday_take_tour_cta = get_localized_string "welcome_help_no_holiday_take_tour_cta"
    @@book_visit_no_holiday_call_cta = get_localized_string "welcome_help_no_holiday_call_cta"
  end

  def help_logging_in
    @@welcome_help_cant_login_header = get_localized_string "welcome_help_cant_login_header" # Help logging in
    @@welcome_help_cant_login_description = get_localized_string "welcome_help_cant_login_description" # You can log in to the MyThomson app 3-4 days

    @@welcome_help_cant_login_subtitle = get_localized_string "welcome_help_cant_login_subtitle" # To log in you'll need:
    @@welcome_help_cant_login_cta = get_localized_string "welcome_help_cant_login_cta" # Retrieve a booking reference number

    @@welcome_help_cant_login_iosStore = get_localized_string "welcome_help_cant_login_iosStore" # Download MyFirstChoice app
    @@welcome_help_cant_use_app_cta1 = get_localized_string "welcome_help_cant_use_app_cta1" # Thomson Cruises – my.thomson.co.uk
    @@welcome_help_cant_use_app_cta2 = get_localized_string "welcome_help_cant_use_app_cta2" # First Choice – my.firstchoice.co.uk

    @@welcome_help_more_issues_body = get_localized_string "welcome_help_more_issues_body" # If you’re still having problems logging in
    @@welcome_help_more_issues_email_title = get_localized_string "welcome_help_more_issues_email_title" # Send email
  end

  def travel_money_strings
    @@currency_title1='Currency'
    @@currency_subTitle1='0% commission on your holiday money'
    @@currency_title2='Travel Money Card'
    @@currency_subTitle2='Carry your cash on a prepaid card'
    @@currency_title3='Currency converter'

    #Currency page
    @@foreigncurrency_detail_nav_title= get_localized_string "foreigncurrency_detail_nav_title" #Currency

    @@foreigncurrency_detail_title= get_localized_string "foreigncurrency_detail_title" #Cash in your pocket
    @@foreigncurrency_detail_intro= get_localized_string "foreigncurrency_detail_intro" #Pop in to your local Thomson travel shop to get 0% commission on all foreign currency, along with:
    @@foreigncurrency_detail_reasons= get_localized_string "foreigncurrency_detail_reasons" #Competitive rates::No last-minute airport prices::A range of currencies and travellers' cheques

    @@foreigncurrency_detail_rate_title= get_localized_string "foreigncurrency_detail_rate_title" #Most recent rate:
    @@foreigncurrency_detail_rate_date= "Updated "

    @@foreigncurrency_detail_book_online= get_localized_string "foreigncurrency_detail_book_online" #Book Online
    @@foreigncurrency_detail_find_shop= get_localized_string "foreigncurrency_detail_find_shop" #Find a shop

    @@money_on_card=get_localized_string "travel_money_card"
    @@travel_money_card_benefits= "Get a Thomson Prepaid Travel Money MasterCard® at your local Thomson travel shop to enjoy these great benefits:"
    @@travel_money_card_benefits1= "Free to use in shops and restaurants"
    @@travel_money_card_benefits2 = "A convenient way of taking your money abroad"
    @@travel_money_card_benefits3 = "Can be reloaded again and again"
  end

  def side_panel_strings
    @@to_do_lists= get_localized_string "my_todo_list"
    @@home=get_localized_string "home" #"Home"
    if $g_phone
      @@side_panel_countdown=get_localized_string "holiday_countdown"
      @@side_panel_booking_summary=get_localized_string "booking_summary" #"Holiday summary"
      @@side_panel_destination= get_localized_string "destination"
    elsif $g_tablet
      @@side_panel_countdown=get_localized_string "countdown"
      @@side_panel_booking_summary="Holiday Summary" #
      @@side_panel_destination= "Destination Guide" #get_localized_string "destination"

    end
    @@holiday_checklist=get_localized_string "holiday_checklist" #"Holiday checklist"
    @@holiday_checklists=get_localized_string "holiday_checklists" #"Holiday checklists"
    @@side_panel_weather=get_localized_string "weather" #"Weather"
    @@side_panel_flight=get_localized_string "flight" #"Flight"
    @@side_panel_flights=get_localized_string "flights" #"Flights"
    @@side_panel_hotel=get_localized_string "hotel_and_resort" #"Hotel and resort"
    @@destination=get_localized_string "destination" #"Destination"
    @@getting_to_the_airport=get_localized_string "getting_to_the_airport" #"Getting to the airport"
    @@holiday_extras=get_localized_string "extras_title"
    @@app_feedback=get_localized_string "app_feedback"
                                       #@@side_panel_app_feedback = "App Feedback"
    @@travel_money=get_localized_string "travel_money" #"Travel money"
    @@important_information="Important Information" #get_localized_string "important_information" #"Important information"
    @@side_panel_contact_us=get_localized_string "contact_us" #"Contact us"
    @@side_panel_contact=get_localized_string "contact" #"Contact"

    @@guide_online = get_localized_string "guide_online_biscuit_title"

    @@side_panel_excursions=get_localized_string "excursions" #"Excursions"
    @@side_panel_currency= get_localized_string "currency_offcanvas"
    @@log_out_text=get_localized_string "logout" #"Log out"
    @@logout_confirm=get_localized_string "confirm" # yes

    @@excursions=get_localized_string "excursions"
    @@browse_banner = get_localized_string "browse_banner"

    @@side_panel_extra=get_localized_string "extra"
    @@side_panel_extras=get_localized_string "extras"
  end

  def booking_summary_strings
    @@booking_summary_title=get_localized_string "booking_summary" if $g_current_app=="EN_TH"
    @@booking_summary_title= get_localized_capitalized_string "booking_summary" if $g_current_app=="EN_FC"
    @@bookingSummary_bookingReference=get_localized_string "bookingSummary_bookingReference" #"Booking reference number:"
    @@bookingSummary_quote=get_localized_string "bookingSummary_quote" #"You'll need this number if you contact us with any questions."
    @@bookingSummary_flighthotelRefNumber=get_localized_string "bookingSummary_flighthotelRefNumber" #"Flight and hotel reference number:"
    @@bookingSummary_flighthotelRefNumberQuote=get_localized_string "bookingSummary_flighthotelRefNumberQuote" #"You’ll need this number to book an extra for your holiday."
    @@bookingSummary_leadPassenger=get_localized_string "bookingSummary_leadPassenger" #"Lead Passenger:"
    @@bookingSummary_flightsNotReadyTitle=get_localized_string "bookingSummary_flightsNotReadyTitle" #"Your flights aren’t ready yet"
    @@bookingSummary_flightsNotReadyText=get_localized_string "bookingSummary_flightsNotReadyText" #"Your flights are confirmed six weeks before you depart. When they’re ready, we’ll display your full flight details here."
    @@bookingSummary_emailDescription=get_localized_string "bookingSummary_emailDescription" #"Send your full holiday summary to yourself or other passengers."
    @@bookingSummary_emailTitle=get_localized_string "bookingSummary_emailTitle" #"Email my booking details"
  end

  def weather_page_strings
    @@weather_page_title=get_localized_string "weather_header" #"Weather"
    @@weather_page_title=get_localized_capitalized_string "weather_header" if $g_current_app=="EN_FC" && $g_phone #"Weather"
    @@share_weather=get_localized_string "weather_share" #"Share the weather"
  end

  def contact_us_strings
    @@contact_us_title=get_localized_string "contactus_title" #"Need some help?"
    @@contactus_subtitle=get_localized_string "contactus_subtitle" #"Get in touch"

    @@contact_us_shop_opening_times="Call centre opening times:"
    @@contactus_termsAndConditions=get_localized_string "contactus_termsAndConditions" # Terms and conditions
    @@contactus_privacyPolicy=get_localized_string "contactus_privacyPolicy" #"Privacy policy"
    @@contactus_support=get_localized_string "contactus_support" #"MyThomson support"

    @@contactus_manageBookingsCTA=get_localized_string("contactus_manageBookingsCTA") # Manage my Booking
    @@contactus_manageBookingsTitle=get_localized_string("contactus_manageBookingsTitle") # Manage my Booking

    @@contactus_specialEnquiriesCTA=get_localized_string("contactus_specialEnquiriesCTA") # Find out more
    @@contactus_specialEnquiriesTitle=get_localized_string("contactus_specialEnquiriesTitle") # Special enquiries

    if $g_phone
      @@contact_us_contact_title=get_localized_string "contactus_navbar" if $g_current_app=="EN_TH" #"Contact us"
      @@contact_us_contact_title=get_localized_capitalized_string "contactus_navbar" if $g_current_app=="EN_FC" #"Contact us"
      @@contact_us_address="17 Market Walk Chorley Lancashire PR7 1 DE"
      @@contact_us_travel_shop="If you have any questions about your booking, just contact your local Thomson travel shop."
      @@postholiday_emailus=get_localized_string "postholiday_emailus" #"Email us"
      @@contactus_call_us=(get_localized_string "contactus_flightCTA").gsub('[number]', '') #"Call us on [number]"
    elsif $g_tablet
      @@contact_us_contact_title = get_localized_string "contact"
      @@contact_us_email_us_webview= "Have you booked your holiday"
      @@contact_us_manage_booking_webview= "Manage My Booking"
      @@contact_us_findout_more_webview= "Find out more"
      @@contact_us_terms_webview= "Terms and Conditions"
      @@contact_us_privacy_webview= "Privacy Policy"
    end

    if $g_thomson_app
      @@call_center_opening_txt= "Call centre opening times:"

    else
      @@call_center_opening_txt= "Shop opening times: "
    end

    @@call_center_days= ["Monday",
                         "Tuesday",
                         "Wednesday",
                         "Thursday",
                         "Friday",
                         "Saturday",
                         "Sunday"]

  end

  def checklist_strings
    @@packaging_item_title = "pack 1 item"
    @@delete_item =get_localized_string "delete_item"
    @@delete =get_localized_string "delete"
    @@are_you_sure= get_localized_string "are_you_sure"
    @@cancel = get_localized_string "cancel"

    @@holiday_checklist_start_packing_list = get_localized_string "holiday_checklist_start_packing_list"
    @@check_list_item_text_acc = "to_text"
    @@check_list_check_box_acc = "checkBox"
    @@check_list_selected_items_acc = "completedItems"
    @@check_list_email_items=get_localized_string "email_items"
    @@my_packaging_list=(get_localized_string "my_packing_list").strip.gsub(/\n/, ' ')
    @@my_do_list=get_localized_string "my_todo_list"
    @@checklist_completed_title=get_localized_string("checklist_completed_title").gsub('([REPLACE])', '') #"View completed items ([REPLACE])"
    @@checklist_hidden_title=get_localized_string("checklist_hidden_title").gsub('([REPLACE])', '') #"Hide completed items ([REPLACE])"
  end

  def post_holiday_strings
    @@home_page_post_holiday_title=get_localized_string "postholiday_title"
    @@home_page_post_holiday_popup_alert_content=get_localized_string "postholiday_alert"
    @@home_page_post_holiday_popup_alert_ok=get_localized_string "ok"
    #@@home_page_post_holiday_number_text=get_localized_string "postholiday_telephone_no"
    @@home_page_post_holiday_need_help_text=get_localized_string "postholiday_needhelp"
    @@home_page_post_holiday_need_help_content_text=get_localized_string "postholiday_needhelp_sub"
    @@home_page_post_holiday_email_us_text=get_localized_string "postholiday_emailus"
    @@log_out_acc="logout"
    @@logout_confirm_two= get_localized_string "logout_confirm_two" # Are you sure you want to log out?
  end

  def good_to_know_strings
    if $g_phone
      @@good_to_know_page_title=get_localized_string "good_to_know"
    elsif $g_tablet
      @@good_to_know_page_title="Alcohol Aware"

    end
  end

  def phone_welcome_strings
    @@welcome_login_title= get_localized_string "welcome_login_title" # Have a Booking?
    @@welcome_login_subtitle= get_localized_string "welcome_login_subtitle" # Let's login
    @@welcome_nobooking_title= get_localized_string "welcome_nobooking_title" # Haven't booked?
    @@welcome_nobooking_subtitle= get_localized_string "welcome_nobooking_subtitle" # Let's get inspired
  end

  def search_book_strings
    @@search_and_book_title = "Search & Book"

    @@search_book_dest = "Destinations"
    @@search_book_discover ="Discover our world"

    @@search_book_best_for ="Best for"
    @@search_book_inspire ="Let us inspire you"

    @@search_book_search ="Search"
    @@search_book_find_holiday ="Find your holiday"

    @@search_book_our_best ="View our best"
    @@search_book_deals ="Deals"

    @@search_book_sign_up ="Sign up"
    @@search_book_latest_offers ="Get our latest offers"

    @@search_book_flights ="Flights"
    @@search_book_lets_take_you ="Let us take you there"

    @@search_book_experience ="Find your experience"
    @@search_book_Excursions ="Excursions"
  end

  def sign_up_offers
    @@email_signup_successful=get_localized_string "email_signup_successful" #Thanks for signing up. Keep an eye on your inbox for upcoming offers.
    @@email_signup_failed=get_localized_string "email_signup_failed" #Oops, looks like something went wrong. Please check your connection and try again.
    @@welcome_help_no_holiday_email_header=get_localized_string "welcome_help_no_holiday_email_header" #Sign up for offers
    @@welcome_help_no_holiday_email_body=get_localized_string "welcome_help_no_holiday_email_body" #Our top deals tailored to you, straight to your inbox.
    @@email_field_validation=get_localized_string "email_field_validation" #Please enter a valid email address
    @@firstName_field_validation=get_localized_string "firstName_field_validation" #Please enter your first name
    @@lastName_field_validation=get_localized_string "lastName_field_validation" #Please enter your last name
    @@salutation_field_validation=get_localized_string "salutation_field_validation" #Please select a salutation
    @@optin_to_emails_blurb=get_localized_string "optin_to_emails_blurb" #I would like to receive great deals and holiday news via email (Your data will not be disclosed to a third party and you can revoke consent at any time). By opting in, you agree to our privacy policy.
    @@agree_to_emails_blurb=get_localized_string "agree_to_emails_blurb" #Please read our Privacy Policy and Data Protection Notice and confirm you agree to our use of your information provided (which may in special situations include sensitive personal data) by ticking the box below.
    @@agree_to_emails=get_localized_string "agree_to_emails" #I agree
    @@welcome_help_no_holiday_email_disclaimer=get_localized_string "welcome_help_no_holiday_email_disclaimer" #By clicking 'Submit' you confirm that you have read and understood our Privacy Policy and consent to our use of your information.
  end
end





