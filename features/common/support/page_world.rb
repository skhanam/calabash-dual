module TestModule
  def initialize_all
    puts $g_current_app
    @page=BasePage.new
    @welcomePage ||= WelcomePage.new
    @loginPage ||= LoginPage.new
    @bookingSummaryPage ||=BookingSummaryPage.new
    @weatherPage ||= WeatherBasePage.new
    @commonMethods ||=CommonMethods.new
    @holidayCountDownPage ||= HolidayCountDownPage.new
    @countDownPage ||=CountDownBasePage.new
    @travelMoneyPage=TravelMoneyBasePage.new


    if ($g_current_app=='DE_MT')
      @homePage ||= HomePage.new
      @sidePanel ||=SidePanelDe.new

      @myAccountPage ||= MyAccountPage.new
      @destInfoPage||=DestinationInfoBasePage.new
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
      @flightsPage ||=FlightsBasePage.new
      @currencyConvPage ||=CurrencyConverterBasePage.new
      @myBookingsPage ||= MyBookingsPage.new
    elsif ($g_current_app== 'EN_TH' || $g_current_app== 'EN_FC')
      @homePage ||= HomePage.new
      @sidePanel ||=SidePanelEng.new
      @checklistPage=ChecklistPageUk.new
      @contactPage=ContactUsUK.new
    elsif ($g_nordics_app)
      @homePage ||= HomePageNOR.new
      @sidePanel ||=SidePanelNor.new
      @contactPage=ContactUsNOR.new
    end
  end
end