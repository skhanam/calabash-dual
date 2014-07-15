# encoding: UTF-8

module NordicsStrings
  def set_nordics_strings
    puts "settings nordics strings"
    login_page_strings
    welcome_page_strings
    duty_free_strings
    excursions_strings
    home_strings
    side_panel_strings
    booking_summary_strings
    weather_page_strings
    contact_us_strings
    hotel_strings
    flights_strings
    countdown_strings
    flight_details_strings
    destination_info_strings
  end

  def excursions_strings
    @@excursions_title= get_localized_string "excursions" #"Utflykter"
    @@side_panel_link=get_localized_string "excursions" #"Utflykter"
    @@excursions_webview_txt="Guide Online"
  end

  def duty_free_strings
    @@duty_free_title= get_localized_string "duty_free"
    @@duty_free_webview_link="Till taxfree-butiken" if ENV['LANG']=="sv"
    @@duty_free_webview_link="Till taxfree-butiken" if ENV['LANG']=="fi"
    @@duty_free_webview_link="Till taxfree-butiken" if ENV['LANG']=="da"
    @@duty_free_webview_link="Till taxfree-butiken" if ENV['LANG']=="nb"
  end

  def home_strings
    @@home_destination_string= get_localized_string "explore" # Om mitt resmål
  end

  def countdown_strings
    @@countdown_page_title=get_localized_string "countdown_header"
  end

  def login_page_strings
    @@login_page_title = get_localized_string "login_welcome"
    @@login_page_text = get_localized_string "welcome_login_paragraph" # Appen Min semester vänder

    @@login_page_booking_ref = get_localized_string "welcome_login_booking_reference"
    @@login_page_email = get_localized_string "login_user_email"
    @@login_page_telephone = get_localized_string "welcome_login_telephone"

    @@login_button=get_localized_string "welcome_login_cta_login" #"Log in"
    @@login_page_help_logging_in=get_localized_string "welcome_cta_help_login"
    @@login_page_book_visit=get_localized_string "welcome_book_holiday"


    @@welcome_help_cant_login_cta=get_localized_string "welcome_help_cant_login_cta" #"Retrieve a booking reference number"
    @@welcome_cta_help_login=get_localized_string "welcome_cta_help_login" #"Help logging in"

    @@help_login_tips=get_localized_string "welcome_help_cant_login_subtitle"
    @@help_login_login_body=get_localized_string "welcome_help_cant_login_body"

    @@help_logging_kontakt_header = get_localized_string "welcome_help_more_issues_header"
    @@help_logging_kontakt_text = get_localized_string "welcome_help_more_issues_body"
    @@help_logging_ring = get_localized_string "welcome_help_more_issues_phone_title"
    @@help_logging_email = get_localized_string "welcome_help_more_issues_email_title"
    @@help_logging_privacy_title = get_localized_string "welcome_help_more_issues_privacy_title"


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

  def flights_strings
    @@flight_page_title=get_localized_string "flight"
    @@flights_page_title=get_localized_string "flights"
  end

  def flight_details_strings
    @@flight_details_title= get_localized_string "flight_details"
    @@flight_details_airline= get_localized_string "airline"
    @@flight_details_passengers= get_localized_string "passengers"
    @@flight_details_cabin_class= get_localized_string "cabin_class"
    @@flight_details_flight_number= get_localized_string "flight_number"
  end

  def welcome_page_strings
    @@welcome_page_text=get_localized_string "welcome_login_header"
  end

  def hotel_strings
    @@hotel_page_title=get_localized_string "hotel"
  end

  def weather_page_strings
    @@weather_page_title=get_localized_string "weather_header" #"Weather"
    @@share_weather=get_localized_string "weather_share" #"Share the weather"
  end


  def side_panel_strings
    @@to_do_lists= get_localized_string "my_todo_list"
    @@home=get_localized_string "home" #"Home"
    @@side_panel_excursions=get_localized_string "excursions" #"Utflykter"
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
    @@travel_money=get_localized_string "travel_money" #"Travel money"
    @@important_information=get_localized_string "important_information" #"Important information"
    @@side_panel_contact_us=get_localized_string "contact_us" #"Contact us"
    @@side_panel_destination=get_localized_string "destination"
    @@log_out_text=get_localized_string "logout" #"Log out"
    @@logout_confirm=get_localized_string "confirm" # yes
    @@accomadation = get_localized_string "accomodation"
    @@duty_free = get_localized_string "duty_free"
    @@guide_online = get_localized_string "guide_online"
    @@app_feed_back = get_localized_string "app_feedback"

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

  def contact_us_strings
    @@contact_us_contact_title=get_localized_string "contact"
    @@contactus_cta_email= get_localized_string "contactus_cta_email"
    @@contactus_cta_phone= get_localized_string "contactus_cta_phone"
    @@contactus_cta_terms= (get_localized_string "contactus_cta_terms").gsub('*','')
    @@contactus_cta_privacy= get_localized_string "contactus_cta_privacy"
    @@contactus_to= get_localized_string "contactus_to"
    @@contactus_writeTitle= get_localized_string "contactus_writeTitle"
    @@contactus_extra_text_1= get_localized_string "contactus_extra_text_1"
    @@contactus_extra_text_1_subheading= get_localized_string "contactus_extra_text_1_subheading"
    @@contactus_extra_text_2_subheading= get_localized_string "contactus_extra_text_2_subheading"
    @@contactus_extra_text_2= get_localized_string "contactus_extra_text_2"
end
end


