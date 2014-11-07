require_relative '../Default/contact_us_base_page'

## verify contact us page
class ContactUsUK < ContactUsBasePage
  include eval($g_hw_module)
end

module Tablet

  def verify_contact_us_page
    wait_for_progress_to_disappear(@@loading_hold_on)
    assert_text_present @@contact_us_title
    assert_text_present(@@contactus_subtitle)
    assert_text_present @@contactus_termsAndConditions
    assert_text_present @@contactus_privacyPolicy
    assert_text_present @@contactus_support
  end

end

module Phone
  def verify_contact_us_page
    wait_for_progress_to_disappear(@@loading_hold_on)
    scroll_page_and_assert_text(@@contact_us_contact_title) #"Need some help?"
    scroll_page_and_assert_text(@@contactus_subtitle) #"Get in touch"
  end

  def verify_contact_us_cta
    verify_contact_us_page
    scroll_page_till_partial_text @@contactus_call_us #"Call us on [number]"
    scroll_page_and_assert_text(@@contactus_termsAndConditions)
    click_on_text @@contactus_termsAndConditions
    verify_external_links
    scroll_page_and_assert_text(@@contactus_privacyPolicy) #"Privacy policy"
    click_on_text @@contactus_privacyPolicy
    verify_external_links
  end

end