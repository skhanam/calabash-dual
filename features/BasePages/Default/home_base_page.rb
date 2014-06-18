# encoding: utf-8

class HomeBasePage < BasePage

  def open_side_panel
    sleep 1
    click_accessibility_label @@home_page_sidepanel_acc_label
    sleep 1
  end

  def trait
    $g_query_txt+"text:'#{@@home_page_loading}'"
  end

  def await(opts={})
    text=$g_query_txt+"text:'#{@@home_page_loading}'"
    if (query(text))
      sleep 5
    end
    wait_for_elements_do_not_exist([$g_query_txt+"text:'#{@@home_page_loading}'"])
    sleep(5)
    self
  end

  def select_destination_biscuit
    scroll_page_till_partial_text @@home_destination_string
    query=("view marked:'photo_biscuit' descendant label {text CONTAINS '#{@@home_destination_string}'}") if $g_ios
    query=("* contentDescription:'photo_biscuit.' * { text CONTAINS '#{@@home_destination_string}' }") if $g_android
    assert_element(query)
    touch query

  end

  def select_guide_online
    scroll_page_and_assert_text @@guide_online
    #query=("* contentDescription:'booking_summary.' text:'#{@@guide_online}'") if $g_android
    #query=("view marked:'booking_summary' text:'#{@@guide_online}'") if $g_ios
    #assert_element(query)
    click_on_text @@guide_online
  end

  def check_taxfree_biscuit
    query=("* contentDescription:'booking_summary.' text:'#{@@duty_free}'") if $g_android
    query=("view marked:'booking_summary' text:'#{@@duty_free}'") if $g_ios
    scroll_page_and_assert_text("#{@@duty_free}")
    assert_element(query)
  end

  def select_booking_summary_biscuit
    query=("* contentDescription:'booking_summary.' text:'#{@@side_panel_booking_summary}'") if $g_android
    query=("view marked:'booking_summary' text:'#{@@side_panel_booking_summary}'") if $g_ios
    scroll_page_and_assert_text("#{@@side_panel_booking_summary}")
    assert_element(query)
    touch query
  end

  def check_welcome_messages
    msg=get_welcome_message
    wait_for_label(msg, 20)
  end

  #Check one element on home screen to confirm page is loaded
  def check_home_screen(timeout=20)
    res= wait_for_acc_label(@@home_page_acc_label, timeout)
    puts "check_home_screen: #{res}"
    return res
  end

  def wait_login_progress_to_disappear
    wait_for_progress_to_disappear(@@loading_hold_on, 40)
  end

  def wait_for_home_page_to_load
    wait_for_progress_to_disappear(@@loading_finding_your_holiday, 40)
  end

  def check_i_am_on_home_page
    check_home_screen
    #check_welcome_messages
  end

  def navigate_to_currency_conv_page
    CommonMethods.new.scroll_page_till_acc "tovalue"
    sleep 1
    get_currency_details
    click_accessibility_label "coins"
    if ($g_current_app=="DE_MT")
      verify_page_title @@currency_converter_title
    else
      verify_page_title @@travel_money_title
    end
  end

  def get_currency_details
    @@currency_hash["fromcode"]=get_acc_label_text "fromcode"

    @@currency_hash["fromvalue"]=query($g_query_txt+"marked:'fromvalue'", :text).first.match(/\d/)[0] if $g_ios
    @@currency_hash["fromvalue"]=query($g_query_txt+"marked:'fromvalue.'", :text).first.match(/\d/)[0] if $g_android

    @@currency_hash["tocode"]=get_acc_label_text "tocode"
    @@currency_hash["tovalue"]=get_acc_label_text "tovalue"
    puts "#{@@currency_hash}"
  end

  def click_weather_biscuit
    sleep 2
    scroll_page_till_acc "destination_temperature"
    click_accessibility_label "destination_temperature"
    sleep 2
    verify_page_title @@weather_page_title
  end


  def click_countdown_biscuit
    scroll_page_and_assert_text("countdown_biscuit")
    click_accessibility_label "countdown_biscuit"
    verify_page_title @@countdown_page_title
  end


  def click_on_account_button
    wait_for_acc_label @@home_page_account_acc_label
    sleep 2
    wait_for_acc_label @@home_page_account_acc_label
    click_accessibility_label @@home_page_account_acc_label
    wait_for_account_page_to_load
    verify_page_title @@my_bookings_title
  end

  def wait_for_account_page_to_load
    sleep 5
    wait_for_progress_to_disappear(@@loading_hold_on)
  end

  def check_booking_in_past_message(txt)
    sleep 5
    welcome_message_from_screen=get_welcome_msg_from_screen
    if (welcome_message_from_screen.match(/#{txt}/)==nil)
      fail("check_booking_in_past_message: Booking message is wrong")
    else
      puts "\n\n\ ** Found text #{txt} on home screen ** "
    end
  end


  def get_welcome_message
    no_of_days_to_go=-1*CommonMethods.new.get_countdown_days #Hard coded for now until test data is available
    if (no_of_days_to_go < -14 && no_of_days_to_go >= -548)
      msg="bald geht's in den Urlaub!"
    elsif (no_of_days_to_go < -3 && no_of_days_to_go >= -14)
      msg="nur noch dreimal schlafen, dann geht 's endlich los!"
    elsif (no_of_days_to_go == -3)
      msg="Ihre Reise steht vor der Tür.Sind Sie schon urlaubsreif?"
    elsif (no_of_days_to_go == -2)
      msg="schon aufgeregt? Wir freuen uns, Sie bald begrüßen zu dürfen!"
    elsif (no_of_days_to_go == -1)
      msg="morgen geht' s los! Haben Sie an alles gedacht?"
    elsif (no_of_days_to_go == 0)
      msg="wir wünschen Ihnen einen schönen Urlaub!"
    elsif (no_of_days_to_go > 1 && no_of_days_to_go <= 7)
      msg="willkommen zurück! Wir hoffen, Sie hatten einen schönen Urlaub."
    elsif (no_of_days_to_go > 7)
      msg="sind Sie schon wieder reif für die Insel?"
    else
      fail("Days are incorrect")
    end
    return msg
  end


  def navigate_to_insurance
    scroll_page_and_assert_text @@home_page_insurance_acc
    click_on_text @@home_page_insurance_acc
  end

  def navigate_my_tour_guide
    CommonMethods.new.side "representative"
    click_accessibility_label "representative"
    sleep 2
  end

  def check_countdown_days_text
    assert_wait_for_text(@@home_page_days_to_go)
  end

end