## verify contact us page
class ContactUsBasePage < BasePage

  #def initialize
  #end

  def check_contact_us_screen
    assert_wait_for_text(@@contact_us_contact_tui_service)

  end

  def check_contact_us_page
    check_contact_us_screen
    #assert_text_elements([@@new_to_tui_text2, @@new_to_tui_classic_hotel])

    fail "#{@@contact_us_contact} must be shown twice" if query("view text:'#{@@contact_us_contact}'").count!=2

    arr=[@@contact_us_learn_more,
         @@contact_us_contact_tui_service,
         @@contact_us_telefon,
         @@contact_us_subject,
         @@contact_us_message,
         @@contact_us_send_email,
         @@contact_us_privacy_policy]

    arr.each do |var|
      scroll_page_and_assert_text(var,"down",@@contact_us_contact_copy.last) #scrolling will also verify if text is found or not
    end
    scroll_page_and_assert_text(@@contact_us_disclaimer)

    @@contact_us_contact_copy.each do |var|
      scroll_page_and_assert_text(var,"down",@@contact_us_contact_copy.last) #scrolling will also verify if text is found or not
    end

  end

  def validate_menu_items(var)
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
end



