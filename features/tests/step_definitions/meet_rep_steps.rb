When(/^I navigate to my travel agent page$/) do
  @homePage.open_side_panel
  @sidePanel.navigate_to_travel_agent_page
end

Then(/^I see my travel agent page$/) do
  @mytravelAgentPage.verify_my_travel_agent_page
end