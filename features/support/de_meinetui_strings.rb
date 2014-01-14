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
    welcome_messages
  end

  #All test data for different appication is in here
  def test_data
    $g_booking_data= 'features/z_dump/test_data/Bookings.xlsx'
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
  end

  def side_panel_strings
    @@side_panel_countdown="Urlaubscountdown"
    @@side_panel_weather="Reisewetter"
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

  def weather_page_strings
    @@weather_page_title="Reisewetter"
  end


  def welcome_messages
    @@welcome_hi_text="Hi \\w+,"
    @@welcome_tips="Welcome to your personalised travel companion. Check back for handy tips and updates!"
    @@welcome_at_destination="Welcome to \\w+! We hope you have a great holiday. If you need anything, just get in touch."
    @@welcome_countdown_days="It 's the final countdown, your holiday to \\w+ is just days away."
    @@welcome_countdown_tomorrow="This time tomorrow you’ll be in \\w+ - don' t forget to pack your passport!"
    @@welcome_countdown_month="Your holiday to \\w+ is less than a month away! Is your passport is in date\\?"
    @@welcome_excursion="We’ve found \\d+ excursion(s) for you in \\w+. Take a look now!"
    @@welcome_extras_available="We've found \\d+ extra(|s) available to you. Take a look now!"
    @@welcome_dont_forget_flight="Don 't forget your flight departs"
    @@welcome_weather="Good news"
    @@welcome_need_help="Got a question about your booking\\? We\'re here to help if you need us."
    @@welcome_your_views="What do you think of our app\\? It would be great to hear your views."
    @@welcome_rate_app="Button: Rate the MyFirstChoice app"
    @@welcome_home_alert="We hope you had a great time away. Now you’re logged in you can browse our great range of holidays or contact us about your recent trip"
    @@welcome_home="We hope you had a great time away. Now you’re logged in you can browse our great range of holidays or contact us about your recent trip"

    @@welcome_button_contact_us="Contact us"
    @@welcome_button_excursions="View excursions"
    @@welcome_button_view_my_flight="View my flight"
    @@welcome_button_view_extras="View extras"
    @@welcome_button_view_weather="View weather"
    @@welcome_button_rate="Rate the MyFirstChoice app"

    #List of all welcome messages
    @@welcome_msg_hash={
        "43 or more days" => [@@welcome_tips, @@welcome_extras_available, @@welcome_need_help],
        "29 to 42 days" => [@@welcome_need_help, @@welcome_extras_available, @@welcome_excursion, @@welcome_tips],
        "15 to 28 days" => [@@welcome_need_help, @@welcome_extras_available, @@welcome_excursion, @@welcome_countdown_month, @@welcome_tips],
        "7 to 14 days" => [@@welcome_need_help, @@welcome_extras_available, @@welcome_excursion, @@welcome_countdown_days, @@welcome_tips],
        "1 to 6 days" => [@@welcome_need_help, @@welcome_extras_available, @@welcome_excursion, @@welcome_tips],
        "less than 1 day" => [@@welcome_need_help, @@welcome_extras_available, @@welcome_excursion, @@welcome_countdown_tomorrow, @@welcome_tips],
        "in resort" => [@@welcome_extras_available, @@welcome_at_destination, @@welcome_excursion],
        "more than 1 day past" => [@@welcome_home]

    }

    #List of states for messages to be verified, To complete verification of message for each criteria (ex: "more than 1 day past")
    #Test must be run to verify that all messages in @@welcome_msg_hash["more than 1 day past"] must be verified
    # it will look like
    @@welcome_msg_hash_verified={}
    @@welcome_msg_hash.each do |criteria, values|
      arr=[]
      values.each do |msg|
        arr << false
      end
      @@welcome_msg_hash_verified[criteria]=arr
    end


  end
end