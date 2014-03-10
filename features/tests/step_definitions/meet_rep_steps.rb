Then(/^I see meet representative page is displayed correctly$/) do
  @meetRepPage.verify_meet_rep_screen
end

Then(/^I must see name of representative$/) do
  @meetRepPage.check_name_of_rep
end
