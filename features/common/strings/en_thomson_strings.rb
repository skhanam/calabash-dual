# encoding: UTF-8

module EN_ThomsonStrings

  def set_thomson_strings
    puts "******* thomson setting strings ********"
    welcome_page_strings
    login_page_strings
    welcome_messages
    home_page_strings
    loading_strings
    side_panel_strings
    checklist_strings
    booking_summary_strings
    contact_us_strings
    weather_page_strings
    test_data
    travel_money_strings
  end

  #All test data for different appication is in here
  def test_data
    $g_booking_data= 'features/z_dump/test_data/Bookings.xlsx'
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

  def home_page_strings
    @@home_page_loading=get_localized_string "hold_on_booking"
    @@home_page_booking_summary=get_localized_string "booking_summary"
    @@home_page_days_to_go= get_localized_string "days_to_go"
  end

  def side_panel_strings
    @@to_do_lists= get_localized_string "my_todo_list"
    @@home=get_localized_string "home" #"Home"
    @@holiday_summary=get_localized_string "holiday_summary" #"Holiday summary"
    @@side_panel_countdown=get_localized_string "holiday_countdown" #"Holiday countdown"
    @@holiday_checklist=get_localized_string "holiday_checklist" #"Holiday checklist"
    @@holiday_checklists=get_localized_string "holiday_checklists" #"Holiday checklists"
    @@weather=get_localized_string "weather" #"Weather"
    @@flight=get_localized_string "flight" #"Flight"
    @@flights=get_localized_string "flights" #"Flights"
    @@hotel_and_resort=get_localized_string "hotel_and_resort" #"Hotel and resort"
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
    @@booking_summary_title=get_localized_string "booking_summary"
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
    @@share_weather=get_localized_string "weather_share" #"Share the weather"
  end

  def contact_us_strings
    @@contact_us_contact_title=get_localized_string "contactus_navbar" #"Contact us"
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

  def welcome_messages
    #@@welcome_hi_text="Hi \\w+,"
    #@@welcome_tips="Welcome to your personalised travel companion. Check back for handy tips and updates!"
    #@@welcome_at_destination="Welcome to \\w+! We hope you have a great holiday. If you need anything, just get in touch."
    #@@welcome_countdown_days="It 's the final countdown, your holiday to \\w+ is just days away."
    #@@welcome_countdown_tomorrow="This time tomorrow you’ll be in \\w+ - don' t forget to pack your passport!"
    #@@welcome_countdown_month="Your holiday to \\w+ is less than a month away! Is your passport is in date\\?"
    #@@welcome_excursion="We’ve found \\d+ excursion(s) for you in \\w+. Take a look now!"
    #@@welcome_extras_available="We've found \\d+ extra(|s) available to you. Take a look now!"
    #@@welcome_dont_forget_flight="Don 't forget your flight departs"
    #@@welcome_weather="Good news"
    #@@welcome_need_help="Got a question about your booking\\? We\'re here to help if you need us."
    #@@welcome_your_views="What do you think of our app\\? It would be great to hear your views."
    #@@welcome_rate_app="Button: Rate the MyFirstChoice app"
    #@@welcome_home_alert="We hope you had a great time away. Now you’re logged in you can browse our great range of holidays or contact us about your recent trip"
    #@@welcome_home="We hope you had a great time away. Now you’re logged in you can browse our great range of holidays or contact us about your recent trip"
    #
    #@@welcome_button_contact_us="Contact us"
    #@@welcome_button_excursions="View excursions"
    #@@welcome_button_view_my_flight="View my flight"
    #@@welcome_button_view_extras="View extras"
    #@@welcome_button_view_weather="View weather"
    #@@welcome_button_rate="Rate the MyFirstChoice app"
    #
    ##List of all welcome messages
    #@@welcome_msg_hash={
    #    "43 or more days" => [@@welcome_tips, @@welcome_extras_available, @@welcome_need_help],
    #    "29 to 42 days" => [@@welcome_need_help, @@welcome_extras_available, @@welcome_excursion, @@welcome_tips],
    #    "15 to 28 days" => [@@welcome_need_help, @@welcome_extras_available, @@welcome_excursion, @@welcome_countdown_month, @@welcome_tips],
    #    "7 to 14 days" => [@@welcome_need_help, @@welcome_extras_available, @@welcome_excursion, @@welcome_countdown_days, @@welcome_tips],
    #    "1 to 6 days" => [@@welcome_need_help, @@welcome_extras_available, @@welcome_excursion, @@welcome_tips],
    #    "less than 1 day" => [@@welcome_need_help, @@welcome_extras_available, @@welcome_excursion, @@welcome_countdown_tomorrow, @@welcome_tips],
    #    "in resort" => [@@welcome_extras_available, @@welcome_at_destination, @@welcome_excursion],
    #    "more than 1 day past" => [@@welcome_home]
    #
    #}
    #
    ##List of states for messages to be verified, To complete verification of message for each criteria (ex: "more than 1 day past")
    ##Test must be run to verify that all messages in @@welcome_msg_hash["more than 1 day past"] must be verified
    ## it will look like
    #@@welcome_msg_hash_verified={}
    #@@welcome_msg_hash.each do |criteria, values|
    #  arr=[]
    #  values.each do |msg|
    #    arr << false
    #  end
    #  @@welcome_msg_hash_verified[criteria]=arr
    #end


  end
end


