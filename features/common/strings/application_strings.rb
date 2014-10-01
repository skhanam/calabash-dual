# encoding: UTF-8
require_relative 'de_strings' if (ENV['TESTENV']=='DE_MT')
require_relative 'en_strings' if (ENV['TESTENV']=='EN_TH' || ENV['TESTENV']=='EN_FC')
require_relative 'nordics_strings' if (ENV['TESTENV']=='NOR')

#based on App, Application strings are loaded from
# en_thomson_strings.rb or
# en_first_choice_strings.rb or
# en_thomson_strings.rb
module AppStrings

  $g_nordics_app=false
  $g_german_app=false
  $g_eng_app=false
  #puts ENV['TESTENV']
  if (ENV['TESTENV']=='DE_MT')
    include DEMeineTUI
    $g_german_app=true
    $g_current_app="DE_MT"
  elsif (ENV['TESTENV']=='EN_TH')
    $g_current_app="EN_TH"
    $g_thomson_app=true
    include EN_Strings
    $g_eng_app=true
  elsif (ENV['TESTENV']=='EN_FC')
    $g_current_app="EN_FC"
    $g_firstchoice_app=true
    include EN_Strings
    $g_eng_app=true
  elsif (ENV['TESTENV']=='NOR')
    $g_nordics_app=true
    include NordicsStrings
    if ENV['LANG']=='sv'
      $g_current_app="NOR_sv"
    elsif (ENV['LANG']=='da')
      $g_current_app="NOR_da"
    elsif (ENV['LANG']=='fi')
      $g_current_app="NOR_fi"
    elsif (ENV['LANG']=='nb')
      $g_current_app="NOR_nb"
    end
  end

  def get_val(txt)
    eval("@@#{txt}")
  end

  def set_strings
    set_query_text
    if ($g_strings_set==true)
      return
    else
      $g_strings_set=true
    end
    common_strings
    set_test_data
    image_icons_acc_label
    loading_strings
    countdown_page_strings
    home_page_strings
    app_feedback_strings
    destination_info_strings
    check_open_url_in_browser_cta
    whats_new_strings
    push_notification_dialog
    currency_converter_page_strings
    phone_only_strings if $g_phone
    tablet_only_strings if $g_tablet
    puts "settings strings from file #{$g_lang_strings_file} app:#{$g_current_app}"

    if ($g_current_app=='DE_MT')
      # strings from de_strings.rb file are being used for DE Meine TUI app
      puts "settings german strings for Meine TUI"
      set_meine_tui_de_mt_strings
    elsif ($g_current_app=='EN_TH')
      set_en_strings
      $g_ENG_USER_DETAILS=nil
    elsif ($g_current_app=='EN_FC')
      set_en_strings
      $g_ENG_USER_DETAILS=nil
    elsif ($g_nordics_app)
      set_nordics_strings
      $g_NOR_user=nil
    end
  end

  def set_test_data
    @@currency_hash={}
    $g_booking = Bookings.new
  end

  def whats_new_strings
    @@app_update_popup_title= escape_quotes(get_localized_string "app_update_popup_title")
    @@app_update_popup_body= get_localized_string "app_update_popup_body"
    @@ok= get_localized_string "ok"
  end

  def push_notification_dialog
    @@push_notifications=get_localized_string "push_notifications"
    @@we_would_like_to_send_push=get_localized_string "we_would_like_to_send_push"
    @@push_not_now=get_localized_string "not_now"
    @@push_allow=get_localized_string "allow"
  end

  def check_open_url_in_browser_cta
    @@url_dialog_title=get_localized_string "url_dialog_title" #"Open in browser?"
    @@url_dialog_cancel=get_localized_string "call_dialog_cancel" #"Cancel"
    @@url_dialog_yes=get_localized_string "call_dialog_yes" #"Yes"
  end

  def destination_info_strings
    @@destination_page_gen_info = get_localized_string "general_information"
    @@destination_page_location = get_localized_string "location"
    @@destination_share_facebook = get_localized_string "share_destination"

    @@destination_title=get_localized_capitalized_string "destination_guide" if $g_current_app=="EN_FC"
    @@destination_title=get_localized_string "destination_guide" if $g_current_app=="EN_TH" || $g_nordics_app
    @@destination_title=get_localized_string "destination_info" if $g_german_app
  end

  def home_page_strings
    @@home_page_booking_summary=get_localized_string "booking_summary"
    @@home_page_days_to_go= get_localized_string "days_to_go"
    @@to_flight_strings= get_localized_string "to"
  end

  def common_strings
    @@services_phone= get_localized_string "services_phone" #Rufen Sie uns an
    @@call_us_dialog_no = get_localized_string "call_dialog_cancel"
    @@call_us_dialog_yes = get_localized_string "call_dialog_call"
    @@currency_converter_title= get_localized_string "currency_converter" #Währungsrechner
    @@travel_money_title= get_localized_string "travel_money" #Währungsrechner

    @@weather_coming_soon=get_localized_string "weather_coming_soon"

    @@hold_on_one_moment=get_localized_string "hold_on"
    @@activity_indicator_ten=get_localized_string "activity_indicator_ten"
    @@activity_indicator_eleven=get_localized_string "activity_indicator_eleven"
    @@activity_indicator_twelve=get_localized_string "activity_indicator_twelve"
  end

  def image_icons_acc_label
    @@home_page_account_acc="navbarRightButton"
    @@share_button_closed_img ="share_button"
    @@facebook_share_img="facebook_share"
    @@twitter_share_img ="twitter_share"
    @@share_button_open_img ="share_button_open"
  end

  def loading_strings
    @@loading_hold_on=get_localized_string "hold_on"
    @@loading_finding_your_holiday=get_localized_string "hold_on_booking"
  end

  def countdown_page_strings
    @@countdown_share_button_text=get_localized_string "countdown_share"
    @@countdown_days_text=get_localized_string "countdown_days"
    @@countdown_hours_text=get_localized_string "countdown_hours"
    @@countdown_minutes_text=get_localized_string "countdown_minutes"
    @@countdown_seconds_text=get_localized_string "countdown_seconds"

  end

  def currency_converter_page_strings
    @@currency_banner_acc="Currency"
  end

  def app_feedback_strings
    @@side_panel_app_feedback = get_localized_string "app_feedback"

    if $g_current_app=='EN_FC'
      @@app_feed_back_title1= get_localized_capitalized_string "feedback_navbar_title"
    else
      @@app_feed_back_title1= get_localized_string "feedback_navbar_title"
    end

    @@app_feed_back_title2= get_localized_string "feedback_title"
    @@app_feed_back_message_negative = get_localized_string "feedback_message_negative"
    @@app_feed_back_negative_rating= get_localized_string "feedback_message_title_negative"
    @@app_feed_back_you_rated= get_localized_string "feedback_message_you_rated_the_app"
    @@app_feed_back_submit= get_localized_string "feedback_submit_button"
    @@app_feed_back_rate_again = get_localized_string "feedback_rate_again_button"
    @@app_feed_back_email_us = get_localized_string "feedback_email_us_button" # Send us more feedback

  end

  # setting global vars to make queries reusable
  def set_query_text
    $g_flash = false # variable use to check flash feature on IOS (for highlighting)  / This is always false for android

    if ENV['PLATFORM'] == 'ios'
      $g_query_txt = "view "
      if ENV['FLASH'] == "1"
        $g_flash = true
      end

    elsif ENV['PLATFORM'] == 'android'
      $g_query_txt= "* "
    end
  end


  def phone_only_strings
    @@already_customer_title=get_localized_string "have_you_used_tui_header"
    @@login_button_acc = "loginButton"
    @@countdown_biscuit_acc="countdown_Biscuit"
    @@weather_biscuit_acc="destination_temperature"

    @@home_page_acc ="background_normal"
    @@home_page_title_acc ="welcome_title"
    @@home_page_sidepanel_acc_label ="navbarLeftButton"

    @@countdown_countdown_message1=get_localized_string("countdown_generic").gsub(/\[location\]/, '.*')
    @@countdown_countdown_message2=get_localized_string("countdown_waiting").gsub(/\[location\]/, '.*') if $g_german_app
    @@countdown_countdown_message2=get_localized_string("countdown_generic").gsub(/\[location\]/, '.*') if $g_nordics_app
    @@countdown_countdown_message2=get_localized_string("countdown_generic").gsub(/\[location\]/, '.*') if $g_eng_app
  end

  def tablet_only_strings
    @@home_page_acc ="offcanvasCTA"
    @@home_page_title_acc ="offcanvasCTA"
    @@home_page_sidepanel_acc_label ="offcanvasCTA"
    @@home_page_currency_Biscuit_acc="currency_Biscuit"

    @@already_customer_title="HAVE A BOOKING, LETS LOGIN"
    @@login_button_acc = "SUBMIT"
    @@countdown_biscuit_acc="countdown_Biscuit"
    @@weather_biscuit_acc="weather_Biscuit"
    @@destination_biscuit_acc="destination_Biscuit"
    @@destination_page_title_acc="Destination"

    @@welcome_page_swipe_down_acc = "swipeDown"
    @@welcome_page_swipe_up_acc = "swipeUp"

    @@countdown_countdown_message1=get_localized_string("countdown_generic")
    @@countdown_countdown_message2=get_localized_string("countdown_generic").gsub(/\[location\]/, '.*')
    @@days_to_go= get_localized_string "days_to_go"
    @@countdown_fb_share = get_localized_string "share_on_twitter"
    @@countdown_twitter_share = get_localized_string "share_on_facebook"
  end
end
