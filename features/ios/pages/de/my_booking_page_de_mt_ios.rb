=begin
  * Description : page to verify my bookings page
  * Author: Tejasvi K M
  * Date: 21 jan 2013
=end
require_relative '../../../../features/BasePages/my_bookings_base_page'
require_relative '../../../../features/support/data_models'

class MyBookingsPage < MyBookingsBasePage

  def check_my_bookings_page
    check_my_bookings_screen
  end

  def navigate_to_account_details
    scroll_page_till_text_found(@@my_bookings_edit_account, "down")
    touch_and_verify(@@my_bookings_edit_account, @@my_account_title)
  end

  def click_booking_in_past
    scroll_page_till_text_found(@@my_bookings_past_bookings, "down")
    name_of_last_dest=get_destination_name_of_past_booking(0)
    touch("view marked:'pastReservations' view marked:'booking_detail' index:0") #click on first past booking
    sleep 5
    return name_of_last_dest
  end

  def get_destination_name_of_past_booking(count)
    hash_arr=get_past_reservations
    hash_arr[count.to_i][0] #Destination of first past booking
  end

  def get_current_reservations
    current_reservations= {}
    arr=[]
    item_count=0
    while (true)
      count=0
      #Read reservation shown on this page
      current_reservations_count=query("view marked:'currentReservations' view marked:'booking_detail'").count
      while (count<=current_reservations_count)
        arr=query("view marked:'currentReservations' view marked:'booking_detail' index:#{count} descendant label", :text)
        break if arr.count<3 # if three elements are not shown then break and scroll down


        #Avoid inserting duplicate data
        flag=false
        current_reservations.each do |key, arr_present|
          if arr_present==arr #no need to add this array
            flag=true
            puts "duplicate found"
          end
        end
        if flag==false #insert element only if its not already present
          current_reservations[item_count]=arr
          item_count+=1
        end

        count+=1
      end

      break if element_exists("view marked:'pastReservations'")
      scroll("scrollView", :down) #Scroll till past reservations text found
      sleep 1

    end
    scroll_page_till_text_found(@@my_bookings_current_bookings, "up")
    return current_reservations
  end

  def get_past_reservations
    past_reservations= {}
    item_count=0

    while true
      count=0
      #Read reservation shown on this page
      past_reservations_count=query("view marked:'pastReservations' view marked:'booking_detail'").count
      while (count<=past_reservations_count)
        arr=query("view marked:'pastReservations' view marked:'booking_detail' index:#{count} descendant label", :text)
        break if arr.count<3 # if three elements are not shown then break and scroll down

        #Avoid inserting duplicate data
        flag=false
        past_reservations.each do |key, arr_present|
          if arr_present==arr #no need to add this array
            flag=true
            puts "duplicate found"
          end
        end
        if flag==false #insert element only if its not already present
          past_reservations[item_count]=arr
          item_count+=1
        end

        count+=1
      end

      break if element_exists("view marked:'Konto bearbeiten'")
      scroll("scrollView", :down) #Scroll till past reservations text found
      sleep 1
    end

    scroll_page_till_text_found(@@my_bookings_past_bookings, "up")

    return past_reservations
  end


  def fill_user_details # read my bookings page and fill that data into user_details
    hash_arr=get_current_reservations

    count=0
    hash_arr.each do |key, value|
      temp_hash={:destination => value[0], :departure_date => value[1], :products => value[2]}
      @@user_details.CurrentBookings[count]=temp_hash
      count+=1
    end


    hash_arr=get_past_reservations
    count=0
    hash_arr.each do |key, value|
      temp_hash={:destination => value[0], :departure_date => value[1], :products => value[2]}
      @@user_details.PastBookings[count]=temp_hash
      count+=1
    end
    scroll_page_till_text_found(@@my_bookings_past_bookings, "up")

    puts "past bookings #{@@user_details.PastBookings}"
    puts "current bookings #{@@user_details.CurrentBookings}"
  end


end


