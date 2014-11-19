# encoding: UTF-8
module DEMeineTUI

  def set_meine_tui_de_mt_strings
    test_data
    common_strings
    welcome_page_strings
    login_page_strings
    home_page_strings
    side_panel_strings
    countdown_page_strings
    weather_page_strings
    booking_summary_strings
    my_bookings_strings
    my_account_strings
    change_password_strings
    loading_strings
    add_booking_page_strings
    update_email_strings
    new_to_tui_strings
    new_user_registration
    forgot_password_strings
    contact_us_strings
    tui_service_onsite_strings
    hotel_page_strings
    flights_strings
    terms_strings
    dest_info_strings
    insurance_strings
    my_tour_guide_strings
    my_travel_agent_strings
    good_to_know_strings
    countdown_strings
    flight_details_strings
    excursions_strings
    wrong_country_strings
  end

  #All test data for different appication is in here
  def test_data
    $g_booking_data_file= 'features/z_dump/test_data/Bookings.xlsx'
    $g_strings= 'features/z_dump/test_data/Language_Strings.xlsx'
    $g_localized_strings=nil
    @@user_details=nil
  end

  def excursions_strings
    if $g_phone
      @@excursions_title= get_localized_string "excursions" #"Utflykter"
    elsif $g_tablet
      @@excursions_title= get_localized_string "excursions_title"
    end
    @@side_panel_link=get_localized_string "excursions" #"Utflykter"
    @@experience_the_country= get_localized_string "experience_the_country" #Land und Leute hautnah erleben

  end

  def wrong_country_strings
    @@wrong_country_selected_text="Haben Sie vielleicht bei TUI Deutschland oder TUI Österreich gebucht?"
    @@wrong_country_switch= get_localized_capitalized_string "cantFindBooking_ctaSwitch"
    @@wrong_country_add_booking= get_localized_string "cantFindBooking_addBookingTitle"

  end

  def welcome_page_strings
    @@already_registered=get_localized_string "have_you_used_tui_cta_logged_title"
    @@login_with_existing_credentials= get_localized_string "have_you_used_tui_cta_logged_body"
    @@not_yet_registered=get_localized_string "have_you_used_tui_cta_not_logged_title"
    @@register_with_booking_code=get_localized_string "have_you_used_tui_cta_not_logged_body"


    @@have_never_booked_through_TUI_before=get_localized_string "tell_us_cta_new_tui_body"
  end

  def new_to_tui_strings
    @@new_to_tui_discover_tui="TUI entdecken"
    @@new_to_tui_havent_booked="Sie haben bisher noch keinen Urlaub bei uns gebucht? Wir zeigen Ihnen gerne, was Sie bei uns erwartet. Tauchen Sie ein in unsere Reisewelten oder erleben Sie eine Tour durch meine TUI mit unserem Video."
    @@new_to_tui_video ="Hier geht's zum Meine TUI Video"
    @@new_to_tui_travel_worlds= get_localized_string "explore_tui_carousel_header"
    @@new_to_tui_text2 ="TUI Classic bietet komfortable Anlagen mit kurzen Wegen sowie eine kompetente, deutsch sprechende Gästebetreuung zum unbeschwerten Entspannen."
    @@new_to_tui_classic_hotel= "Ein "+get_localized_string("explore_tui_classic_hotel_button")
  end

  def login_page_strings
    if $g_tablet
      @@welcome_login_surname_hint = get_localized_string "welcome_login_surname_hint" # Enter surname
      @@welcome_login_departure_date = get_localized_string "welcome_login_departure_date" # Departure date:
      @@welcome_login_booking_reference2_hint = get_localized_string "welcome_login_booking_reference2_hint" # 12345678
      @@welcome_login_booking_reference1_hint = get_localized_string "welcome_login_booking_reference1_hint" # 1234

    elsif $g_phone
      @@welcome_login_surname=get_localized_string "welcome_login_surname" #"Surname of lead passenger:"
      @@welcome_login_departure_date=get_localized_string "welcome_login_departure_date" #"Departure date:"
      @@welcome_login_booking_reference=get_localized_string "welcome_login_booking_reference"
      @@welcome_login_booking_reference_extra=get_localized_string "welcome_login_booking_reference_extra"

    end

    @@signup_signup_cta= get_localized_capitalized_string "signup_signup_cta" #Registrieren

    @@login_welcome= get_localized_string "login_welcome" #Willkommen
                                                                              #@@login_page_text=get_localized_string "login_welcome"
    @@email_text=get_localized_string "forgot_password_email_label"

    @@email_hint_text= "Benutzername / E-Mail eingeben" if $g_phone #get_localized_string "login_email_hint"
    @@email_hint_text = "Benutzername / E-Mail" if $g_tablet

    @@password_text=get_localized_string "login_password"
    @@login_forgot_password=get_localized_string "login_forgot_password"
    @@login_button=get_localized_string "login_login"
    @@password_reset=get_localized_string "forgot_password_header"
    @@i_need_help=get_localized_string "i_need_help"
    @@privacy_terms_of_use=get_localized_string "terms_title"
    @@login_password_tooltip= get_localized_string "login_password_tooltip"
    @@login_password_hint = get_localized_string "login_password_hint"

    @@login_credentials_error = get_localized_string "error_box_failed_title" if $g_tablet

    @@submit_button= get_localized_string "submit" #Speichern
    @@login_button= get_localized_string "login" #Login

    @@login_default_country="Deutschland"
    @@general_login_error="Ihre Anmeldung war leider nicht erfolgreich." #get_localized_string "error_default_header"
  end

  def home_page_strings
    @@hold_on_one_moment=get_localized_string "hold_on_booking"
    @@home_page_booking_summary=get_localized_string "booking_summary"
    @@home_page_insurance_acc=get_localized_string "insurance"
    @@home_page_meet_your_travel_agent= get_localized_string "meet_your_travel_agent" #Lernen Sie Ihre Reiseleitung kennen
    @@holiday_message_minus_548= get_localized_string "holiday_message_minus_548"
  end

  def meet_rep_strings
    @@meet_the_rep_help
  end

  def insurance_strings
    @@insurance_title=get_localized_string "insurance"
  end

  def side_panel_strings
    @@home=get_localized_string "home"
    @@side_panel_countdown=get_localized_string "countdown"
    @@side_panel_my_booking= get_localized_string "my_booking" #Meine Buchung

    @@side_panel_booking_summary=get_localized_string "booking_summary"

    @@side_panel_flight=get_localized_string "flight"
    @@side_panel_flights=get_localized_string "flights"
    @@side_panel_extra=get_localized_string "extra"
    @@side_panel_extras=get_localized_string "extras"
    @@side_panel_hotel=get_localized_string "hotel"
    @@side_panel_hotels=get_localized_string "hotels"
    @@side_panel_transfer=get_localized_string "transfer"

    @@currency_converter= get_localized_string "currency_converter"
    @@important_information=get_localized_string "important_information"


    @@side_panel_insurance=get_localized_string "insurance"
    @@side_panel_insurances=get_localized_string "insurances"

    @@side_panel_boat=get_localized_string "boat"
    @@side_panel_camper=get_localized_string "camper"
    @@side_panel_car_hire=get_localized_string "car_hire"

    @@side_panel_destination=get_localized_string "destination_guide"

    @@side_panel_weather=get_localized_string "weather" #"Weather"
    @@side_panel_contact_us= get_localized_string "contact_us"
    @@side_panel_TandC=get_localized_string "tui_service_on_site"
    @@side_panel_my_tour_guide=get_localized_string "meet_the_rep"
    @@side_panel_my_travel_agent=get_localized_string "travelAgent_title"

    @@guide_online = get_localized_string "guide_online_biscuit_title"

    @@side_panel_destination_guide=get_localized_string "destination_guide"
    @@side_panel_excursions=get_localized_string "excursions"
    @@side_panel_good_to_know=get_localized_string "good_to_know"

    @@side_panel_travel_agent=get_localized_string "travel_agent" #Mein Reisebüro
    @@side_panel_tui_service_on_site=get_localized_string "tui_service_on_site"
    @@side_panel_contact_heading=get_localized_string "contact"
    @@side_panel_contact= @@side_panel_contact_heading
    @@app_feedback=get_localized_string "app_feedback"

  end


  def my_bookings_strings

    # @@my_bookings_title ==  $g_phone ? get_localized_string "my_bookings" : get_localized_string "current_bookings"
    @@my_bookings_title=get_localized_string "my_bookings" if $g_phone
    @@my_bookings_title=get_localized_string "current_bookings" if $g_tablet
    @@my_bookings_edit_account=get_localized_string "edit_my_account"
    @@my_bookings_past_bookings=get_localized_string "past_bookings"
    @@my_bookings_current_bookings=get_localized_string "current_bookings"
    @@booking_active_biscuit= "reservation_test0012 active_booking"
  end

  def my_account_strings
    @@my_account_title=get_localized_string "my_account"
    @@personal_details=get_localized_string "personal_details"
    @@my_account_username=get_localized_string "username"
    @@my_account_first_name=get_localized_string "forename"
    @@my_account_surname=get_localized_string "surname"
    @@my_account_email=get_localized_string "email"
    @@my_account_update_email=get_localized_string "update_email"
    @@my_account_change_password= get_localized_string "change_password"
    @@signup_newsletter=get_localized_string "signup_to_emails"
    @@my_account_newsletter_text= get_localized_string "signup_to_emails_blurb"
    @@log_out_text=get_localized_string "logout"

    @@my_account_logout_title= get_localized_string "logout_confirm_two"
    @@logout_confirm= get_localized_string "confirm"
    @@my_account_logout_no= get_localized_string "cancel" #Abbrechen

  end

  def change_password_strings
    @@change_password_title=get_localized_string "forgot_password_header" if $g_phone
    @@change_password_title=get_localized_string "forgot_password_reset_pwd" if $g_tablet
    @@change_password_create_new_password=get_localized_string "forgot_password_reset_pwd"
    @@change_password_info=get_localized_string "new_password_body"
    @@change_password_text2=get_localized_string "forgot_password_email_label"
    @@change_password_send_button=get_localized_capitalized_string "submit"
  end

  def booking_summary_strings
    @@booking_summary_title=get_localized_string "booking_summary"
    @@booking_summary_booking_code="Vorgang/Buchungsnummer:"
    @@booking_summary_passengers_text="Gebucht für:"
  end

  def weather_page_strings
    @@weather_page_title=get_localized_string "weather_header"
    @@share_weather=get_localized_string "share_weather"
    @@weather_country="Dubai"
  end

  def add_booking_page_strings

    @@browse_holiday_banner_text =get_localized_string "browse_banner"

    @@add_a_booking_page_title =get_localized_string "find_booking"
    @@add_a_booking_page_text1 =get_localized_string "booking_details"
    @@add_a_booking_page_text2 =get_localized_string "booking_details_blurb"

    @@add_a_booking_page_salutation =get_localized_string "signup_salutation"
    @@add_a_booking_page_salutation_hint =get_localized_string "signup_selector"

    @@signup_your_booking= get_localized_string "signup_your_booking" #Ihre Buchung

    if $g_phone
      @@add_a_booking_page_firstname =get_localized_string "forename"
      @@add_a_booking_page_last_name =get_localized_string "surname"
    elsif $g_tablet
      @@add_a_booking_page_firstname =get_localized_string "signup_first_name"
      @@add_a_booking_page_firstname_hint =get_localized_string "signup_first_name_hint" # Vorname eingeben
      @@add_a_booking_page_last_name =get_localized_string "signup_lastName_hint"
    end

    @@add_a_booking_page_last_name_hint =get_localized_string "signup_lastName_hint"

    @@add_a_booking_page_booking_code ="Vorgang/Buchungscode:"
    @@add_a_booking_page_booking_code_hint =get_localized_string "signup_process_booking_code_hint"

    @@add_a_booking_page_arrival_date = get_localized_string "signup_departure_start_date"
    @@add_a_booking_page_arrival_date_hint = get_localized_string "signup_departure_start_date_hint"

    @@add_a_booking_page_find_booking_button ="Buchung hinzufügen"
    @@add_a_booking_page_need_help = get_localized_string "i_need_help" #"Ich benötige Hilfe"
  end

  def new_user_registration
    @@signup_create_account = get_localized_string "signup_create_account"

    @@new_user_registration_salutation ="Anrede:"
    @@new_user_registration_salutation_hint ="Bitte auswählen"

    @@new_user_registration_title ="Titel:"

    @@new_user_registration_firstname =get_localized_string "forename"
    @@new_user_registration_firstname_hint ="Vorname eingeben"
    @@signup_first_name= get_localized_string "signup_first_name" #Vorname:

    #screen 2
    @@new_user_registration_last_name =get_localized_string "surname"
    @@new_user_registration_last_name_hint= get_localized_string "signup_lastName_hint" #Nachname eingeben


    @@new_user_registration_booking_code ="Vorgang/Buchungscode:"
    @@new_user_registration_booking_code_hint ="123456789"

    @@new_user_registration_arrival_date ="Anreisedatum:"
    @@new_user_registration_arrival_date_hint =get_localized_string "signup_departure_start_date_hint"

    @@signup_create_account= get_localized_string "signup_create_account"

    #screen 3
    @@new_user_registration_email = get_localized_string "email" #E-Mail:
    @@signup_email_hint= get_localized_string "signup_email_hint" #E-Mail Adresse eingeben

    @@new_user_registration_password = "Passwort:"
    @@new_user_registration_password_hint = get_localized_string "signup_password_hint"
    #screen 4
    @@new_user_registration_newsletter = "TUI Newsletter bestellen"
    @@new_user_registration_newsletter_text = get_localized_string "signup_to_emails_blurb"
    @@new_user_registration_register = get_localized_string "signup_signup_cta"
    @@new_user_registration_privacy_policy = "Datenschutz"
    @@new_user_registration_need_help = get_localized_string "i_need_help"

    @@signup_salutation= get_localized_string "signup_salutation" #Anrede:
    @@signup_selector= get_localized_string "signup_selector" #Bitte auswählen
    @@signup_preamble= get_localized_string "signup_preamble" #Bitte geben Sie Ihren Vor- und Nachnamen exakt wie auf Ihren Reiseunterlagen an, sowie den dazugehörigen Vorgang/Buchungscode und Ihr Anreisedatum.

  end

  def update_email_strings
    @@update_email_text=get_localized_string "update_email" #E-Mail ändern
    @@update_email_new_email_hint= get_localized_string "new_email_hint_text"
    @@update_email_new_password_hint= get_localized_string "signup_password_hint"
    @@update_reminder= get_localized_string "update_reminder" #Bitte beachten Sie, dass Sie diese E-Mail Adresse zukünftig auch auf meine-tui.de verwenden müssen.
    @@update_email_submit= get_localized_string "submit"
    @@update_email_forgot_password=get_localized_string "login_forgot_password"

    if $g_phone
      @@update_email_new_email=get_localized_string "new_email"
      @@update_email_new_password= get_localized_string "your_password"
    elsif $g_tablet
    end
  end

  def forgot_password_strings
    @@forgot_password_title="Neues Passwort anlegen"
    @@forgot_password_let_us_know_email="Bitte teilen Sie uns Ihre E-Mail Adresse mit, um ein neues Passwort anzulegen. Folgen Sie danach den Anweisungen in der E-Mail, die wir Ihnen senden."
    @@forgot_password_username_or_email="Benutzername oder E-Mail:"
    @@forgot_password_send_button="Speichern"
    @@forgot_password_need_help= get_localized_string "i_need_help"
    @@forgot_password_email_help="Es wurde kein Benutzerkonto zu Ihren Daten gefunden."
    @@forgot_password_email_hint= 'Benutzername / E-Mail eingeben' # "forgot_password_email_hint" #Benutzername \// E-Mail eingeben
  end

  def contact_us_strings
    if $g_phone
      @@contact_us_contact_title=get_localized_string "contact"
      @@contact_us_learn_more=get_localized_string "contact_questions"
      @@contact_us_contact_tui_service = get_localized_string "service_on_site"
      @@contact_us_first_name=get_localized_string "forename"
      @@contact_us_last_name =get_localized_string "surname"
      @@contact_us_email_id = get_localized_string "email"
      @@contact_us_telephone = get_localized_string "contact_phone"
      @@contact_us_query_sent= get_localized_string "contact_query_sent"
      @@contact_us_subject = get_localized_string "contact_subject"
      @@contact_us_message = get_localized_string "contact_message"
      @@contact_us_send_email = get_localized_string "contact_sendEmail"
      @@contact_us_t_and_c= get_localized_string "terms_title"
      @@contact_us_disclaimer= get_localized_string "disclaimer"
      @@contact_us_contact_copy= ["TUI Deutschland GmbH",
                                  "Karl-Wiechert-Allee 23",
                                  "30625 Hannover",
                                  "Telefon 05 11 / 5 67-0",
                                  "Telefax 05 11 / 5 67-13 01",
                                  "Handelsregister",
                                  "Amtsgericht Hannover",
                                  "HRB 62522",
                                  "Ust-Ident.-Nr. DE 242380569",
                                  "Vorsitzender des Aufsichtsrates:",
                                  "Peter Long",
                                  "Geschäftsführung: Christian Clemens (Vorsitzender)",
                                  "Dr. Oliver Dörschuck",
                                  "Ralf Horter"]

      @@contact_us_terms_conditions_page_title=get_localized_string "terms_title"
      @@contact_us_tui_service_title="Im Urlaub für Sie da"

    elsif $g_tablet
      @@contact_form_title= get_localized_string "contact_form_title" # Contact
      @@contact_form_sub_title= get_localized_string "contact_form_sub_title" # Contact us for question regarding your booking, technical issues and other geral queries
      @@contact_form_first_name= get_localized_string "contact_form_first_name" # First name:
      @@contact_form_last_name= get_localized_string "contact_form_last_name" # Surname:
      @@contact_form_email= get_localized_string "contact_form_email" # Email:
      @@contact_form_telephone= get_localized_string "contact_form_telephone" # Telephone (optional):
      @@contact_form_telephone_hint_text= get_localized_string "contact_form_telephone_hint_text" # Enter telephone number
      @@contact_form_subject= get_localized_string "contact_form_subject" # Betreff
      @@contact_form_message_hint_text= get_localized_string "contact_form_message_hint_text" # Enter message
      @@contact_form_Send_email= get_localized_string "contact_form_Send_email" # Send email
      @@contact_form_Impressum_title= get_localized_string "contact_form_Impressum_title" # Impressum
      @@contact_form_Impressum= get_localized_string "contact_form_Impressum" # Impressum
    end

  end


  def flight_details_strings
    @@flight_details_title= get_localized_string "flight_details"
    @@flight_details_airline= get_localized_string "airline"
    @@flight_details_passengers= get_localized_string "passengers"
    @@flight_details_cabin_class= get_localized_string "cabin_class"
    @@flight_details_flight_number= get_localized_string "flight_number"
    @@flight_details_airport_info= get_localized_string "flights_airport_information"
    @@flight_details_carrier_info= get_localized_string "flights_carrier_information"
  end


  def tui_service_onsite_strings
    @@tui_service_title=get_localized_string "tui_service_on_site"
    @@tui_service_terms_text= "Im Urlaub für Sie da"
    @@tui_service_sms=get_localized_string "services_text"
    @@tui_service_send_email=get_localized_string "services_email"
    @@tui_service_learn_more=get_localized_string "contact_questions"
    @@tui_service_service_contact= get_localized_string "contact_tui_services"

    @@services_phone=get_localized_string "services_phone"

  end

  def terms_strings
    @@terms_title=get_localized_string "terms_title"
    @@de_terms_web_content_title="Datenschutzerklärung der TUI Deutschland GmbH"
  end

  def my_tour_guide_strings
    @@my_tour_guide_text=get_localized_string "meet_the_rep"
    @@my_tour_guide_email_link= get_localized_string "travelAgent_email"
    @@my_tour_guide_call_us= get_localized_string "travelAgent_phone"
    @@my_tour_tui_service=get_localized_string "tui_service_on_site"
  end


  def my_travel_agent_strings
    @@my_travel_email_txt =get_localized_string "travelAgent_email"
    @@my_travel_call_txt =get_localized_string "travelAgent_phone"
    @@my_travel_agent_title =get_localized_string "travelAgent_title"
  end


  def hotel_page_strings
    @@hotel_call_us = get_localized_string "call"
    @@hotel_email = get_localized_string "product_send_email"
    ##Links
    @@hotel_place_link="Ort"
    @@hotel_Food_Drink_link="Essen & Trinken"
    @@hotel_accommodation_link="Unterkunft"
    @@hotel_Living_link="Wohnen"
    @@hotel_sport_link="Sport"
    @@hotel_Entertainment_link="Unterhaltung"
    @@hotel_Wellness_link="Wellness"
    @@hotel_For_Children ="Für Kinder"
  end


  def countdown_strings
    @@countdown_page_title=get_localized_string "countdown_header"
  end

  def flights_strings
    @@flight_page_title=get_localized_string "flight"
    @@flights_page_title=get_localized_string "flights"
  end

  def dest_info_strings
    @@dest_info_screen_title = get_localized_string "destination_info"
  end

  def good_to_know_strings
    @@good_to_know_page_title=get_localized_string "good_to_know"
    @@good_to_know_page_text=get_localized_string "goodtoknow_blurb"
  end

  #Not Initialized this below method > please use below strings as required
end



