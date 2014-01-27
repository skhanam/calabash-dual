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

  end

  #All test data for different appication is in here
  def test_data
    $g_booking_data= 'features/z_dump/test_data/Bookings.xlsx'
    @@user_details=nil
  end

  def welcome_page_strings
    @@welcome_page_text="Kennen wir uns?"
    @@already_a_customer="Ich bin bereits Kunde"
    @@have_already_booked_through_TUI="Ich habe schon einmal über TUI gebucht."
    @@am_new_here="Ich bin neu hier"
    @@have_never_booked_through_TUI_before="Ich habe noch nie über TUI gebucht."
  end

  def already_customter_strings
    @@already_customer_title="Haben Sie meine TUI online bereits genutzt?"
    @@already_registered="Ich bin bereits registriert"
    @@login_with_existing_credentials="Perfekt! Melden Sie sich einfach mit Ihren bestehenden Anmeldedaten an, um diese App zu nutzen."
    @@not_yet_registered="Ich bin noch nicht registriert"
    @@register_with_booking_code="Registrieren Sie sich jetzt ganz einfach mit Ihrem Buchungscode und Anreisedatum."
  end

  def login_page_strings
    @@login_page_text="Willkommen"
    @@email_text="Benutzername oder E-Mail:"
    @@email_hint_text="Benutzername / E-Mail eingeben"
    @@password_text="Passwort:"
    @@password_hint_text="Passwort eingeben"
    @@login_button="Anmelden"
    @@password_reset="Passwort vergessen?"
    @@i_need_help="Ich benötige Hilfe"
    @@privacy_terms_of_use="Datenschutz und Nutzungsbedingungen"
  end

  def home_page_strings
    @@home_page_loading="We're looking up your holiday…"
    @@home_page_text="Susi Sonne"
    @@home_page_acc_label="background_normal"
    @@home_page_booking_summary="Auf einen Blick"

    @@home_page_account_acc_label="navbarRightButton"

  end

  def side_panel_strings
    @@side_panel_countdown="Urlaubscountdown"
    @@side_panel_weather="Reisewetter"
    @@side_panel_booking_summary="Auf einen Blick"

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
    @@countdown_countdown_message="Auf nach .*? in"
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
    @@loading_finding_your_holiday="Einen Moment bitte, wir suchen gerade Ihren Urlaub …"
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
end
