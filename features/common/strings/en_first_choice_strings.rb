# encoding: UTF-8

module EN_FirstChoiceStrings

  def set_firstchoice_strings
    puts "******* thomson setting strings ********"
    welcome_page_strings
    login_page_strings
    #home_page_strings
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
  end

  #All test data for different appication is in here
  def test_data
    $g_booking_data= 'features/z_dump/test_data/Bookings.xlsx'
  end

  def countdown_strings
    @@countdown_page_title=get_localized_capitalized_string "countdown_header"
  end

  def flights_strings
    @@flight_page_title=get_localized_string "flight"
    @@flights_page_title=get_localized_capitalized_string "flights"
  end

  def welcome_page_strings
    @@welcome_page_text=get_localized_string "welcome_header"
    @@welcome_help_no_holiday_body=get_localized_string "welcome_help_no_holiday_body" #"The MyThomson app is for people who have booked a holiday directly with Thomson. To discover all of the great benefits of the MyThomson app, take a tour, then choose the perfect holiday for you."
    @@welcome_refuse=get_localized_string "welcome_refuse" #"Sorry, you can’t use the app if:"
    @@welcome_reasons=get_localized_string "welcome_reasons" #"You didn’t book directly with Thomson.::You’ve booked a Thomson Cruise.::You’ve booked a First Choice holiday through Thomson."
    @@login_with_existing_credentials=get_localized_string "welcome_login_header" #"Log in"
    @@welcome_help_link3=get_localized_string "welcome_help_link3" #"I haven’t booked a Thomson holiday"
end

  def login_page_strings
    @@login_page_text = get_localized_string "welcome_login_header"
    @@welcome_login_surname=get_localized_string "welcome_login_surname" #"Surname of lead passenger:"
    @@welcome_login_departure_date=get_localized_string "welcome_login_departure_date" #"Departure date:"
    @@welcome_login_booking_reference_extra=get_localized_string "welcome_login_booking_reference_extra" #"welcome_login_booking_reference_extra"
    @@login_button=get_localized_string "welcome_login_cta_login" #"Log in"
    @@welcome_help_cant_login_cta=get_localized_string "welcome_help_cant_login_cta" #"Retrieve a booking reference number"
    @@welcome_cta_help_login=get_localized_string "welcome_cta_help_login" #"Help logging in"

    @@login_error_text=get_localized_string "welcome_login_credential_error"
    @@login_error_booking_ref=get_localized_string "welcome_login_booking_reference_extra"
    @@login_error_departure_date=get_localized_string "welcome_login_departure_date_extra"
    @@login_error_surname=get_localized_string "welcome_login_surname_extra"
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
    @@foreigncurrency_detail_rate_date= "Updated at"

    @@foreigncurrency_detail_book_online= get_localized_string "foreigncurrency_detail_book_online" #Book Online
    @@foreigncurrency_detail_find_shop= get_localized_string "foreigncurrency_detail_find_shop" #Find a shop

    @@money_on_card=get_localized_string "travel_money_card"
    @@travel_money_card_benefits= "Get a Thomson Prepaid Travel Money MasterCard® at your local Thomson travel shop to enjoy these great benefits:"
    @@travel_money_card_benefits1= "Free to use in shops and restaurants"
    @@travel_money_card_benefits2 = "A convenient way of taking your money abroad"
    @@travel_money_card_benefits3 = "Can be reloaded again and again"
  end
  #
  #def home_page_strings
  #  @@home_page_loading=get_localized_string "hold_on_booking"
  #  @@home_page_booking_summary=get_localized_string "booking_summary"
  #  @@home_page_days_to_go= get_localized_string "days_to_go"
  #end

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
    @@logout=get_localized_string "logout" #"Log out"
    @@logout_confirm=get_localized_string "confirm" # yes

    @@excursions=get_localized_string "excursions"
  end

  def booking_summary_strings
    @@booking_summary_title= get_localized_capitalized_string "booking_summary"
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
    @@weather_page_title=get_localized_capitalized_string "weather_header" #"Weather"
    @@share_weather=get_localized_string "weather_share" #"Share the weather"
  end

  def contact_us_strings
    @@contact_us_contact_title=get_localized_capitalized_string "contactus_navbar" #"Contact us"
    @@contact_us_address="17 Market Walk Chorley Lancashire PR7 1 DE"
    @@contact_us_title=get_localized_string "contactus_title" #"Need some help?"
    @@contactus_subtitle=get_localized_string "contactus_subtitle" #"Get in touch"
    @@contact_us_travel_shop="If you have any questions about your booking, just contact your local Thomson travel shop."
    @@postholiday_emailus=get_localized_string "postholiday_emailus" #"Email us"
    @@contactus_call_us=(get_localized_string "contactus_flightCTA").gsub('[number]', '') #"Call us on [number]"
    @@contact_us_shop_opening_times="Shop opening times: "
    @@contactus_termsAndConditions=get_localized_string "contactus_termsAndConditions"
    @@contactus_privacyPolicy=get_localized_string "contactus_privacyPolicy" #"Privacy policy"
    @@contactus_support=get_localized_string "contactus_support" #"MyThomson support"
    @@url_dialog_title=get_localized_string "url_dialog_title" #"Open in browser?"
    @@url_dialog_cancel=get_localized_string "call_dialog_cancel" #"Cancel"
    @@url_dialog_yes=get_localized_string "call_dialog_yes" #"Yes"

  end


  def checklist_strings
    @@check_list_item_text_acc = "to_text"
    @@check_list_check_box_acc = "checkBox"
    @@check_list_selected_items_acc = "completedItems"
    @@check_list_email_items=get_localized_string "email_items"
    @@my_packaging_list=get_localized_string "my_packing_list"
    @@my_do_list=get_localized_string "my_todo_list"
    @@checklist_completed_title=get_localized_string("checklist_completed_title").gsub('([REPLACE])', '') #"View completed items ([REPLACE])"
    @@checklist_hidden_title=get_localized_string("checklist_hidden_title").gsub('([REPLACE])', '') #"Hide completed items ([REPLACE])"
  end

end


