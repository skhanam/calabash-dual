#require_relative 'base_page_ios' if ENV['PLATFORM'] == 'ios'
#require_relative 'base_page_android' if ENV['PLATFORM'] == 'android'

class MyBookingsBasePage < BasePage

  #def initialize
  #end
  def switch_to_typical_booking
    txt= TYPICAL_BOOKING["payload"]["destination"] #get_typical_booking_name
    scroll_page_and_assert_text txt
    click_on_text txt
    sleep 3
    wait_for_progress_to_disappear(@@loading_finding_your_holiday, 20)
    sleep 1
  end

  def check_my_bookings_screen
    assert_wait_for_text(@@my_bookings_title)
  end

  def check_my_bookings_page
    check_my_bookings_screen
  end

  def navigate_to_account_details
    scroll_page_and_assert_text(@@my_bookings_edit_account, "down", nil, 20)
    click_on_text(@@my_bookings_edit_account)
    assert_wait_for_text(@@my_account_title)
  end


  def fill_user_details # read my bookings page and fill that data into user_details
    hash_arr=get_reservations("current")

    count=0
    hash_arr.each do |key, value|
      temp_hash={:destination => value[0], :departure_date => value[1], :products => value[2]}
      @@user_details.CurrentBookings[count]=temp_hash
      count+=1
    end


    hash_arr=get_reservations("past")
    count=0
    hash_arr.each do |key, value|
      temp_hash={:destination => value[0], :departure_date => value[1], :products => value[2]}
      @@user_details.PastBookings[count]=temp_hash
      count+=1
    end
    scroll_page_and_assert_text(@@my_bookings_past_bookings, "up")

    puts "past bookings #{@@user_details.PastBookings}"
    puts "current bookings #{@@user_details.CurrentBookings}"
  end


  def get_destination_name_of_past_booking(count)
    hash_arr=get_reservations("past")
    hash_arr[count.to_i][0] #Destination of first past booking
  end

  def click_add_a_booking_button
    click_accessibility_label "navbarRightButton"
    verify_page_title @@add_a_booking_page_title
  end

  def check_add_booking_screen
    assert_wait_for_text(@@add_a_booking_page_title)
  end

  def check_add_booking_page
    check_add_booking_screen
    assert_text_elements([@@add_a_booking_page_title, @@add_a_booking_page_text1, @@add_a_booking_page_text2])
    scroll_page_and_assert_text(@@add_a_booking_page_salutation, "down")
    assert_text_elements([@@add_a_booking_page_salutation, @@add_a_booking_page_firstname, @@add_a_booking_page_last_name])

    assert_text_present(@@add_a_booking_page_salutation_hint) if $g_ios
    assert_text_present(@@add_a_booking_page_firstname_hint) if $g_ios
    assert_text_present(@@add_a_booking_page_last_name_hint) if $g_ios

    scroll_page_and_assert_text(@@add_a_booking_page_need_help, "down")

    assert_text_elements([@@add_a_booking_page_booking_code, @@add_a_booking_page_arrival_date, @@add_a_booking_page_find_booking_button, @@add_a_booking_page_need_help])
    assert_text_present(@@add_a_booking_page_booking_code_hint) if $g_ios
    assert_text_present(@@add_a_booking_page_arrival_date_hint) if $g_ios
  end
end
