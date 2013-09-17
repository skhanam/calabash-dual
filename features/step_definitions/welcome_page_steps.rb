When(/^I login with invalid credentials$/) do

  @page.login(USERS[:invalid])

  screenshot_embed

end

Then(/^the following message should appear "(.+)"$/) do |invalid_message|

  @page.assert_invalid_login_message(invalid_message)

  screenshot_embed

end

When(/^I login with valid credentials$/) do

  @page.login(USERS[:valid])

  screenshot_embed

end

Then(/^I should see '(.+)' page$/) do |page_name|

  @page = new_page_type(page_name)

  @page.page_exists?(page_name)

  screenshot_embed

end

When(/^I click '(.+)' in Menu Bar$/) do  |link_to_be_clicked|

  @page.click_menu_button_on_page()

  @page.click_on_text(link_to_be_clicked)

end
