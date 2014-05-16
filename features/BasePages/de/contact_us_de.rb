require_relative '../Default/contact_us_base_page'

## verify contact us page
class ContactUsDe < ContactUsBasePage

  def check_contact_us_page
    check_contact_us_screen_title
  end


  def verify_contact_us_page
    wait_for_page_to_load(@@loading_hold_on,5)
    scroll_page_and_assert_text(@@contact_us_contact_title)
    scroll_page_and_assert_text(@@contact_us_learn_more)
    scroll_page_and_assert_text(@@contact_us_contact_tui_service)
    scroll_page_and_assert_text @@contact_us_first_name
    scroll_page_and_assert_text @@contact_us_last_name
    scroll_page_and_assert_text @@contact_us_email_id
    scroll_page_and_assert_text @@contact_us_telephone
    scroll_page_and_assert_text @@contact_us_subject
    scroll_page_and_assert_text @@contact_us_message
    scroll_page_and_assert_text @@contact_us_send_email
    scroll_page_and_assert_text @@contact_us_t_and_c
    scroll_page_and_assert_text @@contact_us_disclaimer

    @@contact_us_contact_copy.each do |var|
      scroll_page_till_partial_text  var
    end

  end

  def validate_contact_items(var)
    scroll_page_and_assert_text var
  end
end



