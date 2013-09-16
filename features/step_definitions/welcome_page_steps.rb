When(/^I login with invalid credentials$/) do

  @page.login(USERS[:invalid])

  screenshot_embed

end

Then(/^the following message should appear "(.+)"$/) do |invalid_message|

  @page.assert_invalid_login_message(invalid_message)

  screenshot_embed

end


