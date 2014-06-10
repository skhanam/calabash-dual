## verify contact us page
class ContactUsBasePage < BasePage

  def verify_external_links
    sleep 2
    assert_wait_for_text @@url_dialog_title
    assert_wait_for_text @@url_dialog_cancel
    assert_wait_for_text @@url_dialog_yes
    click_on_text @@url_dialog_cancel
    sleep 2
  end
  def check_contact_us_page
    check_contact_us_screen_title
  end

  def contact_us_embed_page
    scroll_page_and_assert_text @@contact_us_first_name
    scroll_page_and_assert_text @@contact_us_last_name
    scroll_page_and_assert_text @@contact_us_email_id
    scroll_page_and_assert_text @@contact_us_telephone
    scroll_page_and_assert_text @@contact_us_subject
    scroll_page_and_assert_text @@contact_us_message
    scroll_page_and_assert_text @@contact_us_send_email
    scroll_page_and_assert_text @@contact_us_t_and_c
    scroll_page_and_assert_text @@contact_us_disclaimer
  end
end