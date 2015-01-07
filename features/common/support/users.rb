# Pre prod
# #DE_USER||= {
#    :valid => {
#        :firstname => "Susi",
#        :lastname => "Sonne",
#        :username => "Reisender",
#        :email => "Susi.Sonne@tui.de",
#        :password => "meinetui",
#        :country => "Deutschland",
#        },
#    :invalid => {
#        :username => "invalidusername",
#        :password => "nono",
#        :email => "no@nomail.com"
#    }
#}

#DEV user
DE_USER||= {
    :valid => {
        :firstname => "Peter",
        :lastname => "Pan",
        :username => "userdea@gmail.com",
        :email => "userdea@gmail.com",
        :password => "testtest",
        :country => "Deutschland",
    },
    :invalid => {
        :username => "invalidusername",
        :password => "nono",
        :email => "no@nomail.com"
    }
}


THOMSON_USER||={
    :valid => {
        :surname => "martin",
        :departuredate => "02-05-2015",
        :VisionShopNumber => "9999",
        :VisionBookingRef => "12347116",
        :DepartureTime => "10:50"

    },
    :invalid => {
        :surname => "martin",
        :departuredate => "26-10-2014",
        :VisionShopNumber => "9999",
        :VisionBookingRef => "12347027"
    },
    :noexcursion => {
        :surname => "martin",
        :departuredate => "03-08-2015",
        :VisionShopNumber => "9999",
        :VisionBookingRef => "12347657"
    },
    :post => {
        :surname => "martin",
        :departuredate => "11-10-2014",
        :VisionShopNumber => "9999",
        :VisionBookingRef => "12348047"
    }
}
FIRSTCHOICE_USER||={
    :valid => {
        :surname => "martin",
        :departuredate => "14-10-2015",
        :VisionShopNumber => "9999",
        :VisionBookingRef => "12346998",
        :DepartureTime => "10:45"
    },
    :invalid => {
        :surname => "martin",
        :departuredate => "26-10-2014",
        :VisionShopNumber => "9999",
        :VisionBookingRef => "12347027"
    },
    :post => {
        :surname => "martin",
        :departuredate => "22-10-2014",
        :VisionShopNumber => "9999",
        :VisionBookingRef => "12346717"
    }
}

#Preprod
#NOR_USER||={
#    :valid => {
#        :bookingnumber => "1Z10583",
#        :emailid => "hakan.ahman@fritidsresor.se ",
#        :telefon => "0708915078",
#        :departuredate => "22-06-2014",
#        :DepartureTime => "09:20",
#
#    },
#    :invalid => {
#        :bookingnumber => "11Y30060",
#        :emailid => "ns.w@or.se",
#        :telefon => "0722377937",
#        :departuredate => "26-10-2014",
#    }
#}

#  DEV user

NB_USER ={
    :bookingnumber => "3U55389",
    :emailid => "jan.johansson@gmail.com",
    :telefon => "0788998899",
    :departuredate => "07-03-2015",
    :DepartureTime => "13:55",
}

DA_USER ={
    :bookingnumber => "BN36227",
    :emailid => "lars.linden@fritidsresor.se",
    :telefon => "0733800015",
    :departuredate => "19-01-2015",
    :DepartureTime => "07:50",
}

FI_USER ={
    :bookingnumber => "AL75051",
    :emailid => "therese.bellhammar@fritidsresor.se",
    :telefon => "0733800015",
    :departuredate => "22-02-2015",
    :DepartureTime => "08:15",
}

SV_USER ={
    :bookingnumber => "1C62272",
    :emailid => "karin.ohlsson@fritidsresor.se",
    :telefon => "0755668899",
    :departuredate => "06-02-2015",
    :DepartureTime => "12:30",
}

if ($g_lang=="sv" ||$g_lang=="da" ||$g_lang=="fi" ||$g_lang=="nb")
  NORDICS_USER=eval("#{UnicodeUtils.upcase($g_lang)}"+"_USER")
  NOR_USER||={
      :valid => NORDICS_USER,
      :invalid => {
          :bookingnumber => "11Y30060",
          :emailid => "ns.w@or.se",
          :telefon => "0722377937",
          :departuredate => "26-10-2014",
      }
  }
end

