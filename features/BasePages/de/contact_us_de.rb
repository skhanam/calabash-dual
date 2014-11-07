require_relative '../Default/contact_us_base_page'

## verify contact us page
class ContactUsDe < ContactUsBasePage
  include eval($g_hw_module)
end

module Phone
  def check_contact_us_page
    check_contact_us_screen_title
  end

  def verify_contact_us_page
    wait_for_page_to_load(@@loading_hold_on, 5)
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
      scroll_page_till_partial_text var
    end

  end

  def validate_contact_items(var)
    scroll_page_and_assert_text var
  end
end

module Tablet
  include BaseModule


  def verify_contact_us_page
    BookingSummaryPage.new.verify_booking_summary_details

    assert_wait_for_text "Kontakt"

    products=$g_booking.get_hotel_details
    products.each do |val|
      assert_text_present "TUI Service vor Ort"
      assert_text_present val
    end

    scroll_page_and_assert_text @@contact_form_title
    scroll_page_and_assert_text @@contact_form_sub_title
    scroll_page_and_assert_text @@contact_form_first_name
    scroll_page_and_assert_text @@contact_form_last_name
    scroll_page_and_assert_text @@contact_form_email
    scroll_page_and_assert_text @@contact_form_telephone
    scroll_page_and_assert_text @@contact_form_telephone_hint_text
    scroll_page_and_assert_text @@contact_form_subject
    scroll_page_and_assert_text @@contact_form_message_hint_text
    scroll_page_and_assert_text @@contact_form_Send_email
    scroll_page_and_assert_text @@contact_form_Impressum_title
    scroll_page_and_assert_text @@contact_form_Impressum
  end
end


