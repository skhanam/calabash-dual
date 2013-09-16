Given(/^I am on '(.+)' page$/) do  |page_name|

  transit_to_page(page_name)

  screenshot_embed

end

Given(/^I am back on '(.+)' page$/) do  |page_name|

  @page = new_page_type(page_name)

  @page.page_exists?(page_name)

  screenshot_embed

end

When(/^I transit to '(.+)' page by clicking '(.+)'$/) do |page_to_be_navigated, link_to_be_clicked|

  @page.transition_to_page(page_to_be_navigated, link_to_be_clicked)

  @page.page_exists?(page_to_be_navigated)

  screenshot_embed

end

When(/^I click back arrow button on '(.+)' page$/) do  |page_name|

  @page.page_exists?(page_name)

  @page.click_back_button_on_page

  screenshot_embed

end

def transit_to_page(page_name)

  case page_name

    when /Welcome/i then

      @page = new_page_type('Tell us about yourself')

      @page.page_exists?('Tell us about yourself')

      @page.transition_to_page('Have you used meine TUI online', 'I’m already with TUI')

      @page.page_exists?('Have you used meine TUI online')

      @page.transition_to_page(page_name, 'That’s great – just use the same log in details to use this app.')

      @page.page_exists?(page_name)

    when /Have you used meine TUI online/i then

      @page = new_page_type('Tell us about yourself')

      @page.page_exists?('Tell us about yourself')

      @page.transition_to_page(page_name, 'I’m already with TUI')

      @page.page_exists?(page_name)

    when /Tell us about yourself/i then

      @page = new_page_type(page_name)

      @page.page_exists?(page_name)

    else raise "Page name for user to start journey not implemented: #{page_name}"

  end

end