class GuideOnlineBasePage < BasePage

  def verify_guide_online_screen
    verify_page_title @@guide_online

    if ENV['TAKE_SS']=="yes"
      sleep 5
      screenshot(options={:name => "guide_online"})
    end

  end

end
