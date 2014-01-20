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
    login_options_strings
    login_page_strings
    home_page_strings
    side_panel_strings
    countdown_page_strings
    weather_page_strings
    booking_summary_strings
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

  def login_options_strings
    @@login_options_text="Haben Sie meine TUI online bereits genutzt?"
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

  end

  def side_panel_strings
    @@side_panel_countdown="Urlaubscountdown"
    @@side_panel_weather="Reisewetter"
    @@side_panel_booking_summary="Auf einen Blick"

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
  end


end