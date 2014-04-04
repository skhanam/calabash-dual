module TestModule
  def initialize_all
    @page=BasePage.new
    @welcomePage ||= WelcomePage.new
    @homePage ||= HomePage.new
    @loginPage ||= LoginPage.new
    @sidePanel ||=SidePanel.new
    @bookingSummaryPage ||=BookingSummaryPage.new
    @weatherPage ||= WeatherPage.new
    @commonMethods ||=CommonMethods.new

    if (ENV['TESTENV']=='DE_MT')
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
    elsif (ENV['TESTENV']== 'EN_TH')
      @checklistPage=ChecklistPageUk.new
      @contactPage=ContactUsUK.new
    end
  end
end