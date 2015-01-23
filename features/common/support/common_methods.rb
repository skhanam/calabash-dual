#require 'rubyXL'
require_relative '../../BasePages/base_page'
require 'yaml'

#Methods common across android and ios are added here
class CommonMethods < BasePage

  # get suffix of day based on number of days
  def get_day_number_suffix(day)
    day=day.to_i
    if (day >= 11 && day <= 13)
      return "th"
    end

    case day%10
      when 1
        return "st"
      when 2
        return "nd"
      when 3
        return "rd"
      else
        return "th"
    end
  end

  def check_call_us_link
    click_call_button
    verify_call_button_overlay
  end

  def click_call_button
    scroll_page_till_partial_text @@services_phone
    click_on_partial_text @@services_phone
  end

  def verify_call_button_overlay
    sleep 1
    assert_text_elements([@@call_us_dialog_yes,
                          @@call_us_dialog_no])
    click_on_text @@call_us_dialog_no
    sleep 2
  end

  def check_sharing
    scroll_page_till_acc @@share_button_closed_img
    scroll_view("down")
    sleep 2
    click_acc_label @@share_button_closed_img
    assert_wait_for_acc @@facebook_share_img  if $g_ios
    assert_wait_for_acc @@twitter_share_img
    assert_wait_for_acc @@share_button_open_img
    sleep 1
  end

  def get_weekday_translated(weekday)
    data=YAML.load(File.open($g_locale))
    locale=ENV['LANG']
    data["#{locale}"]["weekdays"]["#{weekday}"]
  end

  def get_month_translated(month)
    data=YAML.load(File.open($g_locale))
    locale=ENV['LANG']
    data["#{locale}"]["months"]["#{month}"]
  end

  def close_popup_dialog
    #Handle push notifications
    if check_text_in_view @@push_notifications
      sleep 2
      assert_wait_for_text @@push_allow
      touch "label text:'#{@@push_allow}'"
      #click_on_text @@push_allow
    end

     puts ("#{$g_query_txt}text:'#{@@app_update_popup_title}'")
     #handle whats new dialog
     if element_exists("#{$g_query_txt}text:'#{@@app_update_popup_title}'")
      arr=@@app_update_popup_body.split(/\n/)
      arr.each do |var1|
        res=var1.match(/(\w+)/)
        assert_partial_text(res[0])
      end
      click_on_text @@ok
    end
  end

  def close_push_notifications
    sleep 2
    if element_exists("#{$g_query_txt}text:'#{@@push_notifications}'")
      assert_wait_for_text @@we_would_like_to_send_push
      assert_wait_for_text @@push_not_now
      touch ("#{$g_query_txt}text:'#{@@push_allow}'")
      sleep 2
    end
  end


  def check_progress_messages
    puts "\n\ncheck_progress_messages.... #{caller.first}"
    wait_for_progress_to_disappear @@hold_on_one_moment
    wait_for_progress_to_disappear @@activity_indicator_ten
    wait_for_progress_to_disappear @@activity_indicator_eleven
    wait_for_progress_to_disappear(@@activity_indicator_twelve,20)
  end

end