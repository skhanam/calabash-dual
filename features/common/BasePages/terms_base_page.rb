class TermsAndConditionsPage < BasePage

  def check_terms_screen
    scroll_page_and_assert_text(@@terms_text)
  end

  def check_terms_page
    scroll_page_and_assert_text(@@terms_title)
    scroll_page_and_assert_text(@@terms_text)
    scroll_page_and_assert_text(@@terms_call_us)
    scroll_page_and_assert_text(@@terms_sms)
    scroll_page_and_assert_text(@@terms_send_email)
    scroll_page_and_assert_text(@@terms_learn_more)
    scroll_page_and_assert_text(@@terms_service_contact)
  end

  def validate_menu_items(var)
    case var
      when "call us"
        CommonMethods.new.click_call_button
        CommonMethods.new.check_call_us_link
      when "Send us email"
        scroll_page_and_assert_text @@terms_send_email
        click_on_text @@terms_send_email
        sleep 1
        ContactUsBasePage.new.contact_us_embed_page
        click_back_button
      when "TUI service form"
        scroll_page_and_assert_text @@terms_service_contact
        click_on_text @@terms_service_contact
        sleep 1
        ContactUsBasePage.new.contact_us_embed_page
        click_back_button
    end
  end

end
