class CountDownBasePage < BasePage
  include CountdownModule
  #def initialize
  #end
  def check_countdown_screen_title
    verify_page_title(@@countdown_page_title)
  end



  def check_sharing_text
    scroll_page_and_assert_text @@countdown_share_button_text
  end
end
