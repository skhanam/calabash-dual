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
        :departuredate => "22-04-2015",
        :VisionShopNumber => "9999",
        :VisionBookingRef => "12347813",
        :DepartureTime => "09:20"
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
        :departuredate => "20-04-2015",
        :VisionShopNumber => "9999",
        :VisionBookingRef => "12346474",
        :DepartureTime => "08:20"
    },
    :invalid => {
        :surname => "martin",
        :departuredate => "26-10-2014",
        :VisionShopNumber => "9999",
        :VisionBookingRef => "12347027"
    }
}

NOR_USER||={
    :valid => {
        :bookingnumber => "1Z10583",
        :emailid => "hakan.ahman@fritidsresor.se ",
        :telefon => "0708915078",
        :departuredate => "22-06-2014",
        :DepartureTime => "09:20",

    },
    :invalid => {
        :bookingnumber => "11Y30060",
        :emailid => "ns.w@or.se",
        :telefon => "0722377937",
        :departuredate => "26-10-2014",
    }
}

#  DEV user
#NOR_USER||={
#    :valid => {
#        :bookingnumber => "3T02809",
#        :emailid => "Karin.ohlsson@fritidsresor.se",
#        :telefon => "0739888303",
#        :departuredate => "22-07-2014",
#        :DepartureTime => "16:20",
#
#    },
#    :invalid => {
#        :bookingnumber => "11Y30060",
#        :emailid => "ns.w@or.se",
#        :telefon => "0722377937",
#        :departuredate => "26-10-2014",
#    }
#}

#:country => "Deutschland",

#def get_user_details(url)
#  username="peterpan"
#  password="testtest"
#  query_url=url||'http://37.46.24.155:3000/reservations'
#  server_url="http://37.46.24.155:3000/login"
#  res1=res1||`curl --data "username=#{username}&password=#{password}" '#{server_url}'`
#
#  puts res1
#  m=res1.match('(PHP(.*)path=\/)')
#  puts m
#  res=res||`curl --header 'tui-auth-key:#{m[1]}' #{query_url}`
#  parsed=JSON.parse(res)
#end
#
#File.open("features/common/support/Bookings", "w") do |f|
#  f.write "BOOKINGS= #{parsed}"
#end
#
#past_reservations=parsed["payload"]["reservationLists"]["PAST"][0]
#past_reservations=parsed["payload"]["reservationLists"]["PAST"][0]
#
#
#
#def get_booking_details(booking_type)
#  case
#    when "typical_booking"
#      booking_id= 80522687
#    when "flight_booking"
#      booking_id= 80522689
#    when "insurance_booking"
#      booking_id= 38072949
#    when "car_rental_booking"
#      booking_id= 36739099
#  end
#
#  query_url="http://37.46.24.155:3000/reservation/#{booking_id}/summary"
#  get_user_details(query_url)
#
#  query_url="http://37.46.24.155:3000/reservation/#{booking_id}/home"
#  get_user_details(query_url)
#
#  query_url="http://37.46.24.155:3000/reservation/#{booking_id}/weather"
#  get_user_details(query_url)
#end
#
#reservation/:reservation-id/summary
#/reservation/ 75458864/weather
#reservation/:reservation-id/home
#/reservation/ 75458864/countdown
#
#JSON.parse `curl --header 'tui-auth-key:#{m[1]}' 'http://37.46.24.155:3000/reservation/75458864/summary'`
#JSON.parse `curl --header 'tui-auth-key:#{m[1]}' 'http://37.46.24.155:3000/reservation/75458864/home'`
#JSON.parse `curl --header 'tui-auth-key:#{m[1]}' 'http://37.46.24.155:3000/reservation/75458864/countdown'`

#Thomson login and strings


#
#
#reservationCode="1Y30060"
#phone="0722177937"
#origin_url="http://37.46.24.155:8001"
#public_key="ddeb9c38-dab7-4c71-8c99-d3f0670ca705"
#email="niclas.westling@fritidsresor.se"
#cmd=%Q(curl 'https://1af03bccc1a56241c802f2bf900ab7e6b54a04a8.test.tui.appcelerator.com/login' -H 'tui-public-key: #{public_key}' -H 'Origin: #{origin_url}' -H 'tui-brand: nordics' -H 'Accept-Language: en-US,en;q=0.8' -H 'Content-Type: multipart/form-data; boundary=----WebKitFormBoundaryoDlgjn22vAh0Cv4v' -H 'Accept: */*' -H 'Referer: http://37.46.24.155:8001/index.html' -H 'Accept-Encoding: gzip,deflate,sdch' -H 'Connection: keep-alive' -H 'tui-handshake: 30abb32337d60918b2d270640cadc7859df1702b' --data-binary $'------WebKitFormBoundaryoDlgjn22vAh0Cv4v\r\nContent-Disposition: form-data; name="reservationCode"\r\n\r\n#{reservationCode}\r\n------WebKitFormBoundaryoDlgjn22vAh0Cv4v\r\nContent-Disposition: form-data; name="email"\r\n\r\n#{email}\r\n------WebKitFormBoundaryoDlgjn22vAh0Cv4v\r\nContent-Disposition: form-data; name="phone"\r\n\r\n#{phone}\r\n------WebKitFormBoundaryoDlgjn22vAh0Cv4v\r\nContent-Disposition: form-data; name="returnWithHomeScreen"\r\n\r\n0\r\n------WebKitFormBoundaryoDlgjn22vAh0Cv4v--\r\n' --compressed)
#res=`#{cmd}`
#JSON.parse(res)
