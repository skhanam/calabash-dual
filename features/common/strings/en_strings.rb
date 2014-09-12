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

    @@welcome_help_more_issues_body= get_localized_string "welcome_help_more_issues_body" # If you’re still having problems logging in
    @@welcome_help_more_issues_email_title= get_localized_string "welcome_help_more_issues_email_title" # Send email

    @@welcome_help_retrieve_booking_email_extra = get_localized_string "welcome_help_retrieve_booking_email_extra" # Please use the email address you provided when booking your holiday, as detailed on your invoice.
    @@welcome_help_retrieve_booking_email_hint = get_localized_string "welcome_help_retrieve_booking_email_hint" # Enter email address
    @@welcome_help_retrieve_booking_error = get_localized_string "welcome_help_retrieve_booking_error" # Sorry, we didn't recognise your details.
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

    #@@welcome_page_text=get_localized_string "welcome_header"
    #@@welcome_help_no_holiday_body=get_localized_string "welcome_help_no_holiday_body" #"The MyThomson app is for people who have booked a holiday directly with Thomson. To discover all of the great benefits of the MyThomson app, take a tour, then choose the perfect holiday for you."
    #@@welcome_refuse=get_localized_string "welcome_refuse" #"Sorry, you can’t use the app if:"
    #@@welcome_reasons=get_localized_string "welcome_reasons" #"You didn’t book directly with Thomson.::You’ve booked a Thomson Cruise.::You’ve booked a First Choice holiday through Thomson."
    #@@login_with_existing_credentials=get_localized_string "welcome_login_header" #"Log in"
    #@@welcome_help_link3=get_localized_string "welcome_help_link3" #"I haven’t booked a Thomson holiday"
    #@@welcome_login_surname_extra = get_localized_string "welcome_login_surname_extra"

    @@login_page_text = $g_phone ? get_localized_string("welcome_login_header") : "HAVE A BOOKING, LETS LOGIN"
    @@welcome_login_surname=get_localized_string "welcome_login_surname" #"Surname of lead passenger:"
    @@welcome_login_departure_date=get_localized_string "welcome_login_departure_date" #"Departure date:"
    @@welcome_login_booking_reference=get_localized_string "welcome_login_booking_reference"
    @@welcome_login_booking_reference_extra=get_localized_string "welcome_login_booking_reference_extra"
    @@login_button=get_localized_string "welcome_login_cta_login" #"Log in"
    @@welcome_help_link2=get_localized_string "welcome_help_link2" #"Retrieve a booking reference number"
    @@welcome_cta_help_login=get_localized_string "welcome_cta_help_login" #"Help logging in"

    @@login_page_help_logging_in=get_localized_string "welcome_cta_help_login"

    @@login_error_text=get_localized_string "welcome_login_credential_error"
    @@login_error_booking_ref=get_localized_string "welcome_login_booking_reference_extra" if $g_current_app=="EN_TH"
    @@login_error_booking_ref='Tip: You should have received this number in an email a few days after you booked your holiday. It looks like this: 1234/567891. The number of digits may vary.' if $g_current_app=="EN_FC"
    @@login_error_departure_date=get_localized_string "welcome_login_departure_date_extra"
    @@login_error_surname=get_localized_string "welcome_login_surname_extra"

    @@login_page_title = get_localized_string "welcome_login_header"

    #Book a visit page
    @@book_visit_header = get_localized_string "welcome_help_no_holiday_find_holiday_header"
    @@book_visit_holiday_blue_text = get_localized_string "welcome_book_holiday_blue_village_text"
    @@book_visit_find_holiday_header = get_localized_string "welcome_help_no_holiday_find_holiday_header"
    @@book_visit_no_holiday_header = get_localized_string "welcome_help_no_holiday_header"
    @@book_visit_no_holiday_body = get_localized_string "welcome_help_no_holiday_body"
    @@book_visit_no_holiday_take_tour_cta = get_localized_string "welcome_help_no_holiday_take_tour_cta"
    @@book_visit_no_holiday_call_cta = get_localized_string "welcome_help_no_holiday_call_cta"

    @@help_logging_text=get_localized_string "welcome_help_cant_login_description"
    @@login_error_text=get_localized_string "welcome_login_credential_error"
    @@login_error2_text=get_localized_string "welcome_login_error"
    @@login_error_departure_date=get_localized_string "welcome_login_departure_date_extra"
    @@login_error_surname=get_localized_string "welcome_login_surname_extra"

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
    @@side_panel_booking_summary=get_localized_string "holiday_summary" #"Holiday summary"
    @@side_panel_countdown=get_localized_string "holiday_countdown" #"Holiday countdown"
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
    @@travel_money=get_localized_string "travel_money" #"Travel money"
    @@important_information=get_localized_string "important_information" #"Important information"
    @@side_panel_contact_us=get_localized_string "contact_us" #"Contact us"

    @@guide_online = get_localized_string "guide_online_biscuit_title"

    @@side_panel_excursions=get_localized_string "excursions" #"Excursions"
    @@side_panel_destination=get_localized_string "destination"

    @@log_out_text=get_localized_string "logout" #"Log out"
    @@logout_confirm=get_localized_string "confirm" # yes

    @@excursions=get_localized_string "excursions"
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
    @@weather_page_title=get_localized_capitalized_string "weather_header" if $g_current_app=="EN_FC" #"Weather"
    @@weather_page_title=get_localized_string "weather_header" if $g_current_app=="EN_TH" #"Weather"
    @@share_weather=get_localized_string "weather_share" #"Share the weather"
  end

  def contact_us_strings
    @@contact_us_contact_title=get_localized_string "contactus_navbar" if $g_current_app=="EN_TH" #"Contact us"
    @@contact_us_contact_title=get_localized_capitalized_string "contactus_navbar" if $g_current_app=="EN_FC" #"Contact us"
    @@contact_us_address="17 Market Walk Chorley Lancashire PR7 1 DE"
    @@contact_us_title=get_localized_string "contactus_title" #"Need some help?"
    @@contactus_subtitle=get_localized_string "contactus_subtitle" #"Get in touch"
    @@contact_us_travel_shop="If you have any questions about your booking, just contact your local Thomson travel shop."
    @@postholiday_emailus=get_localized_string "postholiday_emailus" #"Email us"
    @@contactus_call_us=(get_localized_string "contactus_flightCTA").gsub('[number]', '') #"Call us on [number]"
    @@contact_us_shop_opening_times="Call centre opening times:"
    @@contactus_termsAndConditions=get_localized_string "contactus_termsAndConditions"
    @@contactus_privacyPolicy=get_localized_string "contactus_privacyPolicy" #"Privacy policy"
    @@contactus_support=get_localized_string "contactus_support" #"MyThomson support"

  end


  def checklist_strings
    @@packaging_item_title = "pack 1 item"
    @@delete_item =get_localized_string "delete_item"
    @@delete =get_localized_string "delete"
    @@are_you_sure= get_localized_string "are_you_sure"
    @@cancel = get_localized_string "cancel"

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
    @@home_page_post_holiday_popup_title=get_localized_string "postholiday_alert_title"
    @@home_page_post_holiday_popup_alert_content=get_localized_string "postholiday_alert"
  end

end


