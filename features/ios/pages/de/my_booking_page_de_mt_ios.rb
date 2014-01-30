=begin
  * Description : page to verify my bookings page
  * Author: Tejasvi K M
  * Date: 21 jan 2013
=end
require_relative '../../../common/BasePages/my_bookings_base_page'

class MyBookingsPage < MyBookingsBasePage

  def get_reservations(text)
    reservations= {}
    item_count=0

    if text=="past"
      id="pastReservations"
      scroll_to_id="Konto bearbeiten"
      scroll_back_to=@@my_bookings_past_bookings
    elsif text=="current"
      id="currentReservations"
      scroll_to_id="pastReservations" #TODO use this @@my_bookings_past_bookings instead
      scroll_back_to=@@my_bookings_current_bookings
    end

    while true
      count=0
      #Read reservation shown on this page
      reservations_count=query("view marked:'#{id}' view marked:'booking_detail'").count
      while (count<=reservations_count)
        arr=query("view marked:'#{id}' view marked:'booking_detail' index:#{count} descendant label", :text)
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
    scroll_page_till_text_found(scroll_back_to, "up")
    return reservations
  end
end


