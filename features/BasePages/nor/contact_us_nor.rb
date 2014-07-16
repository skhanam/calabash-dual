require_relative '../Default/contact_us_base_page'

## verify contact us page
class ContactUsNOR < ContactUsBasePage

  def verify_contact_us_page
    scroll_page_and_assert_text @@contactus_extra_text_1_subheading
    scroll_page_and_assert_text @@contactus_extra_text_1
    scroll_page_and_assert_text @@contactus_extra_text_2_subheading
    scroll_page_and_assert_text @@contactus_extra_text_2
    scroll_page_and_assert_text @@contactus_cta_terms
  end
end



