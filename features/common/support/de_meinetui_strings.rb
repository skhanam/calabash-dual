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
    image_icons_acc_label
    hotel_page_strings
    flights_strings
    terms_strings
    dest_info_strings
    insurance_strings
    my_tour_guide_strings
  end


  #All test data for different appication is in here
  def test_data
    $g_booking_data= 'features/z_dump/test_data/Bookings.xlsx'
    $g_strings= 'features/z_dump/test_data/Language_Strings.xlsx'
    $g_localized_strings=nil
    @@user_details=nil
    @@currency_hash={}
  end

  def common_strings
    @@services_phone= get_localized_string "services_phone" #Rufen Sie uns an
    @@call_us_dialog_no = get_localized_string "cancel"
    @@call_us_dialog_yes = get_localized_string "product_call_dialog_yes"
    @@currency_converter_title= get_localized_string "currency_converter" #Währungsrechner

  end

  def welcome_page_strings
    @@already_customer_title=get_localized_string "have_you_used_tui_header"
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

    @@username_email_error="Ihre Anmeldung war leider nicht erfolgreich."
  end

  def home_page_strings
    @@home_page_loading=get_localized_string "hold_on_booking"
    @@home_page_acc_label="background_normal"
    @@home_page_booking_summary=get_localized_string "booking_summary"
    @@home_page_insurance_acc=get_localized_string "insurance"
    @@home_page_account_acc_label="navbarRightButton"
    @@home_page_meet_your_travel_agent= get_localized_string "meet_your_travel_agent" #Lernen Sie Ihre Reiseleitung kennen
  end

  def insurance_strings
    @@insurance_title=get_localized_string "insurance"
  end

  def side_panel_strings
    @@side_panel_countdown=get_localized_string "countdown"
    @@side_panel_my_booking= get_localized_string "my_booking" #Meine Buchung

    @@side_panel_booking_summary=get_localized_string "booking_summary"

    @@side_panel_flight=get_localized_string "flight"
    @@side_panel_flights=get_localized_string "flights"
    @@side_panel_extra=get_localized_string "extra"
    @@side_panel_extras=get_localized_string "extras"
    @@side_panel_hotel=get_localized_string "hotel"
    @@side_panel_hotels=get_localized_string "hotels"

    @@side_panel_insurance=get_localized_string "insurance"
    @@side_panel_insurances=get_localized_string "insurances"

    @@side_panel_boat=get_localized_string "boat"
    @@side_panel_camper=get_localized_string "camper"
    @@side_panel_car_hire=get_localized_string "car_hire"

    @@side_panel_destination_info=get_localized_string "destination_info"

    @@side_panel_weather=get_localized_string "weather"
    @@side_panel_contact_us= get_localized_string "contact_us"
    @@side_panel_TandC=get_localized_string "tui_service_on_site"
    @@side_panel_my_tour_guide=get_localized_string "meet_the_rep"
    @@side_panel_my_travel_agent=get_localized_string "travelAgent_title"

    @@side_panel_destination_guide=get_localized_string "destination_guide"
    @@side_panel_excursions=get_localized_string "excursions"
    @@side_panel_good_to_know=get_localized_string "good_to_know"

    @@side_panel_travel_agent=get_localized_string "travel_agent"
    @@side_panel_tui_service_on_site=get_localized_string "tui_service_on_site"
    @@side_panel_contact_heading=get_localized_string "contact"

  end


  def my_bookings_strings
    @@my_bookings_title=get_localized_string "my_bookings"
    @@my_bookings_edit_account=get_localized_string "edit_my_account"
    @@my_bookings_past_bookings=get_localized_string "past_bookings"
    @@my_bookings_current_bookings=get_localized_string "current_bookings"
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
    @@my_account_signup_newsletter=get_localized_string "signup_to_emails"
    @@my_account_newsletter_text= get_localized_string "signup_to_emails_blurb"
    @@log_out_text=get_localized_string "logout"

    @@my_account_logout_title=get_localized_string "logout_confirm_two"
    @@my_account_logout_yes="Bestätigen"
    @@my_account_logout_no="Abbrechen"
  end

  def change_password_strings
    @@change_password_title=get_localized_string "forgot_password_header"
    @@change_password_create_new_password=get_localized_string "forgot_password_reset_pwd"
    @@change_password_info=get_localized_string "new_password_body"
    @@change_password_text2=get_localized_string "forgot_password_email_label"
    @@change_password_send_button=get_localized_string "submit"
  end


  def countdown_page_strings
    @@countdown_page_title=get_localized_string "countdown_header"
    @@countdown_share_button_text="Meinen Urlaubscountdown teilen"
    @@countdown_days_text="Tagen"
    @@countdown_hours_text="Stunden"
    @@countdown_minutes_text="Minuten"
    @@countdown_seconds_text="Sekunden"
    @@countdown_countdown_message1="Auf nach .*? in"
    @@countdown_countdown_message2="Ich fliege nach .*? in"
  end

  #
  #<string name="forgot_password_body">Bitte nennen Sie uns Ihren Benutzernamen oder Ihre E-Mail Adresse mit der Sie sich bei meine TUI registriert haben.</string>
  #<string name="new_password_body">Bitte teilen Sie uns Ihre E-Mail Adresse mit, um ein neues Passwort anzulegen.Folgen Sie danach den Anweisungen in der E-Mail, die wir Ihnen senden.</string>
  #                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        <string name="new_password_body">Bitte teilen Sie uns Ihre E-Mail Adresse mit, um ein neues Passwort anzulegen.Folgen Sie danach den Anweisungen in der E-Mail, die wir Ihnen senden.</string>

  def booking_summary_strings
    @@booking_summary_title=get_localized_string "booking_summary"
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

    @@add_a_booking_page_firstname =get_localized_string "forename"
    @@add_a_booking_page_firstname_hint ="Vorname eingeben"

    @@add_a_booking_page_last_name =get_localized_string "surname"
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

    @@new_user_registration_firstname =get_localized_string "forename"
    @@new_user_registration_firstname_hint ="Vorname eingeben"

    #screen 2
    @@new_user_registration_last_name =get_localized_string "surname"
    @@new_user_registration_last_name_hint ="Nachname eingeben"

    @@new_user_registration_booking_code ="Vorgang/Buchungscode:"
    @@new_user_registration_booking_code_hint ="123456789"

    @@new_user_registration_arrival_date ="Anreisedatum:"
    @@new_user_registration_arrival_date_hint ="Datum eingeben"
    @@new_user_registration_create_account_text2 = "Konto erstellen"

    #screen 3
    @@new_user_registration_email = get_localized_string "email" #E-Mail:
    @@new_user_registration_email_hint = "E-Mail Adresse eingeben"
    @@new_user_registration_password = "Passwort:"
    @@new_user_registration_password_hint = "Passwort eingeben"
    #screen 4
    @@new_user_registration_newsletter = "TUI Newsletter bestellen"
    @@new_user_registration_newsletter_text = get_localized_string "signup_to_emails_blurb"
    @@new_user_registration_register = "Registrieren"
    @@new_user_registration_privacy_policy = "Datenschutz"
    @@new_user_registration_need_help = "Ich benötige Hilfe"


  end

  def update_email_strings
    @@update_email_text=get_localized_string "update_email" #E-Mail ändern
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
                                "HRB 56512",
                                "Ust-Ident.-Nr. DE 812777076",
                                "Vorsitzender des Aufsichtsrates:",
                                "Dr. Michael Frenzel",
                                "Geschäftsführung: Christian Clemens (Vorsitzender)",
                                "Dr. Oliver Dörschuck",
                                "Henrik Homann"]

    @@contact_us_terms_conditions_page_title=get_localized_string "terms_title"
    @@contact_us_tui_service_title="Im Urlaub für Sie da"
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

  def flights_strings
    @@flights_page_title=get_localized_string "flight"
  end

  def dest_info_strings
    @@dest_info_screen_title = get_localized_string "destination_info"
  end

  def extra_strings
    @@car_message_minus_548= get_localized_string "car_message_minus_548" #Ihr Auto steht für Sie bereit. Wir freuen uns auf Sie!
    @@explore_tui_beach_hotel_body= get_localized_string "explore_tui_beach_hotel_body" #Macht jeden Sommer noch schöner: Sonne, Sand und Meer. Finden Sie Ihren Platz an der Sonne!
    @@explore_tui_beach_hotel_button= get_localized_string "explore_tui_beach_hotel_button" #TUI Beach Hotel entdecken
    @@explore_tui_body= get_localized_string "explore_tui_body" #Willkommen in Ihrer mobilen Reisewelt! Finden Sie heraus, welche Traumziele auf Sie warten – und welche Services diese App für Sie bereit hält.
    @@explore_tui_carousel_header= get_localized_string "explore_tui_carousel_header" #TUI Reisewelten
    @@explore_tui_classic_hotel_body= get_localized_string "explore_tui_classic_hotel_body" #Hier dreht sich alles um Sie: Qualität, Service und Komfort – wie für Sie gemacht.
    @@explore_tui_classic_hotel_button= get_localized_string "explore_tui_classic_hotel_button" #TUI Classic Hotel entdecken
    @@explore_tui_header= get_localized_string "explore_tui_header" #Entdecken Sie TUI
    @@explore_tui_lifestyle_hotel_body= get_localized_string "explore_tui_lifestyle_hotel_body" #Lassen Sie sich inspirieren und tanken Sie neue Energie an den aufregendsten Plätzen der Welt.
    @@explore_tui_lifestyle_hotel_button= get_localized_string "explore_tui_lifestyle_hotel_button" #TUI Lifestyle Hotel entdecken
    @@explore_tui_nature_hotel_body= get_localized_string "explore_tui_nature_hotel_body" #Wer Ursprünglichkeit und Ruhe sucht, wird sich hier ganz zuhause fühlen.
    @@explore_tui_nature_hotel_button= get_localized_string "explore_tui_nature_hotel_button" #TUI Nature Hotel entdecken
    @@explore_tui_premium_hotel_body= get_localized_string "explore_tui_premium_hotel_body" #Für höchste Ansprüche: Genuss und Komfort der Extraklasse an den schönsten Standorten weltweit.
    @@explore_tui_premium_hotel_button= get_localized_string "explore_tui_premium_hotel_button" #TUI Premium Hotel entdecken
    @@explore_tui_scene_hotel_body= get_localized_string "explore_tui_scene_hotel_body" #Einfach mehr aus dem Urlaub machen: Nightlife, Action und Relaxen. Hier wartet das volle Programm!
    @@explore_tui_scene_hotel_button= get_localized_string "explore_tui_scene_hotel_button" #TUI Scene Hotel entdecken
    @@explore_tui_tour= get_localized_string "explore_tui_tour" #Video ansehen
    @@explore_tui_vital_hotel_body= get_localized_string "explore_tui_vital_hotel_body" #Sie möchten auch im Urlaub aktiv bleiben? Verwöhnen Sie Körper und Geist mit unserem Wellness-Angebot.
    @@explore_tui_vital_hotel_button= get_localized_string "explore_tui_vital_hotel_button" #TUI Vital Hotel entdecken
    @@tell_us_cta_new_tui_body= get_localized_string "tell_us_cta_new_tui_body" #Ich habe noch nie über TUI gebucht.
    @@tell_us_cta_new_tui_title= get_localized_string "tell_us_cta_new_tui_title" #Ich bin neu hier
    @@tell_us_cta_with_tui_body= get_localized_string "tell_us_cta_with_tui_body" #Ich habe schon einmal über TUI gebucht.
    @@tell_us_cta_with_tui_title= get_localized_string "tell_us_cta_with_tui_title" #Ich bin bereits Kunde
    @@tell_us_header= get_localized_string "tell_us_header" #Kennen wir uns?
    @@forgot_password_body= get_localized_string "forgot_password_body" #Bitte nennen Sie uns Ihren Benutzernamen oder Ihre E-Mail Adresse mit der Sie sich bei meine TUI registriert haben.
    @@forgot_password_email_help= get_localized_string "forgot_password_email_help" #Per e-mail hilfe anforden
    @@forgot_password_email_hint= get_localized_string "forgot_password_email_hint" #Benutzername \// E-Mail eingeben
    @@forgot_password_email_label= get_localized_string "forgot_password_email_label" #Benutzername oder E-Mail:
    @@forgot_password_header= get_localized_string "forgot_password_header" #Passwort vergessen
    @@forgot_password_reset_pwd= get_localized_string "forgot_password_reset_pwd" #Neues Passwort anlegen
    @@login_email_hint= get_localized_string "login_email_hint" #Benutzername \// E-Mail eingeben
    @@login_email_tooltip= get_localized_string "login_email_tooltip" #Tipp: Das sollte die E-Mail Adresse oder der Benutzername sein mit dem Sie sich bei meine TUI registriert haben.
    @@login_country= get_localized_string "login_country" #Country
    @@login_country_extra= get_localized_string "login_country_extra" #welcome login country extra
    @@login_country_tooltip= get_localized_string "login_country_tooltip" #login_country_tooltip
    @@login_did_not_book= get_localized_string "login_did_not_book" #I did not book with TUI
    @@login_forgot_password= get_localized_string "login_forgot_password" #Passwort vergessen?
    @@login_invalid_email= get_localized_string "login_invalid_email" #Fehler beim Prüfen der E-Mail-Adresse
    @@login_login= get_localized_string "login_login" #Anmelden
    @@login_password= get_localized_string "login_password" #Passwort:
    @@login_password_hint= get_localized_string "login_password_hint" #Passwort eingeben
    @@login_password_tooltip= get_localized_string "login_password_tooltip" #Tipp: Dieses Passwort passt eventuell nicht zu Ihrem Benutzernamen/E-Mail Adresse. Bitte versuchen Sie es noch einmal.
    @@login_user_email= get_localized_string "login_user_email" #Benutzername oder E-Mail:
    @@login_welcome= get_localized_string "login_welcome" #Willkommen
    @@reset_password_error= get_localized_string "reset_password_error" #Die E-Mail mit den Hinweisen zur Kennwortzurücksetzung konnte nicht an Ihre E-Mail-Adresse zugestellt werden. Bitte wenden Sie sich an unser Service-Center.
    @@reset_password_okay= get_localized_string "reset_password_okay" #Bitte sehen Sie in Ihrem Posteingang nach. Folgen Sie den E-Mail-Anweisungen, um ein neues Passwort zu erstellen.
    @@all_you_need_to_know_about_your_boat= get_localized_string "all_you_need_to_know_about_your_boat" #Alles Wichtige über Ihr Boot
    @@bookingSummary_daysToGo= get_localized_string "bookingSummary_daysToGo" #Ihr Urlaub startet in wenigen Tagen:
    @@discover= get_localized_string "discover" #Entdecken Sie
    @@meet_your_travel_agent= get_localized_string "meet_your_travel_agent" #Lernen Sie Ihre Reiseleitung kennen
    @@pick_your_car_up_from= get_localized_string "pick_your_car_up_from" #Holen Sie Ihren Mietwagen ab
    @@step_inside= get_localized_string "step_inside" #Hereinspaziert!
    @@your_camper_is_ready= get_localized_string "your_camper_is_ready" #Ihr Camper steht für Sie bereit
    @@your_flight= get_localized_string "your_flight" #Ihr Flug
    @@accomodation= get_localized_string "accomodation" #Unterkunft
    @@boat= get_localized_string "boat" #Boot
    @@booking_summary= get_localized_string "booking_summary" #Auf einen Blick
    @@camper= get_localized_string "camper" #Camper
    @@car_hire= get_localized_string "car_hire" #Mein Mietwagen
    @@contact= get_localized_string "contact" #Kontakt
    @@contact_us= get_localized_string "contact_us" #Kontakt
    @@countdown= get_localized_string "countdown" #Urlaubscountdown
    @@excursions= get_localized_string "excursions" #Ausflüge vor Ort
    @@extra= get_localized_string "extra" #Extras
    @@extras= get_localized_string "extras" #Extras
    @@flight= get_localized_string "flight" #Flug
    @@flight_details= get_localized_string "flight_details" #Details zu meinem Flug
    @@flights= get_localized_string "flights" #Flug
    @@general_information= get_localized_string "general_information" #Allgemeine Informationen
    @@good_to_know= get_localized_string "good_to_know" #Gut zu wissen
    @@hotel= get_localized_string "hotel" #Hotel
    @@hotels= get_localized_string "hotels" #Hotel
    @@insurance= get_localized_string "insurance" #Versicherung
    @@insurances= get_localized_string "insurances" #Versicherungen
    @@meet_the_rep= get_localized_string "meet_the_rep" #Meine Reiseleitung
    @@roundtrip= get_localized_string "roundtrip" #Rundreise
    @@share_destination= get_localized_string "share_destination" #Reiseziel teilen
    @@thunderstorm= get_localized_string "thunderstorm" #thunderstorm
    @@ticket= get_localized_string "ticket" #Ticket
    @@tools= get_localized_string "tools" #Tools
    @@train= get_localized_string "train" #Bahn
    @@train_ride= get_localized_string "train_ride" #Bahnfahrt
    @@transfer= get_localized_string "transfer" #Transfer
    @@travel_agent= get_localized_string "travel_agent" #Mein Reisebüro
    @@tui_service_on_site= get_localized_string "tui_service_on_site" #TUI Service vor Ort
    @@weather= get_localized_string "weather" #Reisewetter
    @@holiday_extra= get_localized_string "holiday_extra" #Ihre Extra
    @@holiday_extras= get_localized_string "holiday_extras" #Ihre Extras
    @@currency_converter= get_localized_string "currency_converter" #Währungsrechner
    @@currency_converter_tool= get_localized_string "currency_converter_tool" #Währungsrechner
    @@select_currency= get_localized_string "select_currency" #Währung auswählen
    @@good_to_know= get_localized_string "good_to_know" #Gut zu wissen
    @@goodtoknow_blurb= get_localized_string "goodtoknow_blurb" #Nützliches Wissen für Ihr Reiseziel:
    @@land= get_localized_string "land" #Ankunft:
    @@leaving= get_localized_string "leaving" #Abflug am
    @@resort_blurb= get_localized_string "resort_blurb" #Nützliches Wissen für Ihr Reiseziel:
    @@updated_at= get_localized_string "updated_at" #Aktualisiert um [time] am [date]
    @@contact_message= get_localized_string "contact_message" #Nachricht
    @@contact_messageHint= get_localized_string "contact_messageHint" #Nachricht eingeben
    @@contact_phone= get_localized_string "contact_phone" #Telefon (optional)
    @@contact_phoneHint= get_localized_string "contact_phoneHint" #Telefonnummer eingeben
    @@contact_query_sent= get_localized_string "contact_query_sent" #Ihre Anfrage wurde erfolgreich versendet. Wir werden uns innerhalb von zwei Werktagen telefonisch oder per E-Mail bei Ihnen melden.
    @@contact_questions= get_localized_string "contact_questions" #Sie möchten mehr über Ihr Reiseziel erfahren oder einen Ausflug buchen? Wir helfen Ihnen gerne weiter!
    @@contact_reiseletung= get_localized_string "contact_reiseletung" #Meine Reiseleitung
    @@contact_sendEmail= get_localized_string "contact_sendEmail" #E-Mail senden
    @@contact_subject= get_localized_string "contact_subject" #Betreff
    @@contact_subjectHint= get_localized_string "contact_subjectHint" #Betreff auswählen
    @@disclaimer= get_localized_string "disclaimer" #Impressum
    @@we_are_here_for_you= get_localized_string "we_are_here_for_you" #So erreichen Sie uns
    @@boat_share_during_fb= get_localized_string "boat_share_during_fb" #Ich bin gerade auf meinem Boot [boat] in [region], [location] in meinem #TUI #Urlaub
    @@boat_share_during_tw= get_localized_string "boat_share_during_tw" #Ich bin gerade auf meinem Boot [boat] in [region], [location] mit #TUI
    @@boat_share_pre_fb= get_localized_string "boat_share_pre_fb" #In [days] Tagen bin ich an Deck des Boots [boat] in [region], [location] in meinem #TUI #Urlaub!
    @@boat_share_pre_tw= get_localized_string "boat_share_pre_tw" #In [days] Tagen bin ich an Deck des Boots [boat] in [location] mit #TUI!
    @@boat_share_today_fb= get_localized_string "boat_share_today_fb" #Bald bin ich auf meinem Boot [boat] in [region], [location] in meinem #TUI #Urlaub!
    @@boat_share_today_tw= get_localized_string "boat_share_today_tw" #Bald bin ich auf meinem Boot [boat] in [location] mit #TUI!
    @@camper_share_during_fb= get_localized_string "camper_share_during_fb" #Ich bin gerade mit meinem #TUI Camper unterwegs in [region], [location]
    @@camper_share_during_tw= get_localized_string "camper_share_during_tw" #Ich mache gerade Urlaub im Camper mit #TUI in [region], [location]
    @@camper_share_pre_fb= get_localized_string "camper_share_pre_fb" #In [days] Tagen sitze ich am Steuer meines #TUI Campers in [region], [location]!
    @@camper_share_pre_tw= get_localized_string "camper_share_pre_tw" #Noch [days] Tage bis zu meinem Camper Urlaub mit #TUI in [region], [location]!
    @@camper_share_today_fb= get_localized_string "camper_share_today_fb" #Heute startet mein #TUI Camper #Urlaub in [region], [location]!
    @@camper_share_today_tw= get_localized_string "camper_share_today_tw" #Ich bin weg mit meinem Camper und #TUI in [region], [location]!
    @@countdown_share_during_fb= get_localized_string "countdown_share_during_fb" #Ich mache gerade #Urlaub in [location] mit #TUI
    @@countdown_share_during_tw= get_localized_string "countdown_share_during_tw" #Ich mache gerade #Urlaub in [location] mit #TUI
    @@countdown_share_pre_fb= get_localized_string "countdown_share_pre_fb" #Nur noch [days] Tage, dann geht es nach [location] in meinen #TUI #Urlaub!
    @@countdown_share_pre_tw= get_localized_string "countdown_share_pre_tw" #Noch [days] Tage bis zu meinem Urlaub in [location] mit #TUI!
    @@countdown_share_today_fb= get_localized_string "countdown_share_today_fb" #Heute geht es nach [location] in meinen #TUI #Urlaub!
    @@countdown_share_today_tw= get_localized_string "countdown_share_today_tw" #Ich fahre heute nach [location] mit #TUI!
    @@destination_share_during_fb= get_localized_string "destination_share_during_fb" #Ich mache gerade #Urlaub in [location] mit #TUI
    @@destination_share_during_tw= get_localized_string "destination_share_during_tw" #Ich mache gerade Urlaub mit #TUI in [location]
    @@destination_share_pre_fb= get_localized_string "destination_share_pre_fb" #Nur noch [days] Tage bis zu meinem #TUI #Urlaub in [location]!
    @@destination_share_pre_tw= get_localized_string "destination_share_pre_tw" #Noch [days] Tage bis zu meinem Urlaub mit #TUI in [location]!
    @@destination_share_today_fb= get_localized_string "destination_share_today_fb" #Ich fahre heute nach [location] in meinen #Urlaub mit #TUI!
    @@destination_share_today_tw= get_localized_string "destination_share_today_tw" #Bald beginnt mein Urlaub in [location] mit #TUI!
    @@excursion_share_fb= get_localized_string "excursion_share_fb" #Ich mache einen Ausflug mit #TUI: [excursion]
    @@excursion_share_tw= get_localized_string "excursion_share_tw" #Ich mache einen Ausflug mit #TUI: [excursion]
    @@flight_share_pre_fb= get_localized_string "flight_share_pre_fb" #Nur noch [days] Tage bis zu meinem Flug nach [location] in meinen #TUI #Urlaub!
    @@flight_share_pre_tw= get_localized_string "flight_share_pre_tw" #Noch [days] Tage bis zu meinem Flug nach [location] mit #TUI!
    @@flight_share_today_fb= get_localized_string "flight_share_today_fb" #Heute fliege ich nach [location] in meinen #TUI #Urlaub!
    @@flight_share_today_tw= get_localized_string "flight_share_today_tw" #Ich fliege heute nach [location] in meinen Urlaub mit #TUI!
    @@hotel_share_during_fb= get_localized_string "hotel_share_during_fb" #Ich entspanne gerade im [hotel], [resort] in [location] in meinem #TUI #Urlaub
    @@hotel_share_during_tw= get_localized_string "hotel_share_during_tw" #Ich entspanne gerade im [hotel], [resort] in [location] mit #TUI
    @@hotel_share_pre_fb= get_localized_string "hotel_share_pre_fb" #Nur noch [days] Tage bis zu meinem #TUI #Urlaub im [hotel], [resort] in [location]!
    @@hotel_share_pre_tw= get_localized_string "hotel_share_pre_tw" #Noch [days] Tage bis zu meinem Aufenthalt im [hotel] in [location] mit #TUI!
    @@hotel_share_today_fb= get_localized_string "hotel_share_today_fb" #Heute fahre ich in meinen #TUI #Urlaub im [hotel], [resort] in [location]!
    @@hotel_share_today_tw= get_localized_string "hotel_share_today_tw" #Heute fahre ich mit #TUI nach [location], in das [hotel], [resort]!
    @@roundtrip_share_during_fb= get_localized_string "roundtrip_share_during_fb" #Ich entdecke gerade [location] auf meiner Rundreise [trip] mit #TUI
    @@roundtrip_share_during_tw= get_localized_string "roundtrip_share_during_tw" #Ich bin gerade auf meiner Rundreise [trip] mit #TUI in [location]
    @@roundtrip_share_pre_fb= get_localized_string "roundtrip_share_pre_fb" #Nur noch [days] Tage bis zu meiner Rundreise [trip] mit #TUI in [location]!
    @@roundtrip_share_pre_tw= get_localized_string "roundtrip_share_pre_tw" #Noch [days] Tage bis zu meiner Rundreise [trip] mit #TUI in [location]!
    @@roundtrip_share_today_fb= get_localized_string "roundtrip_share_today_fb" #Gleich beginnt meine Rundreise [trip] mit #TUI in [location]!
    @@roundtrip_share_today_tw= get_localized_string "roundtrip_share_today_tw" #Gleich startet meine Rundreise [trip] mit #TUI in [location]!
    @@share_my_boat= get_localized_string "share_my_boat" #Meine Bootdetails teilen
    @@share_my_camper= get_localized_string "share_my_camper" #Meine Camperdetails teilen
    @@share_my_flight= get_localized_string "share_my_flight" #Meine Flugdetails teilen
    @@share_my_roundtrip= get_localized_string "share_my_roundtrip" #Meine Rundreisedetails teilen
    @@share_nofacebook_support_message= get_localized_string "share_nofacebook_support_message" #Sie haben auf Ihrem Smartphone keinen Account für Facebook eingerichtet. Bitte besuchen Sie dazu Ihre Einstellungen.
    @@share_nofacebook_support_title= get_localized_string "share_nofacebook_support_title" #Facebook mobil einrichten
    @@share_notwitter_support_message= get_localized_string "share_notwitter_support_message" #Sie haben auf Ihrem Smartphone keinen Account für Facebook/Twitter eingerichtet. Bitte besuchen Sie dazu Ihre Einstellungen.
    @@share_notwitter_support_title= get_localized_string "share_notwitter_support_title" #Twitter mobil einrichten
    @@weather_share_during_fb= get_localized_string "weather_share_during_fb" #Heute beginnt mein #TUI #Urlaub und es hat [temperature] Grad in [location]!
    @@weather_share_during_tw= get_localized_string "weather_share_during_tw" #Ich mache gerade Urlaub mit #TUI in [location] und es sind heute [temperature] Grad
    @@weather_share_pre_fb= get_localized_string "weather_share_pre_fb" #Nur noch [days] Tage bis zu meinem #TUI #Urlaub und es sind heute [temperature] Grad in [location]!
    @@weather_share_pre_tw= get_localized_string "weather_share_pre_tw" #Noch [days] Tage bis zu meinem Urlaub mit #TUI und es sind heute [temperature] Grad in [location]!
    @@weather_share_today_fb= get_localized_string "weather_share_today_fb" #Ich mache gerade #TUI #Urlaub in [location] und es sind heute [temperature] Grad
    @@weather_share_today_tw= get_localized_string "weather_share_today_tw" #Ich bin dann mal weg mit #TUI! Heute hat es [temperature] Grad in [location]
    @@product_share_my_accommodation= get_localized_string "product_share_my_accommodation" #Meine Unterkunft teilen
    @@bookingSummary_bookingReference= get_localized_string "bookingSummary_bookingReference" #Vorgang/Buchungsnummer:
    @@bookingSummary_emailDescription= get_localized_string "bookingSummary_emailDescription" #Sie können Ihre Buchungsübersicht auch bequem per E-Mail versenden.
    @@bookingSummary_emailTitle= get_localized_string "bookingSummary_emailTitle" #Meine Buchung senden
    @@bookingSummary_leadPassenger= get_localized_string "bookingSummary_leadPassenger" #Gebucht für:
    @@bookingSummary_quote= get_localized_string "bookingSummary_quote" #Bitte teilen Sie uns diese Nummer mit, wenn Sie uns bei Fragen zu Ihrer Buchung kontaktieren.
    @@bookingsummary_share_subject= get_localized_string "bookingsummary_share_subject" #Meine Buchung auf einen Blick
    @@bookingSummary_viewType= get_localized_string "bookingSummary_viewType" #Meine [type]details ansehen
    @@bookingSummary_yourParty= get_localized_string "bookingSummary_yourParty" #Weitere Reisende:
    @@current_bookings= get_localized_string "current_bookings" #Aktuelle Buchungen
    @@my_booking= get_localized_string "my_booking" #Meine Buchung
    @@car_message_plus_1= get_localized_string "car_message_plus_1" #Hatten Sie eine gute Fahrt?
    @@car_message_zero= get_localized_string "car_message_zero" #Ihr Auto wartet schon auf Sie. Bis gleich!
    @@extra_message_minus_548= get_localized_string "extra_message_minus_548" #Ihre Extras sind gebucht. Wir freuen uns auf Sie!
    @@extra_message_plus_1= get_localized_string "extra_message_plus_1" #Hatten Sie eine gute Reise?
    @@extra_message_zero= get_localized_string "extra_message_zero" #Genießen Sie Ihren Urlaub mit allen Extras!
    @@holiday_message_minus_1= get_localized_string "holiday_message_minus_1" #morgen geht's los! Haben Sie an alles gedacht?
    @@holiday_message_minus_14= get_localized_string "holiday_message_minus_14" #Ihre Reise steht vor der Tür. Sind Sie schon urlaubsreif?
    @@holiday_message_minus_2= get_localized_string "holiday_message_minus_2" #schon aufgeregt? Wir freuen uns, Sie bald begrüßen zu dürfen!
    @@holiday_message_minus_3= get_localized_string "holiday_message_minus_3" #nur noch [days] mal schlafen, dann geht's endlich los!
    @@holiday_message_minus_548= get_localized_string "holiday_message_minus_548" #bald geht's in den Urlaub!
    @@holiday_message_plus_1= get_localized_string "holiday_message_plus_1" #willkommen zurück! Wir hoffen, Sie hatten einen schönen Urlaub
    @@holiday_message_plus_7= get_localized_string "holiday_message_plus_7" #sind Sie schon wieder reif für [location]?
    @@holiday_message_zero= get_localized_string "holiday_message_zero" #wir wünschen Ihnen einen schönen Urlaub!
    @@insurance_message_minus_548= get_localized_string "insurance_message_minus_548" #Gut versichert ist der halbe Urlaub. Bis bald bei TUI!
    @@insurance_message_plus_1= get_localized_string "insurance_message_plus_1" #Hatten Sie eine gute Reise?
    @@insurance_message_zero= get_localized_string "insurance_message_zero" #Ihr Urlaub kann nun sicher beginnen.
    @@find_booking= get_localized_string "find_booking" #Buchung hinzufügen
    @@countdown_active= get_localized_string "countdown_active" #Ich bin im Urlaub!
    @@countdown_day= get_localized_string "countdown_day" #Tag
    @@countdown_days= get_localized_string "countdown_days" #Tagen
    @@countdown_generic= get_localized_string "countdown_generic" #Auf nach [location] in
    @@countdown_header= get_localized_string "countdown_header" #Mein Urlaubscountdown
    @@countdown_hours= get_localized_string "countdown_hours" #Stunden
    @@countdown_minutes= get_localized_string "countdown_minutes" #Minuten
    @@countdown_seconds= get_localized_string "countdown_seconds" #Sekunden
    @@countdown_share= get_localized_string "countdown_share" #Meinen Urlaubscountdown teilen
    @@countdown_today= get_localized_string "countdown_today" #Ich hebe ab in den Urlaub in
    @@countdown_waiting= get_localized_string "countdown_waiting" #Ich fliege nach [location] in
    @@day_to_go= get_localized_string "day_to_go" #Tag noch
    @@days_to_go= get_localized_string "days_to_go" #Tage noch
    @@past_bookings= get_localized_string "past_bookings" #Vergangene Buchungen
    @@booking_details= get_localized_string "booking_details" #Ihre Buchungsdetails
    @@booking_details_blurb= get_localized_string "booking_details_blurb" #Haben Sie Ihre Reiseunterlagen zur Hand? Bitte geben Sie hier Ihre Daten ein, um eine Buchung hinzuzufügen.
    @@i_need_help= get_localized_string "i_need_help" #Ich benötige Hilfe
    @@destination_info= get_localized_string "destination_info" #Infos über Ihr Reiseland
    @@cloudy= get_localized_string "cloudy" #Bewölkt
    @@forecast_for= get_localized_string "forecast_for" #Vorhersage für
    @@lightning= get_localized_string "lightning" #Gewitter
    @@overcast= get_localized_string "overcast" #Bedeckt
    @@partially_cloudy= get_localized_string "partially_cloudy" #Leicht bewölkt
    @@rain= get_localized_string "rain" #Regen
    @@share_weather= get_localized_string "share_weather" #Reisewetter teilen
    @@snow= get_localized_string "snow" #Schnee
    @@sunny= get_localized_string "sunny" #Sonnig
    @@terms_title= get_localized_string "terms_title" #Datenschutz und Nutzungsbedingungen
    @@to= get_localized_string "to" #nach
    @@weather_forecast= get_localized_string "weather_forecast" #Vorhersage für [location]
    @@weather_header= get_localized_string "weather_header" #Reisewetter
    @@weather_share= get_localized_string "weather_share" #Reisewetter teilen
    @@booked_for= get_localized_string "booked_for" #Gebucht für:
    @@category= get_localized_string "category" #Kategorie
    @@my_accomodation= get_localized_string "my_accomodation" #Meine Unterkunft
    @@overview= get_localized_string "overview" #Überblick
    @@period_of_travel= get_localized_string "period_of_travel" #Reisezeitraum:
    @@rooms= get_localized_string "rooms" #Zimmertyp
    @@share_my_accomodation= get_localized_string "share_my_accomodation" #Meine Unterkunft teilen
    @@address= get_localized_string "address" #Adresse
    @@awards= get_localized_string "awards" #Auszeichnungen
    @@bookedFor= get_localized_string "bookedFor" #Gebucht für
    @@call= get_localized_string "call" #Rufen Sie uns an
    @@category= get_localized_string "category" #Kategorie:
    @@countryName= get_localized_string "countryName" #Land
    @@customer_satisfaction= get_localized_string "customer_satisfaction" #Kundenzufriedenheit
    @@dropoffDateTime= get_localized_string "dropoffDateTime" #Rückgabe
    @@location= get_localized_string "location" #Lage
    @@locationName= get_localized_string "locationName" #Ort
    @@name= get_localized_string "name" #Name
    @@numberOfAdults= get_localized_string "numberOfAdults" #Anzahl der Erwachsenen
    @@numberOfChildren= get_localized_string "numberOfChildren" #Anzahl der Kinder
    @@numberOfInfants= get_localized_string "numberOfInfants" #Anzahl der Säuglinge
    @@numberOfPax= get_localized_string "numberOfPax" #Gesamtzahl der Personen
    @@owner= get_localized_string "owner" #Anbieter
    @@period_of_travel= get_localized_string "period_of_travel" #Reisezeitraum:
    @@pickupDateTime= get_localized_string "pickupDateTime" #Abholung
    @@product_call_dialog_message= get_localized_string "product_call_dialog_message" #Sind Sie sicher?
    @@product_call_dialog_no= get_localized_string "product_call_dialog_no" #Nein
    @@product_call_dialog_title= get_localized_string "product_call_dialog_title" #Nummer [number]
    @@product_call_dialog_yes= get_localized_string "product_call_dialog_yes" #Ja
    @@product_call_us= get_localized_string "product_call_us" #Rufen Sie uns an
    @@product_send_email= get_localized_string "product_send_email" #E-Mail schreiben
    @@productTitle= get_localized_string "productTitle" #Produktname
    @@resortName= get_localized_string "resortName" #Resort
    @@rooms= get_localized_string "rooms" #Zimmer:
    @@shortDescription= get_localized_string "shortDescription" #Kurzbeschreibung
    @@startDate= get_localized_string "startDate" #Abholung
    @@supplier= get_localized_string "supplier" #Anbieter
    @@supplierName= get_localized_string "supplierName" #Anbieter
    @@tickets= get_localized_string "tickets" #Tickets
    @@titles_to_split_by_colon= get_localized_string "titles_to_split_by_colon" #Ohne:Dr.:Prof.:Prof. Dr.
    @@transfer= get_localized_string "transfer" #Transfer
    @@transfers= get_localized_string "transfers" #Transfer
    @@airline= get_localized_string "airline" #Airline:
    @@approximate= get_localized_string "approximate" #Voraussichtliche
    @@approximate_arrival= get_localized_string "approximate_arrival" #Voraussichtliche Ankunft
    @@approximate_departure= get_localized_string "approximate_departure" #Voraussichtlicher Abflug
    @@cabin_class= get_localized_string "cabin_class" #Kabinenklasse:
    @@flight_number= get_localized_string "flight_number" #Flugnummer:
    @@flights_airport_information= get_localized_string "flights_airport_information" #Flughafen Infos
    @@flights_carrier_information= get_localized_string "flights_carrier_information" #Airline Infos
    @@passengers= get_localized_string "passengers" #Personen:
    @@take_off= get_localized_string "take_off" #Abflug:
    @@book_with_tui_service= get_localized_string "book_with_tui_service" #Beim TUI Service vor Ort anfragen
    @@excursion_email= get_localized_string "excursion_email" #Beim TUI Service vor Ort anfragen
    @@excursions_here_available= get_localized_string "excursions_here_available" #Diese Ausflüge warten auf Sie:
    @@experience_the_country= get_localized_string "experience_the_country" #Land und Leute hautnah erleben
    @@share_my_excursion= get_localized_string "share_my_excursion" #Diesen Ausflug teilen
    @@contact_tui_services= get_localized_string "contact_tui_services" #TUI Service vor Ort kontaktieren
    @@service_on_site= get_localized_string "service_on_site" #TUI Service vor Ort
    @@services_email= get_localized_string "services_email" #Schreiben Sie uns eine E-Mail
    @@services_phone= get_localized_string "services_phone" #Rufen Sie uns an
    @@services_text= get_localized_string "services_text" #Schreiben Sie uns eine SMS
    @@travelAgent_description= get_localized_string "travelAgent_description" #E-Mail an mein Reisebüro
    @@travelAgent_email= get_localized_string "travelAgent_email" #E-Mail an mein Reisebüro
    @@travelAgent_phone= get_localized_string "travelAgent_phone" #Mein Reisebüro anrufen
    @@travelAgent_title= get_localized_string "travelAgent_title" #Mein Reisebüro
    @@travelAgent_website= get_localized_string "travelAgent_website" #Website besuchen
    @@hold_on= get_localized_string "hold_on" #Einen Moment bitte …
    @@hold_on_booking= get_localized_string "hold_on_booking" #Einen Moment bitte, wir suchen gerade Ihren Urlaub …
    @@have_you_used_tui_cta_logged_body= get_localized_string "have_you_used_tui_cta_logged_body" #Perfekt! Melden Sie sich einfach mit Ihren bestehenden Anmeldedaten an, um diese App zu nutzen.
    @@have_you_used_tui_cta_logged_title= get_localized_string "have_you_used_tui_cta_logged_title" #Ich bin bereits registriert
    @@have_you_used_tui_cta_not_logged_body= get_localized_string "have_you_used_tui_cta_not_logged_body" #Registrieren Sie sich jetzt mit Ihrem Buchungscode und Anreisedatum.
    @@have_you_used_tui_cta_not_logged_title= get_localized_string "have_you_used_tui_cta_not_logged_title" #Ich bin noch nicht registriert
    @@have_you_used_tui_header= get_localized_string "have_you_used_tui_header" #Haben Sie meine TUI online bereits genutzt?
    @@my_bookings= get_localized_string "my_bookings" #Meine Buchungen
    @@april= get_localized_string "april" #April
    @@august= get_localized_string "august" #August
    @@datetime= get_localized_string "datetime" #DD.MM YYYY HH:mm
    @@december= get_localized_string "december" #Dezember
    @@february= get_localized_string "february" #Februar
    @@january= get_localized_string "january" #Januar
    @@july= get_localized_string "july" #Juli
    @@june= get_localized_string "june" #Juni
    @@longdate= get_localized_string "longdate" #dddd, DD. MMMM YYYY
    @@march= get_localized_string "march" #März
    @@may= get_localized_string "may" #Mai
    @@mediumdate= get_localized_string "mediumdate" #DD. MMMM YYYY
    @@november= get_localized_string "november" #November
    @@october= get_localized_string "october" #Oktober
    @@september= get_localized_string "september" #September
    @@shortdate= get_localized_string "shortdate" #DD.MM.YYYY
    @@til= get_localized_string "til" #bis
    @@time= get_localized_string "time" #HH:mm
    @@today= get_localized_string "today" #Heute
    @@tomorrow= get_localized_string "tomorrow" #Morgen
    @@email_help_body= get_localized_string "email_help_body" #Bitte füllen Sie folgende Felder aus oder prüfen Sie die nachstehenden Daten, damit wir Ihnen weiterhelfen können.\n\nVorname: \nNachname: \nE-Mail Adresse: \nTelefonnummer: \nStraße u. Hausnummer: \nPostleitzahl (optional): \nVorgang/Buchungscode: \nAnreisedatum: \nReiseziel: \n\nBitte geben Sie hier mögliche Fragen oder Anregungen ein: \n
    @@email_help_subject= get_localized_string "email_help_subject" #Ich benötige Hilfe bei der Anmeldung
    @@email_help_subject_booking= get_localized_string "email_help_subject_booking" #Ich benötige Hilfe bei einer Buchung
    @@email_help_subject_hotel= get_localized_string "email_help_subject_hotel" #TUI Guest Request / TUI Gast Anfrage
    @@email_help_subject_registration= get_localized_string "email_help_subject_registration" #Ich benötige Hilfe bei der Registrierung
    @@email_impressum= get_localized_string "email_impressum" #TUI Deutschland GmbH, Karl-Wiechert-Allee 23, 30625 Hannover \n \n Telefon 05 11 / 5 67-0 \n Telefax 05 11 / 5 67-13 01 \n E-Mail: info@tui.de \n Handelsregister, Amtsgericht Hannover, HRB 56512 \n \n Ust-Ident.-Nr. DE 812777076 \n \n Vorsitzender des Aufsichtsrates: Dr. Michael Frenzel \n Geschäftsführung: Christian Clemens (Vorsitzender), \n Dr. Oliver Dörschuck, Henrik Homann \n \n
    @@error_default_body= get_localized_string "error_default_body" #Es tut uns leid, diese Seite konnte nicht geladen werden. Bitte versuchen Sie eine andere Seite zu öffnen oder schließen Sie die App und versuchen Sie es später erneut.
    @@error_default_header= get_localized_string "error_default_header" #Es ist etwas schief gelaufen
    @@error_no_internet_body= get_localized_string "error_no_internet_body" #Sie benötigen eine Internetverbindung, um diese Seite zu öffnen. Bitte laden Sie die Seite neu.
    @@error_no_internet_header= get_localized_string "error_no_internet_header" #Verbindung erforderlich
    @@error_no_internet_refresh= get_localized_string "error_no_internet_refresh" #Neu laden
    @@notification_no_internet_connection= get_localized_string "notification_no_internet_connection" #KEINE INTERNETVERBINDUNG
    @@notification_page_last_updated= get_localized_string "notification_page_last_updated" #Seite zuletzt aktualisiert: [date] um [time]
    @@notification_page_outdated= get_localized_string "notification_page_outdated" #SEITE NICHT AKTUELL
    @@services_description= get_localized_string "services_description" #Contact Reiseleitung by email
    @@services_numbers= get_localized_string "services_numbers" #Übrigens: Sie wählen eine deutsche Telefonnummer, sprechen aber mit unseren Experten vor Ort.
    @@services_questions= get_localized_string "services_questions" #Questions or requests regarding your holiday or destination? Book an excursion?
    @@car= get_localized_string "car" #Mietwagen
    @@email_noemail_message= get_localized_string "email_noemail_message" #Sie haben auf Ihrem Smartphone kein E-Mail-Postfach eingerichtet. Bitte besuchen Sie dazu Ihre Einstellungen.
    @@email_noemail_title= get_localized_string "email_noemail_title" #Mobile E-Mail einrichten
    @@generic_field_validation= get_localized_string "generic_field_validation" #Bitte überprüfen Sie, ob alle Pflichtfelder ausgefüllt sind.
    @@map_android_version_not_uptodate= get_localized_string "map_android_version_not_uptodate" #Google Play aktualisieren
    @@map_android_version_not_uptodate_message= get_localized_string "map_android_version_not_uptodate_message" #Sie verwenden momentan nicht die aktuellste Version auf Ihrem Smartphone. Bitte aktualisieren Sie Ihren Google Play Service für die korrekte Darstellung der Karte.
    @@please_reauthenticate= get_localized_string "please_reauthenticate" #Ihre Sitzung ist abgelaufen, bitte melden Sie sich erneut an
    @@url_dialog_buttons_to_split_by_colon= get_localized_string "url_dialog_buttons_to_split_by_colon" #Abbrechen:Ja
    @@meet_the_rep_help= get_localized_string "meet_the_rep_help" #Falls Sie Fragen oder Wünsche haben, können Sie mich telefonisch, per SMS oder per E-Mail über den TUI Service 24 Stunden am Tag erreichen. Falls ich nicht zu sprechen bin, ist einer meiner Kollegen gerne für Sie da.
    @@meet_the_rep_information_sessions= get_localized_string "meet_the_rep_information_sessions" #InfoStunde:
    @@meet_the_rep_tui_welcome= get_localized_string "meet_the_rep_tui_welcome" #Welcome:
    @@cancel= get_localized_string "cancel" #Abbrechen
    @@change_password= get_localized_string "change_password" #Passwort ändern
    @@confirm= get_localized_string "confirm" #Bestätigen
    @@create_new_password= get_localized_string "create_new_password" #Neues Passwort anlegen
    @@destination_guide= get_localized_string "destination_guide" #Infos über Ihr Reiseland
    @@edit_my_account= get_localized_string "edit_my_account" #Konto bearbeiten
    @@email= get_localized_string "email" #E-Mail:
    @@forename= get_localized_string "forename" #Vorname:
    @@logout= get_localized_string "logout" #Abmelden
    @@logout_confirm= get_localized_string "logout_confirm" #Sind Sie sicher?
    @@logout_confirm_two= get_localized_string "logout_confirm_two" #Abmelden?
    @@my_account= get_localized_string "my_account" #Mein Konto
    @@new_email= get_localized_string "new_email" #Neue E-Mail:
    @@new_email_hint_text= get_localized_string "new_email_hint_text" #Neue E-Mail Adresse eingeben
    @@new_password= get_localized_string "new_password" #New password:
    @@new_password_body= get_localized_string "new_password_body" #Bitte teilen Sie uns Ihre E-Mail Adresse mit, um ein neues Passwort anzulegen. Folgen Sie danach den Anweisungen in der E-Mail, die wir Ihnen senden.
    @@personal_details= get_localized_string "personal_details" #Persönliche Angaben
    @@submit= get_localized_string "submit" #Speichern
    @@surname= get_localized_string "surname" #Nachname:
    @@update_email= get_localized_string "update_email" #E-Mail ändern
    @@update_email_hint= get_localized_string "update_email_hint" #Email:
    @@update_email_password= get_localized_string "update_email_password" #Ihr Passwort:
    @@update_reminder= get_localized_string "update_reminder" #Bitte beachten Sie, dass Sie diese E-Mail Adresse zukünftig auch auf meine-tui.de verwenden müssen.
    @@username= get_localized_string "username" #Benutzername:
    @@your_password= get_localized_string "your_password" #Ihr Passwort:
    @@privacy_policy_header= get_localized_string "privacy_policy_header" #Datenschutz
    @@is_this_you= get_localized_string "is_this_you" #Sind Sie das?
    @@is_this_you_introduction= get_localized_string "is_this_you_introduction" #Wir möchten sicherstellen, dass Sie der Kontoinhaber sind. Bitte geben Sie Ihre Postleitzahl ein, um Ihre Identität zu bestätigen und die Registrierung abzuschließen
    @@salutations_to_split_by_colon= get_localized_string "salutations_to_split_by_colon" #Herr:Frau
    @@signup_create_account= get_localized_string "signup_create_account" #Konto erstellen
    @@signup_departure_start_date= get_localized_string "signup_departure_start_date" #Anreisedatum:
    @@signup_departure_start_date_hint= get_localized_string "signup_departure_start_date_hint" #Datum eingeben
    @@signup_email= get_localized_string "signup_email" #E-Mail:
    @@signup_email_help= get_localized_string "signup_email_help" #Per E-Mail Hilfe anfordern
    @@signup_email_hint= get_localized_string "signup_email_hint" #E-Mail Adresse eingeben
    @@signup_first_name= get_localized_string "signup_first_name" #Vorname:
    @@signup_first_name_hint= get_localized_string "signup_first_name_hint" #Vorname eingeben
    @@signup_lastName= get_localized_string "signup_lastName" #Nachname:
    @@signup_lastName_hint= get_localized_string "signup_lastName_hint" #Nachname eingeben
    @@signup_not_me= get_localized_string "signup_not_me" #Das bin ich nicht
    @@signup_password= get_localized_string "signup_password" #Passwort:
    @@signup_password_hint= get_localized_string "signup_password_hint" #Passwort eingeben
    @@signup_preamble= get_localized_string "signup_preamble" #Bitte geben Sie Ihren Vor- und Nachnamen exakt wie auf Ihren Reiseunterlagen an, sowie den dazugehörigen Vorgang/Buchungscode und Ihr Anreisedatum.
    @@signup_privacy_cta= get_localized_string "signup_privacy_cta" #Datenschutz
    @@signup_process_booking_code= get_localized_string "signup_process_booking_code" #Vorgang/Buchungscode:
    @@signup_process_booking_code_hint= get_localized_string "signup_process_booking_code_hint" #123456789
    @@signup_salutation= get_localized_string "signup_salutation" #Anrede:
    @@signup_selector= get_localized_string "signup_selector" #Bitte auswählen
    @@signup_signup= get_localized_string "signup_signup" #Konto erstellen
    @@signup_signup_cta= get_localized_string "signup_signup_cta" #Registrieren
    @@signup_successful= get_localized_string "signup_successful" #Sie sind nur noch einen Schritt von Ihrer Registrierung entfernt: Bitte prüfen Sie Ihre E-Mails und klicken Sie auf den darin enthaltenen Aktivierungslink
    @@signup_title= get_localized_string "signup_title" #Titel:
    @@signup_to_emails= get_localized_string "signup_to_emails" #TUI Newsletter bestellen
    @@signup_to_emails_blurb= get_localized_string "signup_to_emails_blurb" #Ja, ich möchte regelmäßig tolle Angebote und News rund um das Thema Urlaub per E-Mail erhalten. (Meine Daten werden nicht an Dritte weitergegeben und ich kann meine Einwilligung jederzeit widerrufen.)
    @@signup_unsuccessful= get_localized_string "signup_unsuccessful" #Die Registrierung war leider nicht erfolgreich
    @@signup_verify= get_localized_string "signup_verify" #Bestätigen
    @@signup_your_booking= get_localized_string "signup_your_booking" #Ihre Buchung
    @@time= get_localized_string "time" #HH:mm
    @@your_postcode= get_localized_string "your_postcode" #Ihre Postleitzahl:
    @@are_you_sure= get_localized_string "are_you_sure" #Sind Sie sicher?
    @@done= get_localized_string "done" #Fertig
    @@next= get_localized_string "next" #Weiter
    @@no_change_submitted= get_localized_string "no_change_submitted" #E-Mail ändern: Es wurde keine Änderung vorgenommen.
    @@open_in_safari= get_localized_string "open_in_safari" #In browser öffnen
    @@previous= get_localized_string "previous" #Zurück
    @@water= get_localized_string "water" #Wasser
    @@notification_no_internet_connection= get_localized_string "notification_no_internet_connection" #KEINE INTERNETVERBINDUNG
    @@notification_page_outdated= get_localized_string "notification_page_outdated" #SEITE NICHT AKTUELL
    @@notification_page_last_updated= get_localized_string "notification_page_last_updated" #Seite zuletzt aktualisiert: [date] um [time]
    @@cantFindBooking_errorMsg= get_localized_string "cantFindBooking_errorMsg" #Sorry, we can't find your booking for you!
    @@cantFindBooking_switchTo= get_localized_string "cantFindBooking_switchTo" #Switch to
    @@cantFindBooking_de= get_localized_string "cantFindBooking_de" #Germany
    @@cantFindBooking_ch= get_localized_string "cantFindBooking_ch" #Switzerland
    @@cantFindBooking_at= get_localized_string "cantFindBooking_at" #Austria
    @@cantFindBooking_ctaSwitch= get_localized_string "cantFindBooking_ctaSwitch" #Switch
    @@cantFindBooking_addBookingTitle= get_localized_string "cantFindBooking_addBookingTitle" #Or would you like to add a booking?
    @@cantFindBooking_ctaAddBooking= get_localized_string "cantFindBooking_ctaAddBooking" #Add a booking
    @@cantFindBooking_tryThese= get_localized_string "cantFindBooking_tryThese" #Did you book with our [partner] or [partner1] partners?

  end

end



