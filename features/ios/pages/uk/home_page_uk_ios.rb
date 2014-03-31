require_relative '../../../common/BasePages/home_base_page'

class HomePage < HomeBasePage
  def logout_from_home_screen
    touch("view marked:'#{@@home_page_sidepanel_acc_label}'")
    sleep 2
    scroll_table_to_text("Log out")
    touch($g_query_txt+"text:'Log out'")
    sleep(2)
    touch($g_query_txt+"text:'Confirm'")
    sleep(5)
    return WelcomePage.new
  end
end



