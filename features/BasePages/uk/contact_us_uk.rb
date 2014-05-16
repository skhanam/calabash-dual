require_relative '../Default/contact_us_base_page'

## verify contact us page
class ContactUsUK < ContactUsBasePage

  def verify_contact_us_page
    wait_for_progress_to_disappear(@@loading_hold_on)
    scroll_page_and_assert_text(@@contact_us_contact_title) #"Need some help?"
    scroll_page_and_assert_text(@@contactus_subtitle) #"Get in touch"
    #scroll_page_and_assert_text(@@contact_us_travel_shop)
                                                    #scroll_page_and_assert_text(@@postholiday_emailus) #"Email us"
    scroll_page_and_assert_text(@@contact_us_shop_opening_times)
    wait_for_partial_text_shown @@contactus_call_us #"Call us on [number]"
    scroll_page_and_assert_text(@@contactus_termsAndConditions)
    click_on_text @@contactus_termsAndConditions
    verify_external_links
    scroll_page_and_assert_text(@@contactus_privacyPolicy) #"Privacy policy"
    click_on_text @@contactus_privacyPolicy
    verify_external_links
  end
end



