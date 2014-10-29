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
  #puts "#{cmd}"
  #puts res
  res["payload"]["auth"] #return auth key
end

def get_payload_for_type(visionBookingRef, path, auth, reservationCode=0)
  url="/reservation/#{visionBookingRef}/#{path}"
  handshake=get_handshake(url)
  if ENV['TESTENV']=='EN_TH' || ENV['TESTENV']=='EN_FC'
    cmd=%Q{curl '#{$g_endpoint}#{url}' -H 'tui-public-key: abcd' -H 'tui-brand: uk-#{$brand}'  -H 'tui-auth-key: #{auth}' -H 'Accept: */*'  -H 'Connection: keep-alive' -H 'tui-handshake: #{handshake}' --compressed}
  elsif ENV['TESTENV']=="NOR"
    #  puts "nordics payload"
    cmd=%Q{curl '#{$g_endpoint}#{url}' -H 'tui-public-key: abcd' -H 'tui-brand: nordics' -H 'Accept-Language: en-US,en;q=0.8' -H 'tui-auth-key: #{auth}' -H 'Accept: */*' -H 'Referer: http://37.46.24.155:8001/index.html' -H 'Accept-Encoding: gzip,deflate,sdch' -H 'Connection: keep-alive' -H 'tui-app-locale: sv-SE' -H 'tui-handshake: #{handshake}' --compressed}
  elsif ENV['TESTENV']=="DE"
  end

  res=JSON.parse(`#{cmd}`)
  return res
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

  #get weather
  handshake=get_handshake("/reservation/undefined/weather")
  cmd=%Q{curl '#{$g_endpoint}/reservation/undefined/weather' -H 'tui-public-key: abcd' -H 'Origin: http://37.46.24.155:8001' -H 'tui-brand: uk-#{$brand}' -H 'Accept-Encoding: gzip,deflate,sdch' -H 'Accept-Language: en-US,en;q=0.8,kn;q=0.6' -H 'tui-tablet: true' -H 'Accept: */*' -H 'Referer: http://37.46.24.155:8001/index.html' -H 'tui-screen-height: 768' -H 'tui-auth-key: #{auth}' -H 'Connection: keep-alive' -H 'tui-screen-width: 1024' -H 'tui-handshake: #{handshake}' --compressed}
  res_weather=JSON.parse(`#{cmd}`)

  #get summary
  handshake=get_handshake("/reservation/undefined/summary")
  cmd= %Q{curl '#{$g_endpoint}/reservation/undefined/summary' -H 'tui-public-key: abcd' -H 'Origin: http://37.46.24.155:8001' -H 'tui-brand: uk-#{$brand}' -H 'Accept-Encoding: gzip,deflate,sdch' -H 'Accept-Language: en-US,en;q=0.8' -H 'tui-tablet: true' -H 'Accept: */*' -H 'Referer: http://37.46.24.155:8001/index.html' -H 'tui-screen-height: 768' -H 'tui-auth-key: #{auth}' -H 'Connection: keep-alive' -H 'tui-screen-width: 1024' -H 'tui-handshake: #{handshake}' --compressed}
  res_summary=JSON.parse(`#{cmd}`)

  $g_current_booking=get_payload_for_type(visionBookingRef, "home", auth)
  $g_engChecklist=get_payload_for_type(visionBookingRef, "checklist", auth)
  $g_weather = res_weather
  $g_summary = res_summary
end

def nor_user_details
  phone=NOR_USER[:valid][:telefon]
  reservationCode=NOR_USER[:valid][:bookingnumber]

  $g_endpoint="http://1af03bccc1a56241c802f2bf900ab7e6b54a04a8.test.tui.appcelerator.com"
  auth=nor_auth_key(phone, reservationCode)
  #puts get_payload_for_type(reservationCode, "home", auth)
end

def de_user_details
  # $g_endpoint="http://e03682051d4856bdd66e2bf5a183986a8898c3bd.dev.tui.appcelerator.com"  # DEV ENV
  $g_endpoint="http://37.46.24.155:3001" # DEV ENV
  # $g_endpoint="https://1af03bccc1a56241c802f2bf900ab7e6b54a04a8.test.tui.appcelerator.com"  # TEST ENV
  @typical_booking_code="test0012" # DEV ENV
  #@typical_booking_code="23555434" # TEST ENV
  username="userdea@gmail.com"
  password="testtest"
  handshake=get_handshake("/login")
  #cmd=%Q{curl 'https://e03682051d4856bdd66e2bf5a183986a8898c3bd.dev.tui.appcelerator.com/login' -H 'tui-public-key: b6f0c43c-6619-47f4-a9e8-24653b25de16' -H 'Origin: http://37.46.24.155:8001' -H 'tui-screen-height: 768' -H 'Content-Type: multipart/form-data; boundary=----WebKitFormBoundaryrW4npWUMjAEDoRss' -H 'Referer: http://37.46.24.155:8001/index.html' -H 'X-DevTools-Emulate-Network-Conditions-Client-Id: E2B6F18A-6419-8BD8-AC91-2AAAC18924E2' -H 'tui-tablet: true' -H 'tui-auth-key: PHPSESSID=72bu3blfdncj7il5v5ad7a4bj3; path=/' -H 'tui-brand: tui-de' -H 'tui-screen-width: 1024' -H 'tui-handshake: 8638ae87619555bbca743973cc73b99ac8f46146' --data-binary $'------WebKitFormBoundaryrW4npWUMjAEDoRss\r\nContent-Disposition: form-data; name="username"\r\n\r\nuserdea@gmail.com\r\n------WebKitFormBoundaryrW4npWUMjAEDoRss\r\nContent-Disposition: form-data; name="password"\r\n\r\ntesttest\r\n------WebKitFormBoundaryrW4npWUMjAEDoRss--\r\n' --compressed}
  cmd=%Q{curl '#{$g_endpoint}/login' -H 'tui-public-key: abcd' -H 'Origin: http://37.46.24.155:8001' -H 'tui-brand: tui-de' -H 'Accept-Language: en-US,en;q=0.8' -H 'tui-screen-height: 768' -H 'Content-Type: multipart/form-data; boundary=----WebKitFormBoundaryZ1OvZyyXBlRO2nEB' -H 'Accept: */*' -H 'Referer: http://37.46.24.155:8001/index.html' -H 'Accept-Encoding: gzip,deflate,sdch' -H 'Connection: keep-alive' -H 'tui-handshake: #{handshake}' --data-binary $'------WebKitFormBoundaryZ1OvZyyXBlRO2nEB\r\nContent-Disposition: form-data; name="username"\r\n\r\n#{username}\r\n------WebKitFormBoundaryZ1OvZyyXBlRO2nEB\r\nContent-Disposition: form-data; name="password"\r\n\r\n#{password}\r\n------WebKitFormBoundaryZ1OvZyyXBlRO2nEB--\r\n' --compressed}
  res_login=JSON.parse(`#{cmd}`)
  auth=res_login["payload"]["auth"].match(/PHPSESSID=(.*);/)[1]
  puts "auth #{auth}"

  handshake=get_handshake("/reservation/#{@typical_booking_code}/home")
  cmd=%Q{curl '#{$g_endpoint}/reservation/#{@typical_booking_code}/home' -H 'tui-public-key: abcd' -H 'Origin: http://37.46.24.155:8001' -H 'tui-brand: tui-de' -H 'Accept-Encoding: gzip,deflate,sdch' -H 'Accept-Language: en-US,en;q=0.8,kn;q=0.6'  -H 'tui-tablet: true' -H 'Accept: */*' -H 'Referer: http://37.46.24.155:8001/index.html' -H 'tui-screen-height: 768' -H 'tui-auth-key: PHPSESSID=#{auth}; path=/' -H 'Connection: keep-alive' -H 'tui-screen-width: 1024' -H 'tui-handshake: #{handshake}' --compressed}
  res_typ_home=JSON.parse(`#{cmd}`)

  handshake=get_handshake("/reservation/#{@typical_booking_code}/excursions")
  cmd= %Q{curl '#{$g_endpoint}/reservation/#{@typical_booking_code}/excursions' -H 'tui-public-key: abcd'  -H 'tui-tablet: true' -H 'Accept: */*' -H 'tui-screen-height: 768' -H 'tui-auth-key: PHPSESSID=#{auth}; path=/' -H 'Connection: keep-alive' -H 'tui-screen-width: 1024' -H 'tui-handshake: #{handshake}' --compressed}
  res_typ_excursions=JSON.parse(`#{cmd}`)

  handshake=get_handshake("/reservation/#{@typical_booking_code}/destination")
  cmd=%Q{curl '#{$g_endpoint}/reservation/#{@typical_booking_code}/destination' -H 'tui-public-key: abcd' -H 'Origin: http://37.46.24.155:8001' -H 'tui-brand: tui-de' -H 'Accept-Encoding: gzip,deflate,sdch' -H 'Accept-Language: en-US,en;q=0.8,kn;q=0.6' -H 'tui-tablet: true' -H 'Accept: */*' -H 'Referer: http://37.46.24.155:8001/index.html' -H 'tui-screen-height: 768' -H 'tui-auth-key: PHPSESSID=#{auth}; path=/; secure; HttpOnly' -H 'Connection: keep-alive' -H 'tui-screen-width: 1024' -H 'tui-handshake: #{handshake}' --compressed}
  res_destinations=JSON.parse(`#{cmd}`)

  handshake=get_handshake("/reservation/#{@typical_booking_code}/weather")
  cmd=%Q{curl '#{$g_endpoint}/reservation/#{@typical_booking_code}/weather' -H 'tui-public-key: abcd' -H 'Origin: http://37.46.24.155:8001' -H 'tui-brand: tui-de' -H 'Accept-Encoding: gzip,deflate,sdch' -H 'Accept-Language: en-US,en;q=0.8,kn;q=0.6'  -H 'tui-tablet: true' -H 'Accept: */*' -H 'Referer: http://37.46.24.155:8001/index.html' -H 'tui-screen-height: 768' -H 'tui-auth-key: PHPSESSID=#{auth}; path=/; secure; HttpOnly' -H 'Connection: keep-alive' -H 'tui-screen-width: 1024' -H 'tui-handshake:  #{handshake}' --compressed}
  res_weather=JSON.parse(`#{cmd}`)

  handshake=get_handshake("/reservation/#{@typical_booking_code}/summary")
  cmd=%Q{curl '#{$g_endpoint}/reservation/#{@typical_booking_code}/summary' -H 'tui-public-key: abcd' -H 'Origin: http://37.46.24.155:8001' -H 'tui-brand: tui-de' -H 'Accept-Encoding: gzip,deflate,sdch' -H 'Accept-Language: en-US,en;q=0.8' -H 'tui-tablet: true' -H 'Accept: */*' -H 'Referer: http://37.46.24.155:8001/index.html' -H 'tui-screen-height: 768' -H 'tui-auth-key: PHPSESSID=#{auth}; path=/; secure; HttpOnly' -H 'Connection: keep-alive' -H 'tui-screen-width: 1024' -H 'tui-handshake:  #{handshake}' --compressed}
  res_summary=JSON.parse(`#{cmd}`)

  #puts "$g_typical_booking_data #{$g_typical_booking_data}"
  $g_user_info, $g_typical_booking_data, $g_excursions, $g_destinations= res_login, res_typ_home, res_typ_excursions, res_destinations
  $g_weather = res_weather
  $g_summary = res_summary
  #puts res_weather

end

if $g_current_app== "DE_MT"
  de_user_details
elsif $g_current_app== "EN_TH" || $g_current_app== "EN_FC"
  eng_user_details
  # puts $g_current_booking
  $g_booking.set_payload($g_current_booking["payload"])
end
