class HotelBasePage < BasePage

  #Find hotels for typical booking and verify if that is shown
  def verify_hotel_text(num)
    puts "sleeping"
    hotel_details=nil

    hotel_details=find_hotel_details(num)
    assert_wait_for_text hotel_details
  end

  def find_hotel_details(num)
    count=0
    find_products("hotel").each do |item|
      count+=1
      return item if count==num
    end
    return nil
  end

  def validate_menu_items(var, num)
    case var
      when "hotel location"
        fail("check hotel name")
    end
  end

end
