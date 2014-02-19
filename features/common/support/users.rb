USERS = {
    :valid => {
        :username => "peterpan",
        :password => "testtest",
        :country => "Germany",
        :bookings => {
            :destination => "Palma de Mallorca",
            :date => "06.09.2014",
            :products => "Flug"
        }},
    :invalid => {
        :username => "invalidusername",
        :password => "testtest",
        :email => "no@nomail.com"
    }
}


TEST_DATA ={
    :meet_representative => {
        :Department => "Sales- & Fulfillmentsystems",
        :rep_name => "M. Loehn",
        :address1 => "Karl-Wiechert-Allee 23",
        :address2 => "D 30625 Hannover"
    }

}

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
