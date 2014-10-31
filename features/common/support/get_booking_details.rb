require 'json'
require 'date'
require 'rickshaw'
require_relative '../support/users'
$g_secret_key="hf5GGmLb9EtzNYFNXyYQ2ial9COEg8VGawuAjIKvGsNuzGF1hhVyKVkTMEqrjOC"

def get_handshake(path)
  str=path+ $g_secret_key+ "abcd"
  str.to_sha1
end

def nor_auth_key(phone, reservationCode)
  #login
  handshake=get_handshake("/login")
  cmd=%Q{curl '#{$g_endpoint}/login' -H 'tui-public-key: abcd' -H 'Origin: http://37.46.24.155:8001'  -H 'Content-Type: multipart/form-data; boundary=----WebKitFormBoundaryNayEAbjQAnKtzibU' -H 'Referer: http://37.46.24.155:8001/index.html' -H 'tui-brand: nordics' -H 'tui-app-locale: sv-SE' -H 'tui-handshake: #{handshake}' --data-binary $'------WebKitFormBoundaryNayEAbjQAnKtzibU\r\nContent-Disposition: form-data; name="reservationCode"\r\n\r\n#{reservationCode}\r\n------WebKitFormBoundaryNayEAbjQAnKtzibU\r\nContent-Disposition: form-data; name="email"\r\n\r\n\r\n------WebKitFormBoundaryNayEAbjQAnKtzibU\r\nContent-Disposition: form-data; name="phone"\r\n\r\n#{phone}\r\n------WebKitFormBoundaryNayEAbjQAnKtzibU\r\nContent-Disposition: form-data; name="returnWithHomeScreen"\r\n\r\n0\r\n------WebKitFormBoundaryNayEAbjQAnKtzibU--\r\n' --compressed}

  res=JSON.parse(`#{cmd}`)
  res["payload"]["auth"] #return auth key
end

def eng_auth_key(surname, departureDate, visionShopNumber, visionBookingRef)
  #login
  handshake=get_handshake("/login")

  puts surname, departureDate, visionShopNumber, visionBookingRef

  cmd=%Q{curl '#{$g_endpoint}/login'  -H 'tui-public-key: abcd' -H 'tui-brand: uk-#{$brand}' -H 'Content-Type: multipart/form-data; boundary=----WebKitFormBoundaryIYAw2yoQMahpsmdv' -H 'Accept: */*' -H 'Referer: http://37.46.24.155:8001/index.html' -H 'Accept-Encoding: gzip,deflate,sdch' -H 'tui-auth-key: dfbb707a-b928-479f-a69d-317c4fe10e38' -H 'Connection: keep-alive' -H 'tui-handshake: #{handshake}' --data-binary $'------WebKitFormBoundaryIYAw2yoQMahpsmdv\r\nContent-Disposition: form-data; name="surname"\r\n\r\n#{surname}\r\n------WebKitFormBoundaryIYAw2yoQMahpsmdv\r\nContent-Disposition: form-data; name="departureDate"\r\n\r\n#{departureDate}\r\n------WebKitFormBoundaryIYAw2yoQMahpsmdv\r\nContent-Disposition: form-data; name="visionShopNumber"\r\n\r\n#{visionShopNumber}\r\n------WebKitFormBoundaryIYAw2yoQMahpsmdv\r\nContent-Disposition: form-data; name="visionBookingRef"\r\n\r\n#{visionBookingRef}\r\n------WebKitFormBoundaryIYAw2yoQMahpsmdv\r\nContent-Disposition: form-data; name="devicetype"\r\n\r\niphone\r\n------WebKitFormBoundaryIYAw2yoQMahpsmdv\r\nContent-Disposition: form-data; name="deviceid"\r\n\r\n12347813\r\n------WebKitFormBoundaryIYAw2yoQMahpsmdv--\r\n' --compressed}
  res=JSON.parse(`#{cmd}`)
  res["payload"]["auth"] #return auth key
end

def get_eng_payload(auth,type)
  #get weather
  handshake=get_handshake("/reservation/undefined/#{type}")
  cmd=%Q{curl "#{$g_endpoint}/reservation/undefined/#{type}" -H "tui-public-key: abcd" -H "Origin: http://37.46.24.155:8001" -H "tui-screen-height: 768" -H "Accept-Encoding: gzip,deflate,sdch" -H "Host: e03682051d4856bdd66e2bf5a183986a8898c3bd.dev.tui.appcelerator.com" -H "Accept-Language: en-US,en;q=0.8"  -H "Accept: */*" -H "tui-brand: uk-#{$brand}" -H "Referer: http://37.46.24.155:8001/index.html" -H "tui-tablet: true" -H "tui-auth-key: #{auth}" -H "Connection: keep-alive" -H "tui-screen-width: 1024" -H "tui-handshake: #{handshake}"}
  return JSON.parse(`#{cmd}`)
end

def eng_user_details
  $g_user={}
  user=THOMSON_USER if (ENV['TESTENV']=='EN_TH')
  user=FIRSTCHOICE_USER if (ENV['TESTENV']=='EN_FC')
  $brand="thomson" if (ENV['TESTENV']=='EN_TH')
  $brand="first-choice" if (ENV['TESTENV']=='EN_FC')

  $g_endpoint="https://e03682051d4856bdd66e2bf5a183986a8898c3bd.dev.tui.appcelerator.com"
  departureDate = DateTime.parse(user[:valid][:departuredate]).strftime("%Y-%m-%d")
  surname=user[:valid][:surname]
  visionShopNumber=user[:valid][:VisionShopNumber].to_i
  visionBookingRef=user[:valid][:VisionBookingRef].to_i

  auth = eng_auth_key(surname, departureDate, visionShopNumber, visionBookingRef)

  res_home=get_eng_payload(auth,"home")
  res_weather=get_eng_payload(auth,"weather")
  res_summary=get_eng_payload(auth,"summary")
  res_checklist=get_eng_payload(auth,"checklist")
  res_destination=get_eng_payload(auth,"destination")

  $g_destinations=res_destination
  $g_current_booking=res_home
  $g_engChecklist=res_checklist
  $g_weather = res_weather
  $g_summary = res_summary

end



def get_de_payload(booking_code,auth,type)
  @typical_booking_code=booking_code
  handshake=get_handshake("/reservation/#{@typical_booking_code}/#{type}")
  cmd=%Q{curl '#{$g_endpoint}/reservation/#{@typical_booking_code}/#{type}' -H 'tui-public-key: abcd' -H 'Origin: http://37.46.24.155:8001' -H 'tui-brand: tui-de' -H 'Accept-Encoding: gzip,deflate,sdch' -H 'Accept-Language: en-US,en;q=0.8,kn;q=0.6'  -H 'tui-tablet: true' -H 'Accept: */*' -H 'Referer: http://37.46.24.155:8001/index.html' -H 'tui-screen-height: 768' -H 'tui-auth-key: PHPSESSID=#{auth}; path=/' -H 'Connection: keep-alive' -H 'tui-screen-width: 1024' -H 'tui-handshake: #{handshake}' --compressed}
  return JSON.parse(`#{cmd}`)
end

def de_user_details
  $g_endpoint="http://37.46.24.155:3001" # DEV ENV
  @typical_booking_code="test0012" # DEV ENV

  username="userdea@gmail.com"
  password="testtest"
  handshake=get_handshake("/login")

  cmd=%Q{curl '#{$g_endpoint}/login' -H 'tui-public-key: abcd' -H 'Origin: http://37.46.24.155:8001' -H 'tui-brand: tui-de' -H 'Accept-Language: en-US,en;q=0.8' -H 'tui-screen-height: 768' -H 'Content-Type: multipart/form-data; boundary=----WebKitFormBoundaryZ1OvZyyXBlRO2nEB' -H 'Accept: */*' -H 'Referer: http://37.46.24.155:8001/index.html' -H 'Accept-Encoding: gzip,deflate,sdch' -H 'Connection: keep-alive' -H 'tui-handshake: #{handshake}' --data-binary $'------WebKitFormBoundaryZ1OvZyyXBlRO2nEB\r\nContent-Disposition: form-data; name="username"\r\n\r\n#{username}\r\n------WebKitFormBoundaryZ1OvZyyXBlRO2nEB\r\nContent-Disposition: form-data; name="password"\r\n\r\n#{password}\r\n------WebKitFormBoundaryZ1OvZyyXBlRO2nEB--\r\n' --compressed}
  res_login=JSON.parse(`#{cmd}`)
  auth=res_login["payload"]["auth"].match(/PHPSESSID=(.*);/)[1]
  puts "auth #{auth}"

  res_typ_home=get_de_payload(@typical_booking_code,auth,"home")
  res_typ_excursions=get_de_payload(@typical_booking_code,auth,"excursions")
  res_destinations=get_de_payload(@typical_booking_code,auth,"destination")
  res_weather=get_de_payload(@typical_booking_code,auth,"weather")
  res_summary=get_de_payload(@typical_booking_code,auth,"summary")

  $g_user_info, $g_typical_booking_data, $g_excursions, $g_destinations= res_login, res_typ_home, res_typ_excursions, res_destinations
  $g_weather = res_weather
  $g_summary = res_summary
end

def nor_user_details
  phone=NOR_USER[:valid][:telefon]
  reservationCode=NOR_USER[:valid][:bookingnumber]

  $g_endpoint="http://1af03bccc1a56241c802f2bf900ab7e6b54a04a8.test.tui.appcelerator.com"
  auth=nor_auth_key(phone, reservationCode)
end

if $g_current_app== "DE_MT"
  de_user_details
  $g_booking.set_payload($g_typical_booking_data["payload"])
elsif $g_current_app== "EN_TH" || $g_current_app== "EN_FC"
  eng_user_details
  $g_booking.set_payload($g_current_booking["payload"])
end


