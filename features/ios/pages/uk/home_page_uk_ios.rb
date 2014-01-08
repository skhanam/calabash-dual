require_relative '../../../../features/BasePages/home_page'

class HomePage < HomeBasePage
  def logout_from_home_screen
    swipe(:right)
    scroll_table_to_text("Log out")
    touch($g_query_txt+"text:'Log out'")
    sleep(2)
    touch($g_query_txt+"text:'Confirm'")
    sleep(5)
    return WelcomePage.new
  end
end

def scroll_table_to_text(text)
  wait_poll({:until_exists => "view marked:'#{text}'",
             :timeout => 2}) do
    scroll("tableView", :down)
  end
end


