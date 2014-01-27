Given(/^I log into Application using "(.*?)" and "(.*?)"/) do |username, password|
  step "I am on 'Login' screen"
  step "I enter \"#{username}\" and \"#{password}\" in login page"
  step "click on login button"
end

Given(/^I am on '(.+)' screen/) do |page_name|
  case page_name
    when 'Login' then
      @page= @welcomePage.navigate_to_login
    when 'Welcome' then
      @page=@welcomePage
      @page.verify_welcome_screen
    else
      fail("page not found")
  end
end


When (/^I enter "(.*?)" and "(.*?)" in login page$/) do |username, password|
  @page.enter_credentials(username, password)
end

When (/^click on login button$/) do
  @page=@page.submit_login_button
end


Then(/^I see login screen$/) do
  @page.check_login_page
end