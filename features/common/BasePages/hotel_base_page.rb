class HotelBasePage < BasePage

  #Find hotels for typical booking and verify if that is shown
  def verify_hotel_text(num)
    hotel_details=find_hotel_details(num)
    assert_wait_for_text hotel_details["name"]
    return hotel_details
  end

  def find_hotel_details(num)
    count=0
    find_products("hotel").each do |item|
      count+=1
      return item if count==num
    end
    return nil
  end

  def validate_hotel_details(var, hotel_details)
    case var
      when "Hotel Name"
        scroll_page_and_assert_text hotel_details["name"]
      when "Hotel location"
        scroll_page_and_assert_text hotel_details["destination"].upcase
      when "Contact buttons"
        scroll_page_and_assert_text @@hotel_email
        wait_for_partial_text_shown @@hotel_call_us
    end
  end

  def validate_hotel_links(var)
    case var
      when "place"
      when "Food & Drink"
      when "accommodation"
      when "Living"
      when "sport"
      when "Entertainment"
      when "Wellness"
      when "For Children"
    end

  end

end
