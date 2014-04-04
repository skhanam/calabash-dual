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
    test_data
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
  end

  def loading_strings
    @@loading_hold_on=get_localized_string "hold_on"
    @@loading_finding_your_holiday=get_localized_string "hold_on_booking"
  end

  def home_page_strings
    @@home_page_loading=get_localized_string "hold_on_booking"
    @@home_page_acc_label="background_normal"
    @@home_page_booking_summary=get_localized_string "booking_summary"
    @@home_page_account_acc_label="navbarRightButton"
    @@home_page_sidepanel_acc_label="navbarLeftButton"
  end

  def side_panel_strings
    @@to_do_lists= get_localized_string "my_todo_list"
    @@home=get_localized_string "home" #"Home"
    @@holiday_summary=get_localized_string "holiday_summary" #"Holiday summary"
    @@holiday_countdown=get_localized_string "holiday_countdown" #"Holiday countdown"
    @@holiday_checklist=get_localized_string "holiday_checklist" #"Holiday checklist"
    @@holiday_checklists=get_localized_string "holiday_checklists" #"Holiday checklists"
    @@weather=get_localized_string "weather" #"Weather"
    @@flight=get_localized_string "flight" #"Flight"
    @@flights=get_localized_string "flights" #"Flights"
    @@hotel_and_resort=get_localized_string "hotel_and_resort" #"Hotel and resort"
    @@destination=get_localized_string "destination" #"Destination"
    @@getting_to_the_airport=get_localized_string "getting_to_the_airport" #"Getting to the airport"
    @@travel_money=get_localized_string "travel_money" #"Travel money"
    @@important_information=get_localized_string "important_information" #"Important information"
    @@contact_us=get_localized_string "contact_us" #"Contact us"
    @@logout=get_localized_string "logout" #"Log out"
  end


  def checklist_strings
    @@check_list_item_text_acc = "to_text"
    @@check_list_check_box_acc = "checkBox"
    @@check_list_selected_items_acc = "completedItems"
    @@check_list_email_items=get_localized_string "email_items"
    @@my_packaging_list=get_localized_string "my_packing_list"
    @@my_do_list=get_localized_string "my_todo_list"
    @@checklist_completed_title=get_localized_string("checklist_completed_title").gsub('([REPLACE])','') #"View completed items ([REPLACE])"
    @@checklist_hidden_title=get_localized_string("checklist_hidden_title").gsub('([REPLACE])','') #"Hide completed items ([REPLACE])"
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


