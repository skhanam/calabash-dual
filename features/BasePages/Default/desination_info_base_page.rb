class DestinationInfoBasePage < BasePage

  def check_dest_info_screen_title
    verify_page_title(@@destination_title)
  end

  def verify_destination_screen
   scroll_page_and_assert_text @@destination_share_facebook
   scroll_page_and_assert_text @@destination_page_location
   scroll_page_and_assert_text @@destination_page_gen_info
  end

  def verify_destination_info_screen
    verify_page_title @@destination_title
  end

  def verify_list_of_destinations
    @countries= CommonMethods.new.get_desination_countries
    @countries.each do |var|
      puts "checking destination name #{var}"
      assert_wait_for_text var
    end
  end

  def check_each_destination
    @countries= CommonMethods.new.get_desination_countries
    @countries.each do |var|
      puts "checking destination name #{var}"
      click_on_text var
      verify_page_title @@destination_title
      scroll_page_and_assert_text @@destination_page_gen_info
      scroll_page_and_assert_text @@destination_page_location
      navigate_back
      sleep 2
    end
  end
end
