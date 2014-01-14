#!/bin/env ruby
# encoding: utf-8

require 'calabash-cucumber/operations'
require 'calabash-cucumber/calabash_steps'


module ViewModule
  include Calabash::Cucumber::Operations

  def embed(a, b, c)
  end


  def change_keyboard_to_english
    sleep(2)
    res=query("view:'UIKBKeyplaneView'", "keyplane")[0].include? ("iPhone-Alphabetic-Keyboard_Small-Letters/Keyplane: 8 properties + 4 subtrees")

    if ($g_testlang=="ru_RU") #Handle switching russian to english
      keyboard_enter_char "International"
      sleep(4)
      if (element_exists("view:'UIAlertView' descendant button"))
        touch("view:'UIAlertView' descendant button")
      end
    elsif (res!=true) #Handle all other locale (except russian)
      keyboard_enter_char "International"
      sleep(4)
      if element_exists("view text:'好'")
        touch("view text:'好'")
      elsif (element_exists("view text:'OK'"))
        touch("view text:'OK'")
      end

      res=query("view:'UIKBKeyplaneView'", "keyplane")[0].include? ("iPhone-Alphabetic-Keyboard_Small-Letters/Keyplane: 8 properties + 4 subtrees")
      count=0
      while (res!=true && count <5)
        keyboard_enter_char "International"
        res=query("view:'UIKBKeyplaneView'", "keyplane")[0].include? ("iPhone-Alphabetic-Keyboard_Small-Letters/Keyplane: 8 properties + 4 subtrees")
        sleep(1)
        count+=1
      end
    end
    sleep(3)
  end

  def wait_for_acc_label_to_appear(text, timeout)
    begin
      wait_poll({:until_exists => "view marked:'#{escape_quotes_smart(text)}'", :timeout => timeout.to_i}) do
        puts text
        sleep(0.5)
      end
    rescue
      puts "****** wait_for_acc_label_to_appear text=#{text}"
      puts label("view")
      Page.new.add_screenshot(text)
      fail()
    end
  end

  def check_text_in_view(text_to_check)
    text_check=escape_quotes_smart(text_to_check)
    res=element_exists("view text:'#{text_check}'")
    if res
      if ($g_flash)
        flash("view text:'#{text_check}'")
      end
      puts ("check_text_in_view:#{text_to_check}: text found ")
    end

    return res

  end

  def check_text_must_be_in_view(text_to_check)
    res = check_text_in_view(text_to_check)
    if not res
      screenshot_and_raise "check_text_must_be_in_view: No element found with mark or text:#{text_to_check}:"
    end

    return res
  end


  def check_exercise_step_in_view(text_check)
    text_check=escape_quotes_smart(text_check)
    puts("check_exercise_step_in_view  :"+text_check+":")
    res=element_exists("view:'NTCLabel' text:'#{text_check}'")

    if not res
      #If text not found check by stripping starting and ending whitespaces
      strip_text=text_check.strip
      res=element_exists("view {text LIKE '#{strip_text}'")
      puts("Text may contain extra white spaces")
      add_screenshot("Text may contain extra white spaces")
    end

    #Even after this it_IT doesnt exist report error
    if not res
      screenshot_and_raise "No element found with mark or text: #{strip_text}"
    end


    if ($g_flash)
      puts "flash:check_exercise_step_in_view"
      flash("view:'NTCLabel' text:'#{text_check}'")
    end


  end


## Specify text to check and time to wait for
# This will return true even if text matches part of the sentence
  def wait_for_text_like_to_appear_view(text, time_out)
    puts text
    begin
      wait_poll({:until_exists => "view {text LIKE '*"+text+"'}", :timeout => time_out.to_i}) do
        puts text
      end
      if ($g_flash)
        flash("view {text LIKE '*"+text+"'}")
      end
    rescue
      fail("Failed to find text"+text)
    end
  end


## Specify text to check and time to wait for
  def wait_for_text_to_appear_view(text, time_out)
    begin
      wait_poll({:until_exists => "view text:'#{text}'", :timeout => time_out.to_i}) do
        puts text
      end
      if ($g_flash)
        flash("label text:'#{text}'")
      end
    rescue
      fail("Failed to find text"+text)
    end
  end

  def wait_for_label(lbl, timeout)
    timeout=timeout.to_i
    while (timeout > 0)
      timeout-=1
      if element_exists("view marked:'#{escape_quotes(lbl)}'")
        break
      end
      sleep 1
    end
  end

  def check_settings_icon_shown(time_out)
    wait_poll({:until_exists => "imageView {description LIKE '*SettingsIcon*'}", :timeout => time_out}) do
    end

    if ($g_flash)
      flash("imageView {description LIKE '*SettingsIcon*'}")
    end
  end


  def check_cookie_text
    txt=Page.new.read_text_from_strings_txt("shop.cookietext")
    wait_for_text_to_appear_webview(txt, 20)
    yes_text= Page.new.read_text_from_strings_txt("shop.cookietext.accept")
    touch("view text:'#{yes_text}'")

  end

  def scroll_view_till_text_found(text, dir)
    text=escape_quotes_smart(text)

    wait_poll({:until_exists => "label {text LIKE '*"+text+"*'}",
               :timeout => 5}) do
      if dir=="up"
        scroll("view", :up)

      elsif dir=="down"
        scroll("view", :down)
      end
    end
  end


  def scroll_table_to_text(text)
    wait_poll({:until_exists => "view marked:'#{text}'",
               :timeout => 2}) do
      scroll("tableView", :down)
    end
  end


  def click_label_text(text)
    click_text=escape_quotes_smart(text)
    touch("label text:'#{click_text}'")
    if ($g_flash)
      flash("label text:'#{click_text}'")
    end
  end

#Click on label which has TEXT LIKE *text*
  def click_label_like_text(text)
    text_strip=escape_quotes_smart(text.strip)
    touch("label {text LIKE '#{text_strip}*'}")
    if ($g_flash)
      flash("label {text LIKE '#{text_strip}*'}")
    end
  end


  def readAllLabels
    return query("label", :text)
  end


  def check_workout_saved_dialog
    sleep(1)
    if not query("view text:'Workout Saved'").empty?
      touch("label text:'OK'")
      sleep(1)
    end
  end

  def check_favorite_workout_dialog
    sleep(1)
    if not query("view text:'Favorite Workout'").empty?
      touch("label text:'OK'")
      sleep(1)
    end
  end


  def check_text_like(text_to_check)
    text_check=escape_quotes_smart(text_to_check)
    #res = (element_exists("view marked:'#{text_check}'") or
    res=element_exists("view {text LIKE '*#{text_check}*'}")
    my_log("check_text_like :"+text_check+":", 5)
    if res
      print "check_text_like TEXT FOUND"
    else
      screenshot_and_raise "No element found with mark or text: #{text_to_check}"
    end

    return res
  end


  def click_button_text(text)
    puts "CLICKING BUTTON:#{text}:"

    if ($g_flash)
      puts "flashing button"
      flash("ButtonLabel text:'#{text}'")
    end
    sleep(0.5)
    wait_for(10) { element_exists("view marked:'#{text}'") }
    sleep(0.5)
    touch("view marked:'#{text}'")
    sleep(1)
  end

  def click_modal_alert_button(text)
    wait_for(10) { element_exists("view:'ModalAlertButton' marked:'#{text}'") }
    touch("view:'ModalAlertButton' marked:'#{text}'")
  end


  def check_menu_button
    return check_accessibility_label_exist(@@menu_button_acc_label)
  end

  def handle_dialogs
    count=0
    #  Page.new.delete_downloads_using_backdoor
    #  WelcomePage.new.cancel_3g_dialog

    while (element_exists("view:'ModalAlertView'"))
      puts "HANDLING DIALOGS"

      if (check_accessibility_label_exist(@@terms_conditions_dialog_text))
        click_button_text(@@terms_conditions_dialog_Accept_button)
        sleep(1)
      elsif (check_text_in_view(@@settings_page_logout_confirmation))
        click_button_text(@@settings_page_logout_dialog_yes)
      elsif check_accessibility_label_exist(@@settings_page_logout_button)
        SettingsPage.new.logout_from_application
      elsif check_accessibility_label_exist(@@auto_share_dialog_maybelater)
        click_accessibility_label(@@auto_share_dialog_maybelater)
      elsif (check_accessibility_label_exist("Terms Screen"))
        click_accessibility_label(@@settings_page_done_button)
      elsif element_exists("view accessibilityLabel:'Progress'")
        tap "RoundCrossGrey.png"
      end

      if (count>3)
        screenshot_and_raise("Handle errors properly")
        break
      end
      count+=1
      #HomePage.new.close_reward_notification
      sleep(1)
    end

    if (element_exists("imageView {description LIKE '*CloseButton.png*'}"))
      touch("imageView {description LIKE '*CloseButton.png*'}")
    end


  end

  def get_quick_start_workout_name
    return query("view accessibilityLabel:'quick start button' child view", :text).last
  end

#Def until text is shown and then click on it
  def wait_for_text_and_click(text)
    wait_for_text_to_appear_view(text, 5)
    click_label_text(text)
  end

  def wait_for_exercise_to_complete(ex_duration)
    puts ex_duration
    sleep(2)
    mins, secs=get_time("CurrentExerciseTimer")
    while (!(mins==0 && secs<2))
      print "#{mins}:#{secs}    "
      mins, secs=get_time("CurrentExerciseTimer")
      sleep(0.5)
    end
    puts "wait_for_exercise_to_complete: EXERCISE COMPLETED"
    sleep(2)
  end


  def get_time(timer_name)
    mins, secs=query("view id:'"+timer_name+"'")[0]["label"].split(' ')
    return mins.to_i, secs.to_i
  end

  def read_acc_label(label)
    query("view accessibilityLabel:'#{label}'", :text)[0]
  end

end