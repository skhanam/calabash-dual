require_relative '../Default/contact_us_base_page'

## verify contact us page
class ContactUsUK < ContactUsBasePage

  def check_contact_us_page
    check_contact_us_screen_title
  end

  def verify_external_links
    sleep 2
    assert_wait_for_text @@url_dialog_title
    assert_wait_for_text @@url_dialog_cancel
    assert_wait_for_text @@url_dialog_yes
    click_on_text @@url_dialog_cancel
    sleep 2
  end

  def verify_contact_us_page
    wait_for_page_to_load(@@loading_hold_on,5)
    scroll_page_and_assert_text(@@contact_us_title) #"Need some help?"
    scroll_page_and_assert_text(@@contactus_subtitle) #"Get in touch"
    scroll_page_and_assert_text(@@contact_us_travel_shop)
    #scroll_page_and_assert_text(@@postholiday_emailus) #"Email us"
    scroll_page_and_assert_text(@@contact_us_shop_opening_times)
    wait_for_partial_text_shown @@contactus_call_us #"Call us on [number]"
    scroll_page_and_assert_text(@@contactus_termsAndConditions)
    click_on_text @@contactus_termsAndConditions
    verify_external_links
    scroll_page_and_assert_text(@@contactus_privacyPolicy) #"Privacy policy"
    click_on_text @@contactus_privacyPolicy
    verify_external_links
    scroll_page_and_assert_text(@@contactus_support) #"MyThomson support"


  end
end



