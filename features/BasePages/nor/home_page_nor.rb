require_relative '../Default/home_base_page'

class HomePageNOR < HomeBasePage

  def logout_from_home_screen
    click_accessibility_label @@home_page_sidepanel_acc_label
    sleep 2
    scroll_side_panel(@@logout)
    touch($g_query_txt+"text:'#{@@logout}'")
    sleep(2)
    touch($g_query_txt+"text:'#{@@logout_confirm}'")
    sleep(5)
    return WelcomePage.new
  end

  def click_booking_summary_biscuit
    scroll_page_and_assert_text @@side_panel_booking_summary
    #click_accessibility_label "booking_summary"
    touch($g_query_txt+"marked:'booking_summary' text:'#{@@side_panel_booking_summary}'") if $g_ios
    touch($g_query_txt+"marked:'booking_summary.' text:'#{@@side_panel_booking_summary}'") if $g_android
    verify_page_title @@booking_summary_title
  end
end



