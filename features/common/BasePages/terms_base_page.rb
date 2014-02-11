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

  def check_call_us_link
    scroll_page_and_assert_text @@terms_call_us
    click_on_text @@terms_call_us
    sleep 1
    assert_text_elements([@@terms_are_you_sure, @@terms_dialog_no,
                          @@terms_dialog_yes])
    wait_for_partial_text_shown @@terms_dialog_number
    click_on_text @@terms_dialog_no
    sleep 2
  end


  def validate_menu_items(var)
    case var
      when "call us"
        check_call_us_link
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
