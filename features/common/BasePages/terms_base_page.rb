class TuiServiceOnsitePage < BasePage

  def check_tui_service_screen
verify_page_title @@tui_service_title
  end

  def check_tui_service_page
    scroll_page_and_assert_text(@@tui_service_title)
    scroll_page_and_assert_text(@@tui_service_terms_text)
    scroll_page_and_assert_text(@@tui_service_call_us)
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

end
