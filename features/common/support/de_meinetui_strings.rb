# encoding: UTF-8
module DEMeineTUI

  def set_meine_tui_de_mt_strings
    #fail("set_strings this method is not used")
    #if ($g_strings_set==true)
    #  return
    #else
    #  $g_strings_set=true
    #end
    #puts caller.first
    test_data
    welcome_page_strings
    already_customter_strings
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
    terms_strings
    meet_rep_strings
    image_icons_acc_label
    hotel_page_strings
  end

  #All test data for different appication is in here
  def test_data
    $g_booking_data= 'features/z_dump/test_data/Bookings.xlsx'
    $g_strings= 'features/z_dump/test_data/Language_Strings.xlsx'
    $g_localized_strings=nil
    @@user_details=nil
  end

  def welcome_page_strings
    @@welcome_page_text=get_localized_string "tell_us_header"
    @@already_a_customer=get_localized_string "tell_us_cta_with_tui_title"
    @@have_already_booked_through_TUI=get_localized_string "tell_us_cta_with_tui_body"
    @@did_not_book_with_tui= get_localized_string "login_did_not_book"
    @@have_never_booked_through_TUI_before=get_localized_string "tell_us_cta_new_tui_body"
  end

  def already_customter_strings
    @@already_customer_title=get_localized_string "have_you_used_tui_header"
    @@already_registered=get_localized_string "have_you_used_tui_cta_logged_title"
    @@login_with_existing_credentials= get_localized_string "have_you_used_tui_cta_logged_body"
    @@not_yet_registered=get_localized_string "have_you_used_tui_cta_not_logged_title"
    @@register_with_booking_code=get_localized_string "have_you_used_tui_cta_not_logged_body"
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
    @@login_page_text=get_localized_string "login_welcome"
    @@email_text=get_localized_string "forgot_password_email_label"
    @@email_hint_text=get_localized_string "login_email_hint"
    @@password_text=get_localized_string "login_password"
    @@login_forgot_password=get_localized_string "login_forgot_password"
    @@login_button=get_localized_string "login_login"
    @@password_reset=get_localized_string "forgot_password_header"
    @@i_need_help=get_localized_string "email_help_subject"
    @@privacy_terms_of_use=get_localized_string "terms_title"
    @@login_password_tooltip= get_localized_string "login_password_hint"
    @@login_password_hint = get_localized_string "login_password_tooltip"
  end

  def home_page_strings
    @@home_page_loading=get_localized_string "hold_on_booking"
    @@home_page_acc_label="background_normal"
    @@home_page_booking_summary="Auf einen Blick"

    @@home_page_account_acc_label="navbarRightButton"

  end

  def side_panel_strings
    @@side_panel_countdown=get_localized_string "countdown"
    @@side_panel_weather=get_localized_string "weather"
    @@side_panel_hotel=get_localized_string "hotels"
    @@side_panel_booking_summary="Auf einen Blick"
    @@side_panel_contact_us="Kontakt"
    @@side_panel_TandC="TUI Service vor Ort"
    @@side_panel_meet_rep=get_localized_string "travelAgent_title"
  end

  def my_bookings_strings
    @@my_bookings_title="Meine Buchungen"
    @@my_bookings_edit_account="Konto bearbeiten"
    @@my_bookings_past_bookings="Vergangene Buchungen"
    @@my_bookings_current_bookings="Aktuelle Buchungen"
  end

  def my_account_strings
    @@my_account_title="Mein Konto"
    @@personal_details="Persönliche Angaben"
    @@my_account_username="Benutzername:"
    @@my_account_first_name="Vorname:"
    @@my_account_surname="Nachname:"
    @@my_account_email="E-Mail:"
    @@my_account_update_email="E-Mail ändern"
    @@my_account_change_password="Passwort ändern"
    @@my_account_signup_newsletter="TUI Newsletter bestellen"
    @@my_account_newsletter_text="Ja, ich möchte regelmäßig tolle Angebote und News rund um das Thema Urlaub per E-Mail erhalten. (Meine Daten werden nicht an Dritte weitergegeben und ich kann meine Einwilligung jederzeit widerrufen.)"
    @@log_out_text="Abmelden"

    @@my_account_logout_title="Sind Sie sicher?"
    @@my_account_logout_yes="Bestätigen"
    @@my_account_logout_no="Abbrechen"
  end

  def change_password_strings
    @@change_password_title="Passwort vergessen"
    @@change_password_create_new_password="Neues Passwort anlegen"
    @@change_password_info="Bitte teilen Sie uns Ihre E-Mail Adresse mit, um ein neues Passwort anzulegen. Folgen Sie danach den Anweisungen in der E-Mail, die wir Ihnen senden."
    @@change_password_text2="Benutzername oder E-Mail:"
    #TODO confirm this string is correct or wrong:
    @@change_password_send_button="Absenden"
  end


  def countdown_page_strings
    @@countdown_page_title="Mein Urlaubscountdown"
    @@countdown_share_button_text="Meinen Urlaubscountdown teilen"
    @@countdown_days_text="Tagen"
    @@countdown_hours_text="Stunden"
    @@countdown_minutes_text="Minuten"
    @@countdown_seconds_text="Sekunden"
    @@countdown_countdown_message1="Auf nach .*? in"
    @@countdown_countdown_message2="Ich fliege nach .*? in"
  end

  def booking_summary_strings
    @@booking_summary_title="Auf einen Blick"
    @@booking_summary_booking_code="Vorgang/Buchungsnummer:"
    @@booking_summary_passengers_text="Gebucht für:"
  end

  def weather_page_strings
    @@weather_page_title="Reisewetter"
    @@share_weather="Reisewetter teilen"
  end

  def loading_strings
    @@loading_hold_on=get_localized_string "hold_on"
    @@loading_finding_your_holiday=get_localized_string "hold_on_booking"
  end

  def add_booking_page_strings
    @@add_a_booking_page_title ="Buchung hinzufügen"
    @@add_a_booking_page_text1 ="Ihre Buchungsdetails"
    @@add_a_booking_page_text2 ="Haben Sie Ihre Reiseunterlagen zur Hand? Bitte geben Sie hier Ihre Daten ein, um eine Buchung hinzuzufügen."

    @@add_a_booking_page_salutation ="Anrede:"
    @@add_a_booking_page_salutation_hint ="Bitte auswählen"

    @@add_a_booking_page_firstname ="Vorname:"
    @@add_a_booking_page_firstname_hint ="Vorname eingeben"

    @@add_a_booking_page_last_name ="Nachname:"
    @@add_a_booking_page_last_name_hint ="Nachname eingeben"

    @@add_a_booking_page_booking_code ="Vorgang/Buchungscode:"
    @@add_a_booking_page_booking_code_hint ="123456789"

    @@add_a_booking_page_arrival_date ="Anreisedatum:"
    @@add_a_booking_page_arrival_date_hint ="Datum eingeben"

    @@add_a_booking_page_find_booking_button ="Buchung hinzufügen"
    @@add_a_booking_page_need_help ="Ich benötige Hilfe"
  end

  def new_user_registration
    @@new_user_registration_create_account_text1 = "Konto erstellen"

    @@new_user_registration_salutation ="Anrede:"
    @@new_user_registration_salutation_hint ="Bitte auswählen"

    @@new_user_registration_title ="Titel:"
    @@new_user_registration_firstname_hint ="Bitte auswählen"

    @@new_user_registration_firstname ="Vorname:"
    @@new_user_registration_firstname_hint ="Vorname eingeben"

    #screen 2
    @@new_user_registration_last_name ="Nachname:"
    @@new_user_registration_last_name_hint ="Nachname eingeben"

    @@new_user_registration_booking_code ="Vorgang/Buchungscode:"
    @@new_user_registration_booking_code_hint ="123456789"

    @@new_user_registration_arrival_date ="Anreisedatum:"
    @@new_user_registration_arrival_date_hint ="Datum eingeben"
    @@new_user_registration_create_account_text2 = "Konto erstellen"

    #screen 3
    @@new_user_registration_email = "E-Mail:"
    @@new_user_registration_email_hint = "E-Mail Adresse eingeben"
    @@new_user_registration_password = "Passwort:"
    @@new_user_registration_password_hint = "Passwort eingeben"
    #screen 4
    @@new_user_registration_newsletter = "TUI Newsletter bestellen"
    @@new_user_registration_newsletter_text = "Ja, ich möchte regelmäßig tolle Angebote und News rund um das Thema Urlaub per E-Mail erhalten. (Meine Daten werden nicht an Dritte weitergegeben und ich kann meine Einwilligung jederzeit widerrufen.)"
    @@new_user_registration_register = "Registrieren"
    @@new_user_registration_privacy_policy = "Datenschutz"
    @@new_user_registration_need_help = "Ich benötige Hilfe"


  end

  def update_email_strings
    @@update_email_text="E-Mail ändern"
    @@update_email_new_email="Neue E-Mail:"
    @@update_email_new_email_hint="Neue E-Mail Adresse eingeben"
    @@update_email_new_password="Ihr Passwort:"
    @@update_email_new_password_hint="Passwort eingeben"
    @@update_email__text2="Bitte beachten Sie, dass Sie diese E-Mail Adresse zukünftig auch auf meine-tui.de verwenden müssen."
    @@update_email_submit="Speichern"
    @@update_email_forgot_password="Passwort vergessen?"
  end

  def forgot_password_strings
    @@forgot_password_title="Neues Passwort anlegen"
    @@forgot_password_let_us_know_email="Bitte teilen Sie uns Ihre E-Mail Adresse mit, um ein neues Passwort anzulegen. Folgen Sie danach den Anweisungen in der E-Mail, die wir Ihnen senden."
    @@forgot_password_username_or_email="Benutzername oder E-Mail:"
    @@forgot_password_send_button="Speichern"
    @@forgot_password_need_help="Ich benötige Hilfe"
    @@forgot_password_email_help="Es wurde kein Benutzerkonto zu Ihren Daten gefunden." #TODO CHECK THIS
  end

  def contact_us_strings
    @@contact_us_contact=get_localized_string "contact"
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
    @@contact_us_privacy_policy= get_localized_string "terms_title"
    @@contact_us_disclaimer= get_localized_string "disclaimer"
    @@contact_us_contact_copy= ["TUI Deutschland GmbH",
                                "Karl-Wiechert-Allee 23",
                                "30625 Hannover",
                                "Telefon 05 11 / 5 67-0",
                                "Telefax 05 11 / 5 67-13 01",
                                "E-Mail: info@tui.de",
                                "Handelsregister",
                                "Amtsgericht Hannover",
                                "HRB 56512",
                                "Ust-Ident.-Nr. DE 812777076",
                                "Vorsitzender des Aufsichtsrates:",
                                "Dr. Michael Frenzel",
                                "Geschäftsführung: Christian Clemens (Vorsitzender)",
                                "Dr. Oliver Dörschuck",
                                "Henrik Homann"]

    @@terms_conditions_page_title="Datenschutzerklärung der TUI Deutschland GmbH"
    @@tui_service_contact_title="Im Urlaub für Sie da"
    #TODO check this text must be verified or not
    #@@contact_us_questions_about_reservations="Bei Fragen rund um Ihre Buchung, TUI allgemein oder bei technischen Problemen stehen wir Ihnen gerne zur Verfügung."
    #privacy policy button
    #@@contact_us_we_are_here="So erreichen Sie uns"
  end

  def terms_strings

    @@terms_title=get_localized_string "service_on_site"
    @@terms_text= "Im Urlaub für Sie da"
    @@terms_sms=get_localized_string "services_text"
    @@terms_send_email=get_localized_string "services_email"
    @@terms_learn_more=get_localized_string "contact_questions"
    @@terms_service_contact= get_localized_string "contact_tui_services"

    @@terms_call_us=get_localized_string "services_phone"
    @@terms_are_you_sure = get_localized_string "product_call_dialog_message"
    @@terms_dialog_no = get_localized_string "product_call_dialog_no"
    @@terms_dialog_yes = get_localized_string "product_call_dialog_yes"
    @@terms_dialog_number= "Nummer"

  end

  def meet_rep_strings
    @@meet_rep_text="Hier habe ich meinen Urlaub gebucht"
    @@meet_rep_title= get_localized_string "travelAgent_title"
    @@meet_rep_email_link= get_localized_string "travelAgent_email"
    @@meet_rep_call_us= get_localized_string "travelAgent_phone"
  end

  def image_icons_acc_label
    @@share_button_closed_img ="share_button"
    @@facebook_share_img="facebook_share"
    @@twitter_share_img ="twitter_share"
    @@share_button_open_img ="share_button_open"
  end


  def hotel_page_strings
    @@hotel_call_us = get_localized_string "call"
    @@hotel_email = get_localized_string "product_send_email"
    ##Links
    @@hotel_place_link="Ort"
    @@hotel_Food_Drink_link="Essen & Trinken"
    @@hotel_accommodation_link="Unterkunft"
    @@hotel_Living_link="Wohnen"
    @@hotel_sport_link="Sport"
    @@hotel_Entertainment_link="Unterhaltung"
    @@hotel_Wellness_link="Wellness"
    @@hotel_For_Children ="Für Kinder"
  end
end



