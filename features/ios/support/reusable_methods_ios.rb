require 'rubyXL'
require_relative '../../support/uk_first_choice_strings'
require_relative '../../support/reusable_methods'
#Methods that are resuable across IOS and Android and also which can be reused for other projects are added here
module IosReusableMethods
  include UKFirstChoice
  include ReusableMethods

  def click_on_text(text)
    touch("view text:'#{text}'")
  end

  def check_text_in_view(text_to_check)
    text_check=escape_quotes_smart(text_to_check)
    res=element_exists("view text:'#{text_check}'")
    if res
      if ($g_flash)
        flash("view text:'#{text_check}'")
      end
    end
    return res
  end


  #This method avoids calabash from crashing while using single quotes
  def escape_quotes_smart(str)
    #If escape quotes are used dont use again
    if str.include? '\\\''
      return str
    else
      return escape_quotes(escape_plus(str))
    end
  end


end
