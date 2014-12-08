require 'json'
require 'date'
require 'rickshaw'
require_relative '../support/users'
$g_secret_key="hf5GGmLb9EtzNYFNXyYQ2ial9COEg8VGawuAjIKvGsNuzGF1hhVyKVkTMEqrjOC"

def get_handshake(path)
  str=path+ $g_secret_key+ "abcd"
  str.to_sha1
end

def nor_auth_key(reservationCode, phone)
  #login
  handshake=get_handshake("/login")
  cmd=%Q{curl '#{$g_endpoint}/login' -H 'tui-public-key: abcd' -H 'Origin: http://37.46.24.155:8001' -H 'tui-brand: nordics' -H 'Accept-Language: en-US,en;q=0.8,kn;q=0.6' -H 'Content-Type: multipart/form-data; boundary=----WebKitFormBoundaryv3m9Mh4tIQcBimjw' -H 'Accept: */*' -H 'Referer: http://37.46.24.155:8001/index.html' -H 'Accept-Encoding: gzip,deflate' -H 'tui-auth-key: f1b0991b21551710cec8d3b01234be67' -H 'Connection: keep-alive' -H 'tui-app-locale: sv-SE' -H 'tui-handshake: #{handshake}' --data-binary $'------WebKitFormBoundaryv3m9Mh4tIQcBimjw\r\nContent-Disposition: form-data; name="phone"\r\n\r\n#{phone}\r\n------WebKitFormBoundaryv3m9Mh4tIQcBimjw\r\nContent-Disposition: form-data; name="reservationCode"\r\n\r\n#{reservationCode}\r\n------WebKitFormBoundaryv3m9Mh4tIQcBimjw--\r\n' --compressed}
  res=JSON.parse(`#{cmd}`)
  res["payload"]["auth"] #return auth key
end

def eng_auth_key(surname, departureDate, visionShopNumber, visionBookingRef)
  #login
  handshake=get_handshake("/login")

  puts surname, departureDate, visionShopNumber, visionBookingRef

  if $g_phone
    cmd= %Q{curl '#{$g_endpoint}/login' -H 'tui-public-key: abcd' -H 'Origin: http://37.46.24.155:8001' -H 'tui-brand: uk-#{$brand}' -H 'Accept-Language: en-US,en;q=0.8,kn;q=0.6' -H 'Content-Type: multipart/form-data; boundary=----WebKitFormBoundarynMZRfVlNlHVLrdld' -H 'Accept: */*' -H 'Referer: http://37.46.24.155:8001/index.html' -H 'Accept-Encoding: gzip,deflate' -H 'tui-auth-key: bf8a027a-92bb-4e07-aaa5-ae455553be7f' -H 'Connection: keep-alive' -H 'tui-handshake: #{handshake}' --data-binary $'------WebKitFormBoundarynMZRfVlNlHVLrdld\r\nContent-Disposition: form-data; name="surname"\r\n\r\n#{surname}\r\n------WebKitFormBoundarynMZRfVlNlHVLrdld\r\nContent-Disposition: form-data; name="departureDate"\r\n\r\n#{departureDate}\r\n------WebKitFormBoundarynMZRfVlNlHVLrdld\r\nContent-Disposition: form-data; name="visionShopNumber"\r\n\r\n#{visionShopNumber}\r\n------WebKitFormBoundarynMZRfVlNlHVLrdld\r\nContent-Disposition: form-data; name="visionBookingRef"\r\n\r\n#{visionBookingRef}\r\n------WebKitFormBoundarynMZRfVlNlHVLrdld\r\nContent-Disposition: form-data; name="devicetype"\r\n\r\niphone\r\n------WebKitFormBoundarynMZRfVlNlHVLrdld\r\nContent-Disposition: form-data; name="deviceid"\r\n\r\n12346374\r\n------WebKitFormBoundarynMZRfVlNlHVLrdld--\r\n' --compressed}
  elsif $g_tablet
    cmd=%Q{curl '#{$g_endpoint}/login'  -H 'tui-public-key: abcd' -H 'tui-brand: uk-#{$brand}' -H 'Content-Type: multipart/form-data; boundary=----WebKitFormBoundaryIYAw2yoQMahpsmdv' -H 'Accept: */*' -H 'Referer: http://37.46.24.155:8001/index.html' -H 'Accept-Encoding: gzip,deflate,sdch' -H 'tui-auth-key: dfbb707a-b928-479f-a69d-317c4fe10e38' -H 'Connection: keep-alive' -H 'tui-handshake: #{handshake}' --data-binary $'------WebKitFormBoundaryIYAw2yoQMahpsmdv\r\nContent-Disposition: form-data; name="surname"\r\n\r\n#{surname}\r\n------WebKitFormBoundaryIYAw2yoQMahpsmdv\r\nContent-Disposition: form-data; name="departureDate"\r\n\r\n#{departureDate}\r\n------WebKitFormBoundaryIYAw2yoQMahpsmdv\r\nContent-Disposition: form-data; name="visionShopNumber"\r\n\r\n#{visionShopNumber}\r\n------WebKitFormBoundaryIYAw2yoQMahpsmdv\r\nContent-Disposition: form-data; name="visionBookingRef"\r\n\r\n#{visionBookingRef}\r\n------WebKitFormBoundaryIYAw2yoQMahpsmdv\r\nContent-Disposition: form-data; name="devicetype"\r\n\r\niphone\r\n------WebKitFormBoundaryIYAw2yoQMahpsmdv\r\nContent-Disposition: form-data; name="deviceid"\r\n\r\n12347813\r\n------WebKitFormBoundaryIYAw2yoQMahpsmdv--\r\n' --compressed}
  end
  res=JSON.parse(`#{cmd}`)
  res["payload"]["auth"] #return auth key
end

def get_nor_payload(auth, type,reservation_code)
  puts "nor payload for #{type}"
  handshake=get_handshake("/reservation/#{reservation_code}/#{type}")
  locale="sv-SE"
  cmd=%Q{curl '#{$g_endpoint}/reservation/#{reservation_code}/#{type}' -H 'tui-public-key: abcd' -H 'Origin: http://37.46.24.155:8001' -H 'Accept-Encoding: gzip,deflate,sdch' -H 'Accept-Language: en-US,en;q=0.8,kn;q=0.6'  -H 'Accept: */*' -H 'Connection: keep-alive' -H 'Referer: http://37.46.24.155:8001/index.html' -H 'tui-auth-key: #{auth}' -H 'tui-brand: nordics' -H 'tui-app-locale: #{locale}' -H 'tui-handshake: #{handshake}' --compressed}
  res= JSON.parse(`#{cmd}`)
  return res
end
def get_eng_payload(auth, type)
  puts "eng payload for #{type}"
  handshake=get_handshake("/reservation/undefined/#{type}")

  #DEV
  # cmd=%Q{curl "#{$g_endpoint}/reservation/undefined/#{type}" -H "tui-public-key: abcd" -H "Origin: http://37.46.24.155:8001" -H "tui-screen-height: 768" -H "Accept-Encoding: gzip,deflate,sdch" -H "Host: e03682051d4856bdd66e2bf5a183986a8898c3bd.dev.tui.appcelerator.com" -H "Accept-Language: en-US,en;q=0.8"  -H "Accept: */*" -H "tui-brand: uk-#{$brand}" -H "Referer: http://37.46.24.155:8001/index.html" -H "tui-tablet: true" -H "tui-auth-key: #{auth}" -H "Connection: keep-alive" -H "tui-screen-width: 1024" -H "tui-handshake: #{handshake}"}

  #TEST
  if $g_tablet
    cmd= %Q{curl '#{$g_endpoint}/reservation/undefined/#{type}' -H 'tui-public-key: abcd' -H 'tui-screen-height: 768' -H 'Accept-Encoding: gzip,deflate,sdch' -H 'Accept-Language: en-US,en;q=0.8,kn;q=0.6'  -H 'Accept: */*' -H 'tui-brand: uk-#{$brand}' -H 'Referer: http://37.46.24.155:8001/index.html' -H 'tui-tablet: true' -H 'tui-auth-key: #{auth}' -H 'Connection: keep-alive' -H 'tui-screen-width: 1024' -H 'tui-handshake: #{handshake}' --compressed}
  elsif $g_phone
    cmd=%Q{curl '#{$g_endpoint}/reservation/undefined/#{type}' -H 'tui-public-key: abcd' -H 'tui-brand: uk-#{$brand}' -H 'Accept-Encoding: gzip,deflate,sdch' -H 'Accept-Language: en-US,en;q=0.8,kn;q=0.6' -H 'tui-auth-key: #{auth}' -H 'Accept: */*' -H 'Referer: http://37.46.24.155:8001/index.html' -H 'Connection: keep-alive' -H 'tui-handshake: #{handshake}' --compressed}
  end
  res= JSON.parse(`#{cmd}`)
  return res
end

def eng_user_details
  $g_user={}
  user=THOMSON_USER if (ENV['TESTENV']=='EN_TH')
  user=FIRSTCHOICE_USER if (ENV['TESTENV']=='EN_FC')
  $brand="thomson" if (ENV['TESTENV']=='EN_TH')
  $brand="first-choice" if (ENV['TESTENV']=='EN_FC')

  if $g_tablet
    $g_endpoint="https://1af03bccc1a56241c802f2bf900ab7e6b54a04a8.test.tui.appcelerator.com"
  elsif $g_phone
    $g_endpoint="https://e03682051d4856bdd66e2bf5a183986a8898c3bd.dev.tui.appcelerator.com"
  end
  departureDate = DateTime.parse(user[:valid][:departuredate]).strftime("%Y-%m-%d")
  surname=user[:valid][:surname]
  visionShopNumber=user[:valid][:VisionShopNumber].to_i
  visionBookingRef=user[:valid][:VisionBookingRef].to_i

  auth = eng_auth_key(surname, departureDate, visionShopNumber, visionBookingRef)
  puts auth
  res_home=get_eng_payload(auth, "home")
  res_weather=get_eng_payload(auth, "weather")
  res_summary=get_eng_payload(auth, "summary")
  res_checklist=get_eng_payload(auth, "checklist")
  res_destination=get_eng_payload(auth, "destination")
  res_excursions=get_eng_payload(auth, "excursions")
  res_countdown=get_eng_payload(auth, "countdown")

  $g_countdown=res_countdown
  $g_excursions=res_excursions
  $g_destinations=res_destination
  $g_current_booking=res_home
  $g_eng_checklist=res_checklist
  $g_weather = res_weather
  $g_summary = res_summary
end


def get_de_payload(booking_code, auth, type)
  puts "de payload for #{type}"
  @typical_booking_code=booking_code
  handshake=get_handshake("/reservation/#{@typical_booking_code}/#{type}")

  if $g_tablet
    cmd=%Q{curl '#{$g_endpoint}/reservation/#{@typical_booking_code}/#{type}' -H 'tui-public-key: abcd' -H 'Origin: http://37.46.24.155:8001' -H 'tui-brand: tui-de' -H 'Accept-Encoding: gzip,deflate,sdch' -H 'Accept-Language: en-US,en;q=0.8,kn;q=0.6'  -H 'tui-tablet: true' -H 'Accept: */*' -H 'Referer: http://37.46.24.155:8001/index.html' -H 'tui-screen-height: 768' -H 'tui-auth-key: PHPSESSID=#{auth}; path=/' -H 'Connection: keep-alive' -H 'tui-screen-width: 1024' -H 'tui-handshake: #{handshake}' --compressed}
  elsif $g_phone
    cmd=%Q{curl "#{$g_endpoint}/reservation/#{@typical_booking_code}/#{type}" -H 'tui-public-key: abcd' -H 'tui-brand: tui-de' -H 'Accept-Language: en-US,en;q=0.8,kn;q=0.6' -H 'Authorization: Basic ZGV2ZWxvcGVyOnRlc3RUZXN0' -H 'Accept: */*' -H 'Referer: http://37.46.24.155:8001/index.html' -H 'Accept-Encoding: gzip,deflate,sdch' -H 'tui-auth-key: PHPSESSID=#{auth}; path=/; secure; HttpOnly' -H 'Connection: keep-alive' -H 'tui-handshake: #{handshake}' --compressed}
  end
  return JSON.parse(`#{cmd}`)
end

def de_user_details
  $g_endpoint="http://37.46.24.155:3001" # DEV ENV
  @typical_booking_code="test0012" if $g_tablet # DEV ENV
  @typical_booking_code="test0012" if $g_phone # DEV ENV

  username="userdea@gmail.com"
  password="testtest"
  handshake=get_handshake("/login")

  if $g_tablet
    cmd=%Q{curl '#{$g_endpoint}/login' -H 'tui-public-key: abcd' -H 'Origin: http://37.46.24.155:8001' -H 'tui-brand: tui-de' -H 'Accept-Language: en-US,en;q=0.8' -H 'tui-screen-height: 768' -H 'Content-Type: multipart/form-data; boundary=----WebKitFormBoundaryZ1OvZyyXBlRO2nEB' -H 'Accept: */*' -H 'Referer: http://37.46.24.155:8001/index.html' -H 'Accept-Encoding: gzip,deflate,sdch' -H 'Connection: keep-alive' -H 'tui-handshake: #{handshake}' --data-binary $'------WebKitFormBoundaryZ1OvZyyXBlRO2nEB\r\nContent-Disposition: form-data; name="username"\r\n\r\n#{username}\r\n------WebKitFormBoundaryZ1OvZyyXBlRO2nEB\r\nContent-Disposition: form-data; name="password"\r\n\r\n#{password}\r\n------WebKitFormBoundaryZ1OvZyyXBlRO2nEB--\r\n' --compressed}
  elsif $g_phone
    cmd=%Q{curl '#{$g_endpoint}/login' -H 'tui-public-key: abcd' -H 'Origin: http://37.46.24.155:8001' -H 'tui-auth-key: PHPSESSID=g5qamb5blsuke6lh6kgv5e4643; path=/; secure; HttpOnly' -H 'Content-Type: multipart/form-data; boundary=----WebKitFormBoundaryOdmlO8xXwqlNplAo' -H 'Referer: http://37.46.24.155:8001/index.html'  -H 'tui-brand: tui-de' -H 'tui-handshake: #{handshake}' --data-binary $'------WebKitFormBoundaryOdmlO8xXwqlNplAo\r\nContent-Disposition: form-data; name="username"\r\n\r\n#{username}\r\n------WebKitFormBoundaryOdmlO8xXwqlNplAo\r\nContent-Disposition: form-data; name="password"\r\n\r\n#{password}\r\n------WebKitFormBoundaryOdmlO8xXwqlNplAo--\r\n' --compressed}
  end

  res_login=JSON.parse(`#{cmd}`)
  auth=res_login["payload"]["auth"].match(/PHPSESSID=(.*);/)[1]
  puts "auth #{auth}"

  res_typ_home=get_de_payload(@typical_booking_code, auth, "home")
  res_typ_excursions=get_de_payload(@typical_booking_code, auth, "excursions")
  res_destinations=get_de_payload(@typical_booking_code, auth, "destination")
  res_weather=get_de_payload(@typical_booking_code, auth, "weather")
  res_summary=get_de_payload(@typical_booking_code, auth, "summary")
  res_countdown=get_de_payload(@typical_booking_code, auth, "countdown")

  $g_user_info, $g_typical_booking_data, $g_excursions, $g_destinations= res_login, res_typ_home, res_typ_excursions, res_destinations
  $g_countdown=res_countdown
  $g_weather = res_weather
  $g_summary = res_summary
end

def nor_user_details

  $g_endpoint="https://1af03bccc1a56241c802f2bf900ab7e6b54a04a8.test.tui.appcelerator.com"
  bookingnumber=NOR_USER[:valid][:bookingnumber]
  emailOrTelephone=NOR_USER[:valid][:telefon]

  auth = nor_auth_key(bookingnumber, emailOrTelephone)
  puts auth
  res_home=get_nor_payload(auth, "home",bookingnumber)
  res_weather=get_nor_payload(auth, "weather",bookingnumber)
  res_summary=get_nor_payload(auth, "summary", bookingnumber)
  res_checklist=get_nor_payload(auth, "checklist", bookingnumber)
  res_destination=get_nor_payload(auth, "destination", bookingnumber)
  res_excursions=get_nor_payload(auth, "excursions", bookingnumber)
  res_countdown=get_nor_payload(auth, "countdown", bookingnumber)

  $g_countdown=res_countdown
  $g_excursions=res_excursions
  $g_destinations=res_destination
  $g_current_booking=res_home
  $g_eng_checklist=res_checklist
  $g_weather = res_weather
  $g_summary = res_summary
end

if $g_current_app== "DE_MT"
  de_user_details
  $g_booking.set_payload($g_typical_booking_data["payload"])
elsif $g_current_app== "EN_TH" || $g_current_app== "EN_FC"
  eng_user_details
  $g_booking.set_payload($g_current_booking["payload"])
elsif $g_current_app== "NOR_sv"
  nor_user_details
  $g_booking.set_payload($g_current_booking["payload"])
end


