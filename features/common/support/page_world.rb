module TestModule
  def initialize_all
    @page=BasePage.new
    @welcomePage ||= WelcomePage.new
    @loginPage ||= LoginPage.new
    @bookingSummaryPage ||=BookingSummaryPage.new
    @weatherPage ||= WeatherBasePage.new
    @commonMethods ||=CommonMethods.new


    if ($g_current_app=='DE_MT')
      @homePage ||= HomePage.new
      @sidePanel ||=SidePanel.new

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