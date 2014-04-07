module TestModule
  def initialize_all
    @page=BasePage.new
    @welcomePage ||= WelcomePage.new
    @loginPage ||= LoginPage.new


    if ($g_current_app=='DE_MT')
      @homePage ||= HomePage.new
      @sidePanel ||=SidePanel.new
      @bookingSummaryPage ||=BookingSummaryPage.new
      @commonMethods ||=CommonMethods.new
      @weatherPage ||= WeatherPage.new

      @myAccountPage ||= MyAccountPage.new
      @destInfoPage||=DestinationInfoBasePage.new
      @insurancePage||=InsuranceBasePage.new
      @goodToKnowPage||=GoodToKnowBasePage.new
      @newUserRegistrationPage ||= NewUserRegistrationBasePage.new
      @forgotPasswordPage ||= ForgotPasswordBasePage.new
      @contactPage ||= ContactUsBasePage.new
      @tuiServicePage ||= TuiServiceOnsitePage.new
      @termsPage ||= TermsAndConditionsBasePage.new
      @new_to_tui_page ||=NewTOTUIBasePage.new
      @countDownPage ||=CountDownBasePage.new
      @mytouristGuidePage ||=MyTouristGuideBasePage.new
      @mytravelAgentPage ||=MyTravelAgentBasePage.new
      @hotelPage ||=HotelBasePage.new
      @flightsPage ||=FlightsBasePage.new
      @currencyConvPage ||=CurrencyConverterBasePage.new
      @holidayCountDownPage ||= HolidayCountDownPage.new
      @myBookingsPage ||= MyBookingsPage.new
    elsif ($g_current_app== 'EN_TH')
      @homePage ||= HomePage.new
      @sidePanel ||=SidePanel.new
      @bookingSummaryPage ||=BookingSummaryPage.new
      @commonMethods ||=CommonMethods.new
      @weatherPage ||= WeatherPage.new

      @checklistPage=ChecklistPageUk.new
      @contactPage=ContactUsUK.new
    end
  end
end