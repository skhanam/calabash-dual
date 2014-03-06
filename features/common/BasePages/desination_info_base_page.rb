class DestinationInfoBasePage < BasePage

  def check_dest_info_screen_title
    verify_page_title(@@dest_info_screen_title)
    puts "check_dest_info_screen_title"
  end

end
