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

  end
end