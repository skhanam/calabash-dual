Then(/^I see meet representative page is displayed correctly$/) do
  @meetRepBasePage.verify_meet_rep_screen
end

Then(/^I must see name of representative$/) do
  @meetRepBasePage.check_name_of_rep
end

And(/^contact details of representative$/) do
  @meetRepBasePage.check_address_of_rep
end