=begin
  * Description : page to verify my account details , change password page
  * Author: Tejasvi K M
  * Date: 21 jan 2013
=end

class MyBookingsPage < BasePage
  include MyBookingsModule

  def get_destination_name_of_past_booking(count)
    hash_arr=get_reservations("past")
    hash_arr[count.to_i][0] #Destination of first past booking
  end

  def click_add_a_booking_button
    click_acc_label "navbarRightButton"
    verify_page_title @@add_a_booking_page_title
  end

  def check_add_booking_screen
    assert_wait_for_text(@@add_a_booking_page_title)
  end

  def click_add_booking_biscuit
    click_on_text(@@add_a_booking_page_title)
  end

  def check_add_booking_page
    check_add_booking_screen
    assert_text_elements([@@add_a_booking_page_title, @@add_a_booking_page_text1, @@add_a_booking_page_text2])

    puts "-----------"
    puts @@add_a_booking_page_salutation, @@add_a_booking_page_firstname, @@add_a_booking_page_last_name
    puts "-----------"
    puts @@add_a_booking_page_booking_code, @@add_a_booking_page_arrival_date, @@add_a_booking_page_find_booking_button, @@add_a_booking_page_need_help
    puts "-----------"
    puts @@add_a_booking_page_booking_code_hint
    puts "-----------"
    puts @@add_a_booking_page_arrival_date_hint
    puts "-----------"
    if $g_phone
      scroll_page_and_assert_text(@@add_a_booking_page_salutation, "down")
      assert_text_elements([@@add_a_booking_page_salutation, @@add_a_booking_page_firstname, @@add_a_booking_page_last_name])
      scroll_page_and_assert_text(@@add_a_booking_page_need_help, "down")
      assert_text_elements([@@add_a_booking_page_booking_code, @@add_a_booking_page_arrival_date, @@add_a_booking_page_find_booking_button, @@add_a_booking_page_need_help])
      assert_text_present(@@add_a_booking_page_booking_code_hint) if $g_ios
      assert_text_present(@@add_a_booking_page_arrival_date_hint) if $g_ios
    elsif $g_tablet
     assert_text_present "Vorname eingeben"
     assert_text_present @@add_a_booking_page_last_name #"Nachname eingeben"
     assert_text_present @@add_a_booking_page_booking_code_hint #"12345678"
     assert_text_present @@add_a_booking_page_arrival_date_hint # Datum eingeben

    end
  end

  def check_add_booking_page_tablet
    check_add_booking_screen
    assert_text_elements([@@add_a_booking_page_title, @@add_a_booking_page_text1, @@add_a_booking_page_text2])
    assert_text_elements([@@add_a_booking_page_firstname, @@add_a_booking_page_last_name])
    assert_text_present(@@add_a_booking_page_need_help)
    assert_text_present(@@add_a_booking_page_booking_code_hint) if $g_ios
    assert_text_present(@@add_a_booking_page_arrival_date_hint) if $g_ios
  end

  def check_all_future_booking_biscuits
    assert_partial_accessibility_label_text "active_booking" # Active biscuits are future ones present in the page
  end

  def check_all_past_booking_biscuits
    scroll_view("right", 2)
    assert_partial_accessibility_label_text "inactive_booking" # Inactive biscuits are past ones present in the page
  end

  def check_browse_holiday_biscuit
    assert_wait_for_text(@@browse_holiday_banner_text)
  end


end
