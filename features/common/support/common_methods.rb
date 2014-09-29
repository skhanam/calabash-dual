require 'rubyXL'
require_relative '../../BasePages/base_page'
require 'yaml'

#Methods common across android and ios are added here
class CommonMethods < BasePage
  # Read all data from excel and filter them by matching criteria
  def check_data_from_excel_matching_criteria(criteria)
    hash_arr=read_test_data
    matching_data=[]

    case criteria
      when "43 or more days"
        min_days, max_days=43, 99999
      when "29 to 42 days"
        min_days, max_days= 29, 42
      when "15 to 28 days"
        min_days, max_days=15, 28
      when "7 to 14 days"
        min_days, max_days=7, 14
      when "1 to 6 days"
        min_days, max_days=1, 6
      when "less than 1 day"
        min_days, max_days=0, 1
      when "in resort"
        #TODO
        fail("TODO")
      when "more than 1 day past"
        min_days, max_days=-99999, -1
    end

    hash_arr.each do |var|
      if var["VisionBookingRef"] == nil
        break
      end

      puts "min_days, max_days #{min_days}, #{max_days}"
      if (var["Pre-In-Post"] >=min_days && var["Pre-In-Post"] <= max_days)
        matching_data<<var
        #puts var["Pre-In-Post"]
      end
    end
    matching_data

  end

  #Avoid calling this method directly
  def get_user_details(url)
      fail("NOT used")
    if ENV['LANG']=='de'
      username=$g_current_user_details[:valid][:username]
      password=$g_current_user_details[:valid][:password]
      query_url=url||'http://37.46.24.155:3000/reservations'
      server_url="http://37.46.24.155:3000/login"
      res1=res1||`curl --data "username=#{username}&password=#{password}" '#{server_url}'`

      m=res1.match('(PHP(.*)path=\/)')
      res=`curl --header 'tui-auth-key:#{m[1]}' #{query_url}`
      parsed=JSON.parse(res)
      return parsed
    else
      fail("Language not recognized")
    end
  end


  ##specify the booking type and this method will return hash of booking details
  #def get_booking_details(booking_type)
  #  case
  #    when booking_type=="typical_booking"
  #      booking_id=80522687
  #    when booking_type=="flight_booking"
  #      booking_id=75511407
  #    when booking_type=="insurance_booking"
  #      booking_id=38072949
  #    when booking_type=="car_rental_booking"
  #      booking_id=36739063
  #    when booking_type =="non_eu_booking"
  #      booking_id=80522737
  #  end
  #  query_url='http://37.46.24.155:3000/reservation/'+booking_id.to_s+'/home'
  #  res= get_user_details(query_url)
  #end

  # get suffix of day based on number of days
  def getDayNumberSuffix(day)
    day=day.to_i
    if (day >= 11 && day <= 13)
      return "th";
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
    click_accessibility_label @@share_button_closed_img
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

  def close_whats_new_dialog
     puts ("#{$g_query_txt}text:'#{@@app_update_popup_title}'")
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
      touch ("#{$g_query_txt}text:'#{@@push_not_now}'")
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