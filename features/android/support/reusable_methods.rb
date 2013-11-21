require 'rubyXL'

module ReusableMethods

  def check_text_in_view(txt)
    begin
      return performAction('wait_for_text', txt, 2)["success"]
    rescue
      return false
    end
  end
end
