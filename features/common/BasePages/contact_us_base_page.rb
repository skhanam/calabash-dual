## verify contact us page
class ContactUsBasePage < BasePage

  #def initialize
  #end

  def check_contact_us_screen
    assert_wait_for_text(@@contact_us_contact_tui_service)
  end

  def check_contact_us_page
    check_contact_us_screen
    assert_wait_for_text @@contact_us_learn_more
    contact_us_embed_page
    scroll_page_and_assert_text(@@contact_us_disclaimer)
    scroll_view("down")
    @@contact_us_contact_copy.each do |var|
      wait_for_partial_text_shown var
    end
  end

  # verify part of contact us page which is shown when it is linked within another page
  def contact_us_embed_page
    arr=[@@contact_us_contact_tui_service,
         @@contact_us_telephone,
         @@contact_us_subject,
         @@contact_us_message,
         @@contact_us_send_email,
         @@contact_us_privacy_policy]

    arr.each do |var|
      scroll_page_and_assert_text(var, "down", @@contact_us_contact_copy.last) #scrolling will also verify if text is found or not
    end
  end


  def validate_contact_items(var)
    case var
      when "email"
        assert_text_present(@@contact_us_email_id)
        assert_text_present(@@user_details.first_name)
      when "First name"
        assert_text_present(@@contact_us_first_name)
        assert_text_present(@@user_details.last_name)
      when "Surname"
        assert_text_present(@@contact_us_last_name)
        assert_text_present(@@user_details.email_id)
    end
  end


  def navigate_to_terms_and_conditions
    scroll_page_and_assert_text @@contact_us_privacy_policy
    click_on_text @@contact_us_privacy_policy
  end

  def navigate_tui_service_onsite_screen
    scroll_page_and_assert_text @@contact_us_contact_tui_service
    click_on_text @@contact_us_contact_tui_service
  end

  def check_terms_and_conditions
    element ="webView css:'*' textContent:'#{@@terms_conditions_page_title}'"
    wait_poll({:until_exists => element, :timeout => 5}) do
    end
  end


end



