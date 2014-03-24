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

  def embed(a, b, c)
  end

  # escape if there are + symbols in text
  def escape_plus(str)
    if str.include? '+'
      str.gsub('+', '\\\\+')
    end
    return str
  end

  def get_acc_label_text(text)
    return query($g_query_txt+"marked:'#{text}'", :text).first if $g_ios
    return query($g_query_txt+"contentDescription:'#{text}.'", :text).first if $g_android
  end

  def click_accessibility_label(id)
    touch "#{$g_query_txt}marked:'#{id}'" if $g_ios
    touch "#{$g_query_txt}contentDescription:'#{id}.'" if $g_android
  end

  def click_on_partial_text(text)
    touch("#{$g_query_txt}{text CONTAINS '#{text}'}")
  end

## Specify text to check and time to wait for
# This will return true even if text matches part of the sentence
  def wait_for_partial_text_shown(text, time_out=10)
    query_text=$g_query_txt+"{text CONTAINS '#{text}'}"
    begin
      wait_poll({:until_exists => query_text, :timeout => time_out.to_i}) do
        puts ":#{text}:"
      end
      flash(query_text) if ($g_flash)
    rescue
      fail("Failed to find text"+text)
    end
    return true
  end

  #Check if part of text is shown
  def check_partial_text_shown text
    return element_exists("#{$g_query_txt}{text CONTAINS '#{text}'}")
  end

  ## Specify text to check and time to wait for
  def wait_for_text(text, time_out=10)
    begin
      wait_poll({:until_exists => $g_query_txt+"text:'#{text}'", :timeout => time_out.to_i}) do
      end
    rescue
      return false
    end
    puts text
    flash($g_query_txt+"text:'#{text}'") if $g_flash
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

  def wait_for_progress_to_disappear(str, timeout=10)
    puts "waiting for progress bar"
    wait_for(:timeout => timeout, :post_timeout => 2, :retry_frequency => 1) {
      puts "checking #{str}"
      break if element_does_not_exist($g_query_txt+"marked:'#{str}'")
    }
    sleep 2
  end


  def get_welcome_msg_from_screen
    return query("* contentDescription:'welcome_title.'", :text).first.strip if $g_android
    return query("view marked:'welcome_title' label", :text).first.strip if $g_ios
  end

  def click_button_text_repeatedly(text)
    puts "CLICKING BUTTON:#{text}:"
    flash("ButtonLabel text:'#{text}'") if ($g_flash)
    sleep(0.5)
    wait_for(10) { element_exists("view marked:'#{text}'") }
    sleep(0.5)
    touch("view marked:'#{text}'")
    sleep(1)
  end


  def check_acc_label(id)
    return element_exists($g_query_txt+"marked:'#{id}'") || element_exists($g_query_txt+"contentDescription:'#{id}.'")
  end

  #Check if text present or assert
  def assert_text_present(text_to_check)
    res = check_text_in_view(text_to_check)
    if not res
      screenshot_and_raise "assert_text_present: No element found with mark or text:#{text_to_check}:"
    else
      return res
    end
  end

  # check for elements in the array and assert if one of them is not found
  def assert_text_elements(arr)
    arr.each do |var|
      assert_text_present(var)
      puts var
    end
  end

## Assert if text to check is not shown before timeout
  def assert_wait_for_text(text, time_out=10)
    fail("text:#{text}: not present") if wait_for_text(text, time_out)==false
    return true
  end

  #Wait to check if acc label appears on screen
  def assert_wait_for_acc_label(text, timeout=10)
    fail("assert_wait_for_acc_label text failed to find acc label:#{text}:") if  wait_for_acc_label text, timeout
    return true
  end

  def verify_page_title(txt, time_out=10)
    actual_title= get_nav_bar_title
    count=0
    while (actual_title!=txt && count<time_out)
      count+=1
      actual_title= get_nav_bar_title
      actual_title.strip if actual_title !=nil
      fail("act:#{actual_title} doesnt match exp:#{txt}") if count==10
      sleep 1
    end
    flash("view text:'#{txt}'") if $g_flash
  end
end
