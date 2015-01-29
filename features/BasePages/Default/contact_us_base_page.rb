## verify contact us page
class ContactUsBasePage < BasePage
 include ContactModule
  def verify_external_links
    sleep 2
    assert_wait_for_text @@url_dialog_title
    assert_wait_for_text @@url_dialog_cancel
  assert_wait_for_text @@url_dialog_yes
  click_on_text @@url_dialog_cancel
  sleep 2
  end

  def check_contact_us_page
    assert_wait_for_text @@contact_us_contact_title
    assert_wait_for_text @@contactus_subtitle
  end

end