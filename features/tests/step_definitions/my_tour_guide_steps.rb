Then(/^I see my tour guide screen$/) do
  @mytouristGuidePage.verify_my_tour_guide_screen
end

Then(/^I must see name of my tour guide$/) do
  @mytouristGuidePage.check_name_of_tour_guide
end