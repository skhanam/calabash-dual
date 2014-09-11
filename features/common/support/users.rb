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
        :bookings => {
            :destination => "Palma de Mallorca",
            :date => "06.09.2014",
            :products => "Flug"
        }},
    :invalid => {
        :username => "invalidusername",
        :password => "nono",
        :email => "no@nomail.com"
    }
}


THOMSON_USER||={
    :valid => {
        :surname => "martin",
        :departuredate => "30-06-2015",
        :VisionShopNumber => "9999",
        :VisionBookingRef => "12347077",
        :DepartureTime => "07:05"
    },
    :invalid => {
        :surname => "martin",
        :departuredate => "26-10-2014",
        :VisionShopNumber => "9999",
        :VisionBookingRef => "12347027"
    }
}
FIRSTCHOICE_USER||={
    :valid => {
        :surname => "martin",
        :departuredate => "09-05-2015",
        :VisionShopNumber => "9999",
        :VisionBookingRef => "12346467",
        :DepartureTime => "10:55"
    },
    :invalid => {
        :surname => "martin",
        :departuredate => "26-10-2014",
        :VisionShopNumber => "9999",
        :VisionBookingRef => "12347027"
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
NOR_USER||={
    :valid => {
        :bookingnumber => "3T93289",
        :emailid => "ann.alm@fritidsresor.se",
        :telefon => "0723512372",
        :departuredate => "22-07-2014",
        :DepartureTime => "16:20",

    },
    :invalid => {
        :bookingnumber => "11Y30060",
        :emailid => "ns.w@or.se",
        :telefon => "0722377937",
        :departuredate => "26-10-2014",
    }
}


