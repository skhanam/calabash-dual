class GuideOnlineBasePage < BasePage

  def verify_guide_online_screen
   verify_page_title @@guide_online
   screenshot(options={:name => "guide_online"})  if ENV['TAKE_SS']=="yes"
  end

end
