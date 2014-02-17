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
    @alreadyCustomerBasePage ||= AlreadyCustomerBasePage.new
    @loginPage ||= LoginPage.new
    @newUserRegistrationBasePage ||= NewUserRegistrationBasePage.new
    @forgotPasswordBasePage ||= ForgotPasswordBasePage.new
    @contactPage ||= ContactUsBasePage.new
    @termsPage ||= TermsAndConditionsPage.new
    @tuiServicePage ||= TUIServicePage.new
    @new_to_tui_page ||=NewTOTUIBasePage.new
    @countDownPage ||=CountDownBasePage.new
    @meetRepBasePage ||=MeetRepBasePage.new
    @hotelBasePage ||=HotelBasePage.new
  end
end