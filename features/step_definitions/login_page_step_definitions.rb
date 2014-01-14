Given(/^I log into Application using "(.*?)" and "(.*?)"/) do |username, password|
  step "I am on 'Login' screen"
  step "I enter \"#{username}\" and \"#{password}\" in login page"
  step "click on login button"
end

Given(/^I am on '(.+)' screen/) do |page_name|
  case page_name
    when 'Login' then
      @page= WelcomePage.new.navigate_to_login
    when 'Welcome' then
      @page= WelcomePage.new
  end
end


When (/^I enter "(.*?)" and "(.*?)" in login page$/) do |username, password|
  @page.enter_credentials(username, password)
end

When (/^click on login button$/) do
  @page=@page.submit_login_button
end


