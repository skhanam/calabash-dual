# encoding: UTF-8

require_relative 'de_meinetui_strings' if (ENV['TESTENV']=='DE_MT')
require_relative 'en_thomson_strings' if (ENV['TESTENV']=='EN_TH')

#based on App, Application strings are loaded from
# en_thomson_strings.rb or
# en_first_choice_strings.rb or
# en_thomson_strings.rb
module AppStrings
  if (ENV['TESTENV']=='DE_MT')
    include DEMeineTUI
  elsif (ENV['TESTENV']=='EN_TH')
    include EN_ThomsonStrings
  else
    include EN_FirstChoiceStrings
  end

  def set_strings
    set_query_text
    if ($g_strings_set==true)
      return
    else
      $g_strings_set=true
    end

    if (ENV['TESTENV']=='DE_MT')
      # strings from de_meinetui_strings.rb file are being used for DE Meine TUI app
      puts "settings german strings for Meine TUI"
      set_meine_tui_de_mt_strings
    elsif (ENV['TESTENV']=='EN_TH')
      set_thomson_strings
    end
    image_icons_acc_label
  end


  def image_icons_acc_label
    @@share_button_closed_img ="share_button"
    @@facebook_share_img="facebook_share"
    @@twitter_share_img ="twitter_share"
    @@share_button_open_img ="share_button_open"
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