When(/^I select first item in check list$/) do
  @checklistPage.open_to_do_list
  @first_checklist_text=@checklistPage.select_first_check_list_item
end

When(/^I open my packaging list$/) do
  @checklistPage.open_packaging_list
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

Then(/^I verify items to pack are (\d+)$/) do |var|
  @checklistPage.check_packaging_items(var)
end

When(/^I add a new item with a title$/) do
  @checklistPage.add_new_packaging_item
  step 'I touch done' if $g_ios
  step 'I press the enter button' if $g_android
end

Then(/^I see item listed under Items to pack$/) do
  @checklistPage.check_packaging_item
end

When(/^I check edit and delete options$/) do
  @checklistPage.select_packaging_item
  @checklistPage.check_options_for_packaging_item

end
When(/^I delete item added from packaging list$/) do
  @checklistPage.check_options_for_packaging_item
  @checklistPage.delete_packaging_item
end


Then(/^I must not see item under packaging list$/) do
  @checklistPage.packaging_item_not_present
end