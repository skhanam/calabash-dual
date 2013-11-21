
module PageWorld

  attr_accessor :page_type

  def new_page_type(type=self.page_type)

    case type

      when /Have you used meine TUI online/i then @page = page(HaveYouUsedMeineTuiOnlinePage)

      when /Tell us about yourself/i then @page = page(TellUsAboutYourselfPage)

      when /Explore TUI/i then @page = page(ExploreTuiPage)

      when /Welcome/i then @page = page(WelcomePage)

      when /Sign up/i then @page = page(SignUpPage)

      when /Your Bookings/i then @page = page(YourBookingsPage)

      else raise "Case not implemented: #{type}"

    end

  end

end

