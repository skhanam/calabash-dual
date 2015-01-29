class DestinationInfoBasePage < BasePage
  include DestinationsModule

  def verify_list_of_destinations
    @countries= $g_booking.get_destination_countries
    screenshot(options={:name => "destinations"}) if ENV['TAKE_SS']=="yes"
    @countries.each do |var|
      puts "checking destination name #{var}"
      scroll_page_till_partial_text var
    end
  end

  def check_each_destination
    @countries= $g_booking.get_destination_countries
    @countries.each do |var|
      puts "checking destination name #{var}"
      click_on_partial_text var
      verify_page_title @@destination_title
      scroll_page_and_assert_text @@destination_page_gen_info
      scroll_page_and_assert_text @@destination_page_location
      navigate_back
      sleep 2
    end
  end

end
