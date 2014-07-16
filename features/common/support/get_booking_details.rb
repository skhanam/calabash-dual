require 'json'
require 'rickshaw'

require_relative 'users'
#module GetBookingDetails
$g_secret_key="hf5GGmLb9EtzNYFNXyYQ2ial9COEg8VGawuAjIKvGsNuzGF1hhVyKVkTMEqrjOC"

def get_handshake(path)
  str=path+ $g_secret_key+ "abcd"
  str.to_sha1
end

def nor_auth_key(phone, reservationCode)
  #login
  handshake=get_handshake("/login")
  cmd=%Q{curl '#{$g_dev_endpoint}/login' -H 'tui-public-key: abcd' -H 'Origin: http://37.46.24.155:8001' -H 'tui-brand: nordics' -H 'Accept-Language: en-US,en;q=0.8' -H 'Content-Type: multipart/form-data; boundary=----WebKitFormBoundarynJAG2xZsAt7dx4w9' -H 'Accept: */*' -H 'Accept-Encoding: gzip,deflate,sdch' -H 'Connection: keep-alive' -H 'tui-app-locale: sv-SE' -H 'tui-handshake: #{handshake}' --data-binary $'------WebKitFormBoundarynJAG2xZsAt7dx4w9\r\nContent-Disposition: form-data; name="phone"\r\n\r\n"#{phone}"\r\n------WebKitFormBoundarynJAG2xZsAt7dx4w9\r\nContent-Disposition: form-data; name="reservationCode"\r\n\r\n"#{reservationCode}"\r\n------WebKitFormBoundarynJAG2xZsAt7dx4w9--\r\n' --compressed}
  puts `#{cmd}`

  res=JSON.parse(`#{cmd}`)
  puts "#{res}"
  res["payload"]["auth"] #return auth key
end

def eng_auth_key(surname, departureDate, visionShopNumber, visionBookingRef)
  #login
  handshake=get_handshake("/login")
  cmd=%Q{curl '#{$g_dev_endpoint}/login'  -H 'tui-public-key: abcd' -H 'tui-brand: uk-#{$brand}' -H 'Content-Type: multipart/form-data; boundary=----WebKitFormBoundaryIYAw2yoQMahpsmdv' -H 'Accept: */*' -H 'Referer: http://37.46.24.155:8001/index.html' -H 'Accept-Encoding: gzip,deflate,sdch' -H 'tui-auth-key: dfbb707a-b928-479f-a69d-317c4fe10e38' -H 'Connection: keep-alive' -H 'tui-handshake: #{handshake}' --data-binary $'------WebKitFormBoundaryIYAw2yoQMahpsmdv\r\nContent-Disposition: form-data; name="surname"\r\n\r\n#{surname}\r\n------WebKitFormBoundaryIYAw2yoQMahpsmdv\r\nContent-Disposition: form-data; name="departureDate"\r\n\r\n#{departureDate}\r\n------WebKitFormBoundaryIYAw2yoQMahpsmdv\r\nContent-Disposition: form-data; name="visionShopNumber"\r\n\r\n#{visionShopNumber}\r\n------WebKitFormBoundaryIYAw2yoQMahpsmdv\r\nContent-Disposition: form-data; name="visionBookingRef"\r\n\r\n#{visionBookingRef}\r\n------WebKitFormBoundaryIYAw2yoQMahpsmdv\r\nContent-Disposition: form-data; name="devicetype"\r\n\r\niphone\r\n------WebKitFormBoundaryIYAw2yoQMahpsmdv\r\nContent-Disposition: form-data; name="deviceid"\r\n\r\n12347813\r\n------WebKitFormBoundaryIYAw2yoQMahpsmdv--\r\n' --compressed}
  res=JSON.parse(`#{cmd}`)
  puts "#{res}"
  res["payload"]["auth"] #return auth key
end

def get_payload_for_type(visionBookingRef, path, auth)
  url="/reservation/#{visionBookingRef}/#{path}"
  handshake=get_handshake(url)
  cmd=%Q{curl '#{$g_dev_endpoint}#{url}' -H 'tui-public-key: abcd' -H 'tui-brand: uk-#{$brand}'  -H 'tui-auth-key: #{auth}' -H 'Accept: */*'  -H 'Connection: keep-alive' -H 'tui-handshake: #{handshake}' --compressed}
  res=JSON.parse(`#{cmd}`)
end

def eng_user_details
  $g_user={}
  user=THOMSON_USER if (ENV['TESTENV']=='EN_TH')
  user=FIRSTCHOICE_USER if (ENV['TESTENV']=='EN_FC')
  $brand="thomson" if (ENV['TESTENV']=='EN_TH')
  $brand="first-choice" if (ENV['TESTENV']=='EN_FC')
  departureDate="2015-04-22" if (ENV['TESTENV']=='EN_TH')
  departureDate="2015-04-20" if (ENV['TESTENV']=='EN_FC')

  $g_dev_endpoint="http://e03682051d4856bdd66e2bf5a183986a8898c3bd.dev.tui.appcelerator.com"
  surname=user[:valid][:surname]
  visionShopNumber=user[:valid][:VisionShopNumber].to_i
  visionBookingRef=user[:valid][:VisionBookingRef].to_i

  auth = eng_auth_key(surname, departureDate, visionShopNumber, visionBookingRef)

  $g_current_booking=get_payload_for_type(visionBookingRef, "home", auth)
  $g_engChecklist=get_payload_for_type(visionBookingRef, "checklist", auth)
end

def nor_user_details
  phone=NOR_USER[:valid][:telefon]
  reservationCode=NOR_USER[:valid][:bookingnumber]

  $g_dev_endpoint="http://e03682051d4856bdd66e2bf5a183986a8898c3bd.dev.tui.appcelerator.com"
  auth=nor_auth_key(phone, reservationCode)
  puts "#{auth}"
end

def de_user_details
  $g_dev_endpoint ="http://37.46.24.155:3001"
  username="userdea@gmail.com"
  password="testtest"
  handshake=get_handshake("/login")
  cmd=%Q{curl '#{$g_dev_endpoint}/login' -H 'tui-public-key: abcd' -H 'Origin: http://37.46.24.155:8001' -H 'tui-brand: tui-de' -H 'Accept-Language: en-US,en;q=0.8'  -H 'Content-Type: multipart/form-data; boundary=----WebKitFormBoundaryZ1OvZyyXBlRO2nEB' -H 'Accept: */*' -H 'Referer: http://37.46.24.155:8001/index.html' -H 'Accept-Encoding: gzip,deflate,sdch' -H 'Connection: keep-alive' -H 'tui-handshake: #{handshake}' --data-binary $'------WebKitFormBoundaryZ1OvZyyXBlRO2nEB\r\nContent-Disposition: form-data; name="username"\r\n\r\n#{username}\r\n------WebKitFormBoundaryZ1OvZyyXBlRO2nEB\r\nContent-Disposition: form-data; name="password"\r\n\r\n#{password}\r\n------WebKitFormBoundaryZ1OvZyyXBlRO2nEB--\r\n' --compressed}
  res=JSON.parse(`#{cmd}`)
  puts res
end


