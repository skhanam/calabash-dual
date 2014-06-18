# encoding: UTF-8
require_relative 'de_meinetui_strings' if (ENV['TESTENV']=='DE_MT')
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
    include EN_Strings
    $g_eng_app=true
  elsif (ENV['TESTENV']=='EN_FC')
    $g_current_app="EN_FC"
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
    puts "settings strings from file #{$g_lang_strings_file} app:#{$g_current_app}"

    if ($g_current_app=='DE_MT')
      # strings from de_meinetui_strings.rb file are being used for DE Meine TUI app
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
    @@home_page_loading=get_localized_string "hold_on_booking"
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
  end

  def image_icons_acc_label
    @@login_button_acc = "loginButton"

    @@home_page_acc_label="background_normal"
    @@home_page_account_acc_label="navbarRightButton"
    @@home_page_sidepanel_acc_label="navbarLeftButton"

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
    @@countdown_countdown_message1=get_localized_string("countdown_generic").gsub(/\[location\]/, '.*')
    @@countdown_countdown_message2=get_localized_string("countdown_waiting").gsub(/\[location\]/, '.*') if $g_german_app
    @@countdown_countdown_message2=get_localized_string("countdown_generic").gsub(/\[location\]/, '.*') if $g_nordics_app
    @@countdown_countdown_message2=get_localized_string("countdown_generic").gsub(/\[location\]/, '.*') if $g_eng_app
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
    $g_ios=false
    $g_android=false

    if ENV['PLATFORM'] == 'ios'
      $g_ios=true
      $g_query_txt = "view "
      if ENV['FLASH'] == "1"
        $g_flash = true
      end

    elsif ENV['PLATFORM'] == 'android'
      $g_android=true
      $g_query_txt= "* "
    end
  end

end