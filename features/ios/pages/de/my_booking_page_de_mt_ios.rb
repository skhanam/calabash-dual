=begin
  * Description : page to verify my bookings page
  * Author: Tejasvi K M
  * Date: 21 jan 2013
=end
require_relative '../../../common/BasePages/my_bookings_base_page'

class MyBookingsPage < MyBookingsBasePage

  def click_booking_in_past
    scroll_page_and_assert_text(@@my_bookings_past_bookings, "down")

    id="booking_detail_past"
    name_of_last_dest= arr=query("view marked:'#{id}' index:0 descendant label", :text)[0]
    sleep 2

    touch("view marked:'#{id}' index:0") #click on first past booking
    sleep 2
    wait_for_progress_to_disappear(@@loading_finding_your_holiday, 20)

    return name_of_last_dest
  end


  def get_reservations(text)
    reservations= {}
    item_count=0

    if text=="past"
      id="booking_detail_past"
      scroll_to_id=@@my_bookings_edit_account
      scroll_back_to=@@my_bookings_past_bookings
    elsif text=="current"
      id="booking_detail_current"
      scroll_to_id=@@my_bookings_past_bookings
      scroll_back_to=@@my_bookings_current_bookings
    end

    while true
      count=0
      #Read reservation shown on this page
      reservations_count=query("view marked:'#{id}'").count
      while (count<=reservations_count)
        arr=query("view marked:'#{id}' index:#{count} descendant label", :text)
        break if arr.count<3 # if three elements are not shown then break and scroll down

        #Avoid inserting duplicate data
        flag=false
        reservations.each do |key, arr_present|
          if arr_present==arr #no need to add this array
            flag=true
            puts "duplicate found"
          end
        end
        if flag==false #insert element only if its not already present
          reservations[item_count]=arr
          item_count+=1
        end

        count+=1
      end

      break if element_exists("view marked:'#{scroll_to_id}'")
      scroll("scrollView", :down) #Scroll till past reservations text found
      sleep 1
    end
    scroll_page_and_assert_text(scroll_back_to, "up")
    return reservations
  end
end


