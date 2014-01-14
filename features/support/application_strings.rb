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
    $g_user_details="features/z_dump/test_data/user_details.txt"

    if ($g_strings_set==true)
      return
    else
      $g_strings_set=true
    end

    puts "******* setting strings ********"
    puts caller.first

    if (ENV['TESTENV']=='DE_MT')
      # strings from de_meinetui_strings.rb file are being used for DE Meine TUI app
      puts "settings german strings for Meine TUI"
      set_meine_tui_de_mt_strings
    end

  end

  # setting global vars to make queries reusable
  def set_query_text
    if ENV['PLATFORM'] == 'ios'
      $g_query_txt = "view "
    elsif ENV['PLATFORM'] == 'android'
      $g_query_txt= "* "
    end
  end

end