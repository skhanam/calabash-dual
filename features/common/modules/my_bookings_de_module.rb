require_relative 'base_module'
module MyBookingsModule
  include BaseModule

  def self.included(receiver)
    receiver.send :include, Module.const_get(self.name+"::#{$g_platform}::#{$g_hw_module}")
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


  def switch_to_particular_booking
    txt= $g_current_booking["payload"]["destination"] #get_typical_booking_name
    scroll_page_and_assert_text txt if $g_phone
    scroll_to_booking txt if $g_tablet
    click_on_text txt
    sleep 3
    wait_for_progress_to_disappear(@@loading_finding_your_holiday, 20)
    sleep 1
  end

  module Ios

    module Tablet

      def scroll_to_booking(id, dir=":right", till_id=nil, count=10)
        puts "scroll_page_and_assert_text (#{id})"
        repeat_count=0

        if element_exists("view text:'#{id}'") || element_exists("view marked:'#{id}'")
          puts "scrolled to text (#{id})"
          return
        end

        while repeat_count < count
          repeat_count+=1
          scroll("scrollView index:2", :right)

          if element_exists("view text:'#{id}'") || element_exists("view marked:'#{id}'")
            flash("view text:'#{id}'") if element_exists("view text:'#{id}'") if ($g_flash)
            break
          end

          #If text is not found even after scrolling till end of page then fail
          if till_id!=nil && element_exists("view marked:'#{till_id}'")
            fail "id/text #{id} not present on screen"
          end
          sleep 0.5
        end
        fail "id/text :#{id}: not present on screen" if repeat_count==count
        sleep 1
      end

    end

    module Phone
      include BaseModule

      def click_booking_in_past
        scroll_page_and_assert_text(@@my_bookings_past_bookings, "down")
        id="booking_detail_past"
        CommonMethods.new.scroll_page_till_acc id
        name_of_last_dest= arr=query("#{$g_query_txt}marked:'#{id}' index:0 descendant label", :text)[0]
        sleep 2

        touch("#{$g_query_txt}marked:'#{id}' index:0") #click on first past booking
        sleep 2
        wait_for_progress_to_disappear(@@loading_finding_your_holiday, 20)

        return name_of_last_dest
      end

      #def get_reservations(text)
      #  reservations= {}
      #  item_count=0
      #
      #  if text=="past"
      #    id="booking_detail_past"
      #    scroll_to_id=@@my_bookings_edit_account
      #    scroll_back_to=@@my_bookings_past_bookings
      #  elsif text=="current"
      #    id="booking_detail_current"
      #    scroll_to_id=@@my_bookings_past_bookings
      #    scroll_back_to=@@my_bookings_current_bookings
      #  end
      #
      #  while true
      #    count=0
      #    #Read reservation shown on this page
      #    reservations_count=query("view marked:'#{id}'").count
      #    while (count<=reservations_count)
      #      arr=query("view marked:'#{id}' index:#{count} descendant label", :text)
      #      break if arr.count<3 # if three elements are not shown then break and scroll down
      #
      #      #Avoid inserting duplicate data
      #      flag=false
      #      reservations.each do |key, arr_present|
      #        if arr_present==arr #no need to add this array
      #          flag=true
      #          puts "duplicate found"
      #        end
      #      end
      #      if flag==false #insert element only if its not already present
      #        reservations[item_count]=arr
      #        item_count+=1
      #      end
      #
      #      count+=1
      #    end
      #
      #    break if element_exists("view marked:'#{scroll_to_id}'")
      #    scroll("scrollView", :down) #Scroll till past reservations text found
      #    sleep 1
      #  end
      #  scroll_page_and_assert_text(scroll_back_to, "up")
      #  return reservations
      #end

    end

  end

  module Android
    def click_booking_in_past
      include BaseModule

      scroll_page_and_assert_text(@@my_bookings_past_bookings, "down")
      id="booking_detail_past."
      CommonMethods.new.scroll_page_till_acc id
      name_of_last_dest= arr=query("#{$g_query_txt}contentDescription:'#{id}' index:0 * contentDescription:'location.'", :text)
      sleep 2

      touch("#{$g_query_txt}contentDescription:'#{id}' index:0") #click on first past booking
      sleep 2
      wait_for_progress_to_disappear(@@loading_finding_your_holiday, 20)

      return name_of_last_dest
    end

    module Phone

    end

    module Tablet

    end
    #def get_reservations(text)
    #  reservations= {}
    #  item_count=0
    #
    #  if text=="past"
    #    id="booking_detail_past"
    #    scroll_to_id=@@my_bookings_edit_account
    #    scroll_back_to=@@my_bookings_past_bookings
    #  elsif text=="current"
    #    id="booking_detail_current"
    #    scroll_to_id=@@my_bookings_past_bookings
    #    scroll_back_to=@@my_bookings_current_bookings
    #  end
    #
    #  while true
    #    count=0
    #    #Read reservation shown on this page
    #    reservations_count=query("* contentDescription:'#{id}.'").count
    #    while (count<=reservations_count)
    #      arr= Array.new
    #      arr[0]=query("* contentDescription:'#{id}.' index:#{count} * contentDescription:'location.'", :text).first
    #      arr[1]=query("* contentDescription:'#{id}.' index:#{count} * contentDescription:'date.'", :text).first
    #      arr[2]=query("* contentDescription:'#{id}.' index:#{count} * contentDescription:'details.'", :text).first
    #
    #      break if ((arr[0] && arr[1] && arr[2]) ==nil) # if three elements are not shown then break and scroll down
    #                                                    #Avoid inserting duplicate data
    #      flag=false
    #      reservations.each do |key, arr_present|
    #        if arr_present==arr #no need to add this array
    #          flag=true
    #          puts "duplicate found"
    #        end
    #      end
    #      if flag==false #insert element only if its not already present
    #        reservations[item_count]=arr
    #        item_count+=1
    #      end
    #
    #      count+=1
    #    end
    #
    #    break if element_exists("* marked:'#{scroll_to_id}'")
    #    scroll_view("down") #Scroll till past reservations text found
    #    sleep 1
    #  end
    #  scroll_page_and_assert_text(scroll_back_to, "up")
    #  return reservations
    #end

    def get_days_left(val="typical_booking")
      CommonMethods.new.get_countdown_days(val)
    end
  end


end
