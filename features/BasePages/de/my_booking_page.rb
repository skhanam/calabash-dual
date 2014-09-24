=begin
  * Description : page to verify my account details , change password page
  * Author: Tejasvi K M
  * Date: 21 jan 2013
=end

class MyBookingsPage < BasePage
 include MyBookingsModule
 #include Module.const_get "MyBookingsModule::"+$g_platform



 #def fill_user_details # read my bookings page and fill that data into user_details
 #  hash_arr=get_reservations("current")
 #
 #  count=0
 #  hash_arr.each do |key, value|
 #    temp_hash={:destination => value[0], :departure_date => value[1], :products => value[2]}
 #    @@user_details.CurrentBookings[count]=temp_hash
 #    count+=1
 #  end
 #
 #
 #  hash_arr=get_reservations("past")
 #  count=0
 #  hash_arr.each do |key, value|
 #    temp_hash={:destination => value[0], :departure_date => value[1], :products => value[2]}
 #    @@user_details.PastBookings[count]=temp_hash
 #    count+=1
 #  end
 #  scroll_page_and_assert_text(@@my_bookings_past_bookings, "up")
 #
 #  puts "past bookings #{@@user_details.PastBookings}"
 #  puts "current bookings #{@@user_details.CurrentBookings}"
 #end


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
   assert_text_elements([@@add_a_booking_page_title, @@add_a_booking_page_text1, @@add_a_booking_page_text2]) if $g_phone
   scroll_page_and_assert_text(@@add_a_booking_page_salutation, "down")if $g_phone
   assert_text_elements([@@add_a_booking_page_salutation, @@add_a_booking_page_firstname, @@add_a_booking_page_last_name])if $g_phone
   scroll_page_and_assert_text(@@add_a_booking_page_need_help, "down") if $g_phone
   assert_text_elements([@@add_a_booking_page_booking_code, @@add_a_booking_page_arrival_date, @@add_a_booking_page_find_booking_button, @@add_a_booking_page_need_help]) if $g_phone
   assert_text_present(@@add_a_booking_page_booking_code_hint)  if $g_phone && $g_ios
   assert_text_present(@@add_a_booking_page_arrival_date_hint) if $g_phone && $g_ios
 end

def check_all_future_booking_biscuits
  assert_partial_accessibility_label_text "active_booking" # Active biscuits are future ones present in the page
end

 def check_all_past_booking_biscuits
   scroll_view("right",2)
   assert_partial_accessibility_label_text "inactive_booking" # Inactive biscuits are past ones present in the page
 end

 def check_browse_holiday_biscuit
   assert_wait_for_text(@@browse_holiday_banner_text)
 end


end
