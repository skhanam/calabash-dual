Given(/^I am on '(.+)' page$/) do  |page_name|

  @page.await

end


When(/^I transit to '(.+)' page by clicking '(.+)'$/) do |page_name_to_be_navigated, link_to_be_clicked|

  @page.transition_as_already_tui_user(page_name_to_be_navigated, link_to_be_clicked)

  @page = page(HaveYouUsedMeineTuiOnlinePage)

end

Then(/^I am back on '(.+)' page$/) do |page_name|

  @page = page(TellUsAboutYourself)

  step %{I am on '(.+)' page}

end

When(/^I click back arrow button on '(.+)' page$/) do  |page_name|

  @page.click_back_button_on_page

end