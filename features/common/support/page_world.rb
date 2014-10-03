module TestModule
  def initialize_all
    puts "\n\n CURRENT APP BEING TESTED #{$g_current_app}"
    @page=BasePage.new
    @welcomePage ||= WelcomePage.new
    @loginPage ||= LoginPage.new
    @bookingSummaryPage ||=BookingSummaryPage.new
    @weatherPage ||= WeatherBasePage.new
    @commonMethods ||=CommonMethods.new
    @travelMoneyPage=TravelMoneyBasePage.new
    @appFeedbackPage=AppFeedbackBasePage.new
    @flightsPage ||=FlightsBasePage.new
    @destinationInfo ||= DestinationInfoBasePage.new
    @excursionsPage ||= ExcursionsPage.new
    @guideOnlinePage ||= GuideOnlineBasePage.new
    @homePage ||= HomePage.new
    @countDownPage ||=CountDownBasePage.new
    @sidePanel ||=SidePanel.new
    @holidayExtrasPage ||=HolidayExtrasBasePage.new


    if ($g_current_app=='DE_MT')
      @myAccountPage ||= MyAccountBasePage.new
      @insurancePage||=InsuranceBasePage.new
      @goodToKnowPage||=GoodToKnowBasePage.new
      @newUserRegistrationPage ||= NewUserRegistrationBasePage.new
      @forgotPasswordPage ||= ForgotPasswordBasePage.new
      @contactPage ||= ContactUsDe.new
      @tuiServicePage ||= TuiServiceOnsitePage.new
      @termsPage ||= TermsAndConditionsBasePage.new
      @new_to_tui_page ||=NewTOTUIBasePage.new
      @mytouristGuidePage ||=MyTouristGuideBasePage.new
      @mytravelAgentPage ||=MyTravelAgentBasePage.new
      @hotelPage ||=HotelBasePage.new
      @currencyConvPage ||=CurrencyConverterBasePage.new
      @myBookingsPage ||= MyBookingsPage.new
      @wrongCountryPage ||=WrongCountryPage.new
    elsif ($g_current_app== 'EN_TH' || $g_current_app== 'EN_FC')
      @checklistPage=ChecklistPageUk.new
      @contactPage=ContactUsUK.new
      @postLoginHomeBasePage ||= PostLoginHomeBasePage.new

    elsif ($g_nordics_app)
      @contactPage=ContactUsNOR.new
      @dutyFreePage ||= DutyFreePage.new

    end
  end
end