require 'rubyXL'
require_relative '../../support/uk_first_choice_strings'
require_relative '../../support/reusable_methods'

#Methods that are resuable across IOS and Android and also which can be reused for other projects are added here
module AndroidReusableMethods
  include UKFirstChoice
  include ReusableMethods

  def click_on_text(text)
    performAction('click_on_text', text)
  end


  def check_text_in_view(txt)
    begin
      return performAction('wait_for_text', txt, 2)["success"]
    rescue
      return false
    end
  end

end
