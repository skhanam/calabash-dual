Given(/^I am in the Welcome Page$/) do

  @page.transition_as_already_tui_user

  @page = page(HaveYouUsedMeineTuiOnlinePage)

  @page.transition_to_welcome_page

  @page = page(WelcomePage).await

  screenshot_embed

end

When(/^I login with invalid credentials$/) do

  @page.login(USERS[:invalid])

  screenshot_embed

end

Then(/^the following message should appear "(.+)"$/) do |invalid_message|

  @page = page(LoginUnsuccessfulPage).await

  @page.assert_invalid_login_message(invalid_message)

  screenshot_embed

end


