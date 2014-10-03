# encoding: utf-8

class HomePage < BasePage
  include HomeModule


  def open_side_panel
    sleep 1
    click_accessibility_label @@home_page_sidepanel_acc_label
    sleep 1
  end

  def trait
    $g_query_txt+"text:'#{@@hold_on_one_moment}'"
  end

  def await(opts={})
    text=$g_query_txt+"text:'#{@@hold_on_one_moment}'"
    if (query(text))
      sleep 5
    end
    wait_for_elements_do_not_exist([$g_query_txt+"text:'#{@@hold_on_one_moment}'"])
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

  def check_destination_biscuit
    scroll_page_till_acc(@@destination_biscuit_acc, "right")
    assert_wait_for_acc(@@destination_biscuit_acc)
  end

  def click_destination_biscuit
    scroll_page_till_acc(@@destination_biscuit_acc, "right")
    #scroll_view("right",0)
    click_accessibility_label(@@destination_biscuit_acc)
  end

  def verify_destination_page
    assert_wait_for_acc(@@destination_page_title_acc)
  end

  def verify_currency_converter_biscuit
    assert_wait_for_acc(@@home_page_currency_Biscuit_acc)
  end

  def verify_currency_converter_page
    assert_wait_for_acc(@@currency_banner_acc)
  end

  def click_currency_converter_biscuit
    click_accessibility_label(@@home_page_currency_Biscuit_acc)
  end

  def find_excursions_biscuit
    scroll_page_till_acc(@@home_page_currency_Biscuit_acc, "right")
  end


  def verify_currency_converter_exchange_names
    arr= $g_booking.get_currency_details
    arr.each do |var|
      query_txt=$g_query_txt+"marked:'currency_Biscuit' label text:'#{var}'"
      assert_wait_for_element(query_txt, 5)
    end
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
    assert_wait_for_acc(msg, 20)
  end

  #Check one element on home screen to confirm page is loaded
  def check_home_screen(timeout=20)
    puts "TODO time out must be reduced to 5"
    res= wait_for_acc_label(@@home_page_acc, timeout)
    puts "check_home_screen: #{res} @@home_page_acc #{@@home_page_acc}"
    return res
  end

  def wait_login_progress_to_disappear
    wait_for_progress_to_disappear(@@loading_hold_on, 40)
  end

  def wait_for_home_page_to_load
    puts "wait_for_home_page_to_load -> check_progress_messages"
    CommonMethods.new.check_progress_messages
    wait_for_progress_to_disappear(@@loading_finding_your_holiday, 40)
  end


  def navigate_to_currency_conv_page
    CommonMethods.new.scroll_page_till_acc "tovalue"
    scroll_view("down")
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
    no_of_days_to_go=-1*$g_booking.get_countdown_days #Hard coded for now until test data is available
    puts "no_of_days_to_go #{no_of_days_to_go}"
    if (no_of_days_to_go < -14 && no_of_days_to_go >= -548)
      msg= get_localized_string "holiday_message_minus_548" #bald geht's in den Urlaub!"
    elsif (no_of_days_to_go < -3 && no_of_days_to_go >= -14)
      msg=get_localized_string "holiday_message_minus_14" #"nur noch dreimal schlafen, dann geht 's endlich los!"
    elsif (no_of_days_to_go == -3)
      msg=get_localized_string "holiday_message_minus_3" # "Ihre Reise steht vor der Tür.Sind Sie schon urlaubsreif?"
    elsif (no_of_days_to_go == -2)
      msg= get_localized_string "holiday_message_minus_2" #"schon aufgeregt? Wir freuen uns, Sie bald begrüßen zu dürfen!"
    elsif (no_of_days_to_go == -1)
      msg=get_localized_string "holiday_message_plus_1" #"morgen geht' s los! Haben Sie an alles gedacht?"
    elsif (no_of_days_to_go == 0)
      msg=get_localized_string "holiday_message_zero" #"wir wünschen Ihnen einen schönen Urlaub!"
    elsif (no_of_days_to_go > 1 && no_of_days_to_go <= 7)
      msg=get_localized_string "holiday_message_plus_1" #"willkommen zurück! Wir hoffen, Sie hatten einen schönen Urlaub."
    elsif (no_of_days_to_go > 7)
      msg=get_localized_string "holiday_message_plus_7" #"sind Sie schon wieder reif für die Insel?"
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

  def check_post_holiday_popup_window
    assert_wait_for_text(@@home_page_post_holiday_title)
  end

  def check_post_holiday_popup_window_content
    assert_wait_for_text(@@home_page_post_holiday_popup_alert_content)
  end

  def weather_biscuit_present?
    assert_wait_for_acc @@weather_biscuit_acc
  end

  def country_name_shown_weather_biscuit?
    res=$g_booking.get_country_names_for_weather
    if res.count<1
      fail "No weather present"
    else
      res.each { |var| assert_wait_for_text(var, 6) }
    end
  end

end

