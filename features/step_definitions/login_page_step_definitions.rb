Given(/^I am on '(.+)' page$/) do |page_name|
  case page_name
    when 'Login' then
      @page= WelcomePage.new.navigate_to_login
    when 'Welcome' then
      @page= WelcomePage.new
  end
end

