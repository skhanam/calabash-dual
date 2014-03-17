module TestModule
  def initialize_all
    @page=BasePage.new
    @bookingSummaryPage ||=BookingSummaryPage.new
    @myAccountPage ||= MyAccountPage.new
    @welcomePage ||= WelcomePage.new
    @homePage ||= HomePage.new
    @holidayCountDownPage ||= HolidayCountDownPage.new
    @weatherPage ||= WeatherPage.new
    @myBookingsPage ||= MyBookingsPage.new
    @loginPage ||= LoginPage.new
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
    @commonMethods ||=CommonMethods.new
    @flightsPage ||=FlightsBasePage.new
    @currencyConvPage ||=CurrencyConverterBasePage.new
    @sidePanel ||=SidePanel.new
    @destInfoPage||=DestinationInfoBasePage.new
    @insurancePage||=InsuranceBasePage.new
    @goodToKnowPage||=GoodToKnowBasePage.new
  end
end