class TuiServiceOnsitePage < BasePage

  def check_tui_service_screen
    verify_page_title @@tui_service_title
  end

  def check_tui_service_page
    scroll_page_and_assert_text(@@tui_service_title)
    scroll_page_and_assert_text(@@tui_service_terms_text)
    scroll_page_and_assert_text(@@services_phone)
    scroll_page_and_assert_text(@@tui_service_sms)
    scroll_page_and_assert_text(@@tui_service_send_email)
    scroll_page_and_assert_text(@@tui_service_learn_more)
    scroll_page_and_assert_text(@@tui_service_service_contact)
  end

  def validate_menu_items(var)
    case var
      when "call us"
        CommonMethods.new.click_call_button
        CommonMethods.new.check_call_us_link
      when "Send us email"
        scroll_page_and_assert_text @@tui_service_send_email
        click_on_text @@tui_service_send_email
        sleep 1
        ContactUsBasePage.new.contact_us_embed_page
        click_back_button
      when "TUI service form"
        scroll_page_and_assert_text @@tui_service_service_contact
        click_on_text @@tui_service_service_contact
        sleep 1
        ContactUsBasePage.new.contact_us_embed_page
        click_back_button
    end
  end

  def tui_service_select_hotel
    hotel_details=CommonMethods.new.find_hotel_details(1)
    assert_wait_for_text hotel_details["name"]
    click_on_text hotel_details["name"]
  end

  def navigate_to_contact_screen
    scroll_page_and_assert_text @@tui_service_service_contact
    click_on_text @@tui_service_service_contact
  end

  def check_tui_contact_page
    ContactUsBasePage.new.contact_us_embed_page
  end
end