class GoodToKnowBasePage < BasePage

  def verify_good_to_know_screen
    verify_page_title @@good_to_know_page_title
  end

  def verify_good_to_know_page
    verify_good_to_know_screen
    scroll_page_and_assert_text @@good_to_know_page_text
  end

end
