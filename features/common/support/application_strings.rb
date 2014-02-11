# encoding: UTF-8
if (ENV['TESTENV']=='DE_MT')
  require_relative 'de_meinetui_strings'
end

module AppStrings
  if (ENV['TESTENV']=='DE_MT')
    include DEMeineTUI
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
    end

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