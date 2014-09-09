class HotelBasePage < BasePage

  #Find hotels for typical booking and verify if that is shown
  def verify_hotel_text(num)
    hotel_details=$g_booking.find_hotel_details(num)
    assert_wait_for_text hotel_details["name"]
    return hotel_details
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
        txt= @@hotel_place_link
      when "Food & Drink"
        txt=@@hotel_Food_Drink_link
      when "accommodation"
        txt=@@hotel_accommodation_link
      when "Living"
        txt= @@hotel_Living_link
      when "sport"
        txt= @@hotel_sport_link
      when "Entertainment"
        txt= @@hotel_Entertainment_link
      when "Wellness"
        txt= @@hotel_Wellness_link
      when "For Children"
        txt= @@hotel_For_Children
    end
    scroll_page_and_assert_text txt
    sleep 1
    touch_txt_and_verify_title txt, txt
    click_back_button
  end



end
