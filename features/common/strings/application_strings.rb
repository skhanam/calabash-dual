# encoding: UTF-8
require_relative 'de_meinetui_strings' if (ENV['TESTENV']=='DE_MT')
require_relative 'en_thomson_strings' if (ENV['TESTENV']=='EN_TH')
require_relative 'swedish_strings' if (ENV['TESTENV']=='NOR' && ENV['LANG']=='SW')

#based on App, Application strings are loaded from
# en_thomson_strings.rb or
# en_first_choice_strings.rb or
# en_thomson_strings.rb
module AppStrings
  if (ENV['TESTENV']=='DE_MT')
    include DEMeineTUI
    $g_current_app="DE_MT"
  elsif (ENV['TESTENV']=='EN_TH')
    $g_current_app="EN_TH"
    include EN_ThomsonStrings
  elsif (ENV['TESTENV']=='NOR')
    if ENV['LANG']=='SW'
      include SwedishStrings
      $g_current_app="NOR_SW"
    end

  end

  def set_strings
    set_query_text
    if ($g_strings_set==true)
      return
    else
      $g_strings_set=true
    end

    if ($g_current_app=='DE_MT')
      # strings from de_meinetui_strings.rb file are being used for DE Meine TUI app
      puts "settings german strings for Meine TUI"
      set_meine_tui_de_mt_strings
    elsif ($g_current_app=='EN_TH')
      set_thomson_strings
    elsif ($g_current_app=='NOR_SW')
      set_swedish_strings
    end

    image_icons_acc_label
    loading_strings
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