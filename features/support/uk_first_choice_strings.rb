module UKFirstChoice

  def set_strings
    welcome_page_strings
    login_page_strings
    welcome_messages
    test_data
  end

  #All test data for different appication is in here
  def test_data
    $g_booking_data="/Users/tejasvi.manmatha/projects/TUI_Data/Bookings.xlsx"
  end

  def welcome_page_strings
    @@welcome_page_ready_to_login="I’m ready to log in"
    @@welcome_page_info_text1="Did you book a First Choice holiday directly online, over the phone or in your local Thomson shop? Then the My First Choice app is for you. You can log into your personalised MyFirstChoice app 3-4 days after you have made your booking:"
    @@welcome_page_info_text2="Sorry, you can’t use the app if:"
    @@welcome_page_info_bullet1="You didn’t book a First Choice holiday directly with First Choice or Thomson"
    @@welcome_page_info_bullet2="You booked a Thomson cruise"
    @@welcome_page_info_bullet3="You booked a Thomson holiday"
    @@welcome_page_help_logging_in="Help logging in"
  end

  def login_page_strings
    @@login_page_text="Log in"
    @@login_page_error_text1="Please check your details."
    @@login_page_surname="Surname of lead passenger:"
    @@login_page_surname_hint="Enter surname"

    #TODO complete rest of them

  end


  def welcome_messages
    @@welcome_hi_text="Hi <Name>,"
    @@welcome_tips="Welcome to your personalised travel companion – MyFirstChoice. Check back regularly for handy tips and updates!"
    @@welcome_at_destination="Welcome to <destination>! We hope you have a great holiday. If you need anything, just get in touch."
    @@welcome_countdown_days="It 's the final countdown, your holiday to <destination> is just days away."
    @@welcome_countdown_tomorrow="This time tomorrow you’ll be in <destination> - don' t forget to pack your passport!"
    @@welcome_countdown_month="Your holiday to <destination> is less than a month away! Is your passport is in date?"
    @@welcome_excursion="We’ve found <number of excursions> excursion(s) for you in <destination>. Take a look now!"
    @@welcome_extras_available="We've found <number of extras> extra available to you. Take a look now!"
    @@welcome_dont_forget_flight="Don 't forget your flight departs"
    @@welcome_weather="Good news"
    @@welcome_need_help="Got a question about your booking? We're here to help if you need us."
    @@welcome_your_views="What do you think of our app? It would be great to hear your views."
    @@welcome_rate_app="Button: Rate the MyFirstChoice app"
    @@welcome_home="We hope you had a great holiday with us."

    @@welcome_button_contact_us="Contact us"
    @@welcome_button_excursions="View excursions"
    @@welcome_button_view_my_flight="View my flight"
    @@welcome_button_view_extras="View extras"
    @@welcome_button_view_weather="View weather"
    @@welcome_button_rate="Rate the MyFirstChoice app"

    #List of all welcome messages
    @@welcome_msg_hash={
        "43 or more days" => [@@welcome_tips, @@welcome_extras_available, @@welcome_need_help],
        "29 to 42 days" => [@@welcome_need_help, @@welcome_extras_available, @@welcome_excursion, @@welcome_tips],
        "15 to 28 days" => [@@welcome_need_help, @@welcome_extras_available, @@welcome_excursion, @@welcome_countdown_month, @@welcome_tips],
        "7 to 14 days" => [@@welcome_need_help, @@welcome_extras_available, @@welcome_excursion, @@welcome_countdown_days, @@welcome_tips],
        "1 to 6 days" => [@@welcome_need_help, @@welcome_extras_available, @@welcome_excursion, @@welcome_tips],
        "less than 1 day" => [@@welcome_need_help, @@welcome_extras_available, @@welcome_excursion, @@welcome_countdown_tomorrow, @@welcome_tips],
        "in resort" => [@@welcome_extras_available, @@welcome_at_destination, @@welcome_excursion],
        "more than 1 day past" => [@@welcome_home]

    }

    #List of states for messages to be verified, To complete verification of message for each criteria (ex: "more than 1 day past")
    #Test must be run to verify that all messages in @@welcome_msg_hash["more than 1 day past"] must be verified
    # it will look like
    @@welcome_msg_hash_verified={}
    @@welcome_msg_hash.each do |criteria, values|
      arr=[]
      values.each do |msg|
        arr << false
      end
      @@welcome_msg_hash_verified[criteria]=arr
    end


  end
end


