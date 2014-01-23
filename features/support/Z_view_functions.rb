#!/bin/env ruby
# encoding: utf-8

if ($g_ios)
  require 'calabash-cucumber/operations'
  require 'calabash-cucumber/calabash_steps'
end

module ViewModule
  if ($g_ios)
    include Calabash::Cucumber::Operations
  end
  #$g_android=false


  def embed(a, b, c)
  end


  def click_on_text(text)
    if ($g_android)
      performAction('click_on_text', text)
    elsif ($g_ios)
      touch("view text:'#{text}'")
      #if ENV["OS"]=="ios6"
      #  playback "touch_button", {:query => $g_query_txt+"marked:'#{text}'"}
      #else
      #  touch $g_query_txt+"marked:'#{text}'"
      #end
    end
  end

  # escape if there are + symbols in text
  def escape_plus(str)
    if str.include? '+'
      str.gsub('+', '\\\\+')
    end
    return str
  end

  #This method avoids calabash from crashing while using single quotes
  def escape_quotes_smart(str)
    #If escape quotes are used dont use again
    if str.include? '\\\''
      return str
    else
      return escape_quotes(escape_plus(str))
    end
  end

  # escape single quotes present within double quotes string ex: "a'b"
  def escape_quotes(str)
    return str.gsub("'", '\'') if ($g_android)
    return str.gsub("'", "\\\\'") if ($g_ios)
  end

  def read_acc_label_text(label)
    query_text=$g_query_txt+"accessibilityLabel:'#{label}'" if $g_ios
    query_text=$g_query_txt+"contentDescription:'#{text}.'" if $g_android
    query(query_text, :text)[0]
  end


  def get_acc_label_text(text)
    return query($g_query_txt+"marked:'#{text}'", :text).first || query($g_query_txt+"contentDescription:'#{text}.'", :text).first
  end


  def check_acc_label(id)
    return element_exists($g_query_txt+"marked:'#{id}'") || element_exists($g_query_txt+"contentDescription:'#{id}.'")
  end

  #Wait to check if acc label appears on screen
  def wait_for_acc_label_to_appear(text, timeout)
    query_txt=$g_query_txt+"contentDescription:'#{escape_quotes_smart(text)}.'" if $g_android
    query_txt=$g_query_txt+"marked:'#{escape_quotes_smart(text)}'" if $g_ios

    begin
      wait_poll({:until_exists => query_txt, :timeout => timeout.to_i}) do
        puts text
        sleep(0.5)
      end
    rescue
      puts label("view")
      fail("wait_for_acc_label_to_appear text failed to find acc label:#{text}:")
    end
    return true
  end

  def check_text_in_view(text_to_check)
    text_check=escape_quotes_smart(text_to_check)
    res=element_exists($g_query_txt+"text:'#{text_check}'")
    if res
      flash($g_query_txt+"text:'#{text_check}'") if ($g_flash) #Flash this text if flash option is set
      puts ("check_text_in_view:#{text_to_check}: text found ")
    end

    return res

  end

  def check_text_must_be_in_view(text_to_check)
    res = check_text_in_view(text_to_check)
    if not res
      screenshot_and_raise "check_text_must_be_in_view: No element found with mark or text:#{text_to_check}:"
    else
      return res
    end
  end


## Specify text to check and time to wait for
# This will return true even if text matches part of the sentence
  def wait_for_text_like_to_appear_view(text, time_out)
    query_text=$g_query_txt+"{text LIKE '*#{text}'}"
    begin
      wait_poll({:until_exists => query_text, :timeout => time_out.to_i}) do
        puts text
      end
      flash(query_text) if ($g_flash)
    rescue
      fail("Failed to find text"+text)
    end
  end


  #Click on back button

  def click_back_button
    performAction('go_back') if $g_android
    touch("button index:0") if $g_ios
    sleep 2
  end


## Specify text to check and time to wait for
  def wait_for_text_to_appear_view(text, time_out)
    begin
      wait_poll({:until_exists => $g_query_txt+"text:'#{text}'", :timeout => time_out.to_i}) do
        puts text
      end
      flash("label text:'#{text}'") if ($g_flash)
    rescue
      fail("Failed to find text"+text)
      return false
    end
    return true
  end

  def wait_for_label(lbl, timeout)
    timeout=timeout.to_i
    while (timeout > 0)
      timeout-=1
      break if element_exists($g_query_txt+"marked:'#{escape_quotes(lbl)}'")
      sleep 1
    end
  end


  def click_label_text(text)
    click_text=escape_quotes_smart(text)
    touch("label text:'#{click_text}'")
    flash("label text:'#{click_text}'") if ($g_flash)
  end

#Click on label which has TEXT LIKE *text*
  def click_label_like_text(text)
    text_strip=escape_quotes_smart(text.strip)
    query_txt="label {text LIKE '#{text_strip}*'}"
    touch(query_txt)
    flash(query_txt) if ($g_flash)
  end


  def readAllLabels
    return query("label", :text)
  end

  def check_text_like(text_to_check)
    text_check=escape_quotes_smart(text_to_check)
    res=element_exists("view {text LIKE '*#{text_check}*'}")

    if res
      puts "check_text_like TEXT FOUND:#{text_to_check}"
      return res
    else
      screenshot_and_raise "No element found with mark or text: #{text_to_check}"
    end
  end


  def click_button_text(text)
    puts "CLICKING BUTTON:#{text}:"
    flash("ButtonLabel text:'#{text}'") if ($g_flash)
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

  def wait_for_progress_to_disappear(str, timeout=10)
    wait_for(:timeout => timeout, :post_timeout => 2, :retry_frequency => 0.5) { element_does_not_exist($g_query_txt+"marked:'#{str}'") }
  end
end