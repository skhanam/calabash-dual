module TestModule
  def initialize_all
    @bookingSummaryPage ||=BookingSummaryPage.new
    @myAccountPage ||= MyAccountPage.new
    @welcomePage ||= WelcomePage.new
    @homePage ||= HomePage.new
    @holidayCountDownPage ||= HolidayCountDownPage.new
    @weatherPage ||= WeatherPage.new
    @myBookingsPage ||= MyBookingsPage.new
    @alreadyCustomerBasePage ||= AlreadyCustomerBasePage.new
    @loginPage ||= LoginPage.new
    @newUserRegistrationBasePage ||= NewUserRegistrationBasePage.new
    @forgotPasswordBasePage ||= ForgotPasswordBasePage.new
    @contactPage ||= ContactUsBasePage.new
    @termsPage ||= TermsAndConditionsPage.new
    @tuiServicePage ||= TUIServicePage.new
  end
end