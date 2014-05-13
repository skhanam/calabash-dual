When(/^I select first item in check list$/) do
  @checklistPage.open_to_do_list
  @first_checklist_text=@checklistPage.select_first_check_list_item
end

When(/^I open to do list$/) do
  @checklistPage.open_to_do_list
end

Then(/^I see the selected item under completed items$/) do
  @checklistPage.show_completed_items
end

When(/^I unselect the select item$/) do
  @checklistPage.unselect_selected_item(@first_checklist_text)
end

Then(/^I see the item at bottom of check list$/) do
  @checklistPage.verify_unselected_item(@first_checklist_text)
end

Then(/^I verify all check list items are shown$/) do
  @checklistPage.verify_checklist_page
end