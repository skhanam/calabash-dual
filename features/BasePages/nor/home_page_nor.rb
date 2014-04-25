require_relative '../Default/home_base_page'

class HomePageNOR < HomeBasePage

  def logout_from_home_screen
    touch($g_query_txt+"marked:'#{@@home_page_sidepanel_acc_label}'")
    sleep 2
    scroll_table_to_text(@@logout)
    touch($g_query_txt+"text:'#{@@logout}'")
    sleep(2)
    touch($g_query_txt+"text:'#{@@logout_confirm}'")
    sleep(5)
    return WelcomePage.new
  end

  def click_booking_summary_biscuit
    scroll_page_till_acc "booking_summary"
    click_accessibility_label "booking_summary"
    touch($g_query_txt+"marked:'booking_summary' text:'#{@@holiday_summary}'") if $g_ios
    touch($g_query_txt+"marked:'booking_summary.' text:'#{@@holiday_summary}'") if $g_android
    verify_page_title @@booking_summary_title
  end
end



