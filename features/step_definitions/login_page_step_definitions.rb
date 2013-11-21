Given(/^I am on '(.+)' page$/) do |page_name|
  case page_name+"Page"
    when 'LoginPage' then
      @page= WelcomePage.new.navigate_to_login
    when 'WelcomePage' then
      @page= WelcomePage.new.await
  end
end

