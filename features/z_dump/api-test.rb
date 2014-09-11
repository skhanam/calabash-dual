require 'json'

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
        :bookingnumber => "1Y30064",
        :emailid => "niclas.westling@fritidsresor.se",
        :telefon => "0722177937",
        :departuredate => "20-07-2014",

    },
    :invalid => {
        :bookingnumber => "11Y30060",
        :emailid => "ns.w@or.se",
        :telefon => "0722377937",
        :departuredate => "26-10-2014",
    }
}

def check_de_api
  username=DE_USER[:valid][:username]
  password=DE_USER[:valid][:password]

  cmd=%Q{curl 'http://37.46.24.155:3001/login' -H 'tui-public-key: d7ce7733-c994-4c57-896c-5fe647c254bc' -H 'Origin:http://37.46.24.155:8001' -H 'tui-brand: tui-de' -H 'Accept-Language: en-US,en;q=0.8'  -H 'Content-Type: multipart/form-data; boundary=----WebKitFormBoundaryKYBLZNr2CcAzqU5v' -H 'Accept: */*' -H 'Referer: http://37.46.24.155:8001/index.html' -H 'Accept-Encoding: gzip,deflate,sdch' -H 'Connection: keep-alive' -H 'tui-handshake: c182d5dea3e695394cc04df2816cfe1cd725fd7e' --data-binary $'------WebKitFormBoundaryKYBLZNr2CcAzqU5v\r\nContent-Disposition: form-data; name="username"\r\n\r\n#{username}\r\n------WebKitFormBoundaryKYBLZNr2CcAzqU5v\r\nContent-Disposition: form-data; name="password"\r\n\r\n#{password}\r\n------WebKitFormBoundaryKYBLZNr2CcAzqU5v--\r\n' --compressed}
  res=JSON.parse `#{cmd}`
  auth=res["payload"]["auth"].match(/PHPSESSID=(.*?);/)
  puts "DE MEINE CURL SUCCESSFUL: DETAILS FETCHED FROM SERVER"
end

def check_en_th_api
  surname=THOMSON_USER[:valid][:surname]
  departureDate=THOMSON_USER[:valid][:departuredate]
  visionBookingRef=THOMSON_USER[:valid][:VisionBookingRef]
  visionShopNumber=THOMSON_USER[:valid][:VisionShopNumber]

  begin
    cmd=%Q(curl 'http://e03682051d4856bdd66e2bf5a183986a8898c3bd.dev.tui.appcelerator.com/login' -H 'tui-public-key: fbe37b64-9a09-4bbd-ae59-d3433ba74af0' -H 'Origin: http://37.46.24.155:8001' -H 'tui-brand: uk-thomson' -H 'Accept-Language: en-US,en;q=0.8' -H 'Content-Type: multipart/form-data; boundary=----WebKitFormBoundaryBFMoUGekbBDoloDt' -H 'Accept: */*' -H 'Referer: http://37.46.24.155:8001/index.html' -H 'Accept-Encoding: gzip,deflate,sdch' -H 'Connection: keep-alive' -H 'tui-handshake: ffa667411e1e44908aa3b66e18b84a7ea3eec658' --data-binary $'------WebKitFormBoundaryBFMoUGekbBDoloDt\r\nContent-Disposition: form-data; name="surname"\r\n\r\n#{surname}\r\n------WebKitFormBoundaryBFMoUGekbBDoloDt\r\nContent-Disposition: form-data; name="departureDate"\r\n\r\n#{departureDate}\r\n------WebKitFormBoundaryBFMoUGekbBDoloDt\r\nContent-Disposition: form-data; name="visionShopNumber"\r\n\r\n#{visionShopNumber}\r\n------WebKitFormBoundaryBFMoUGekbBDoloDt\r\nContent-Disposition: form-data; name="visionBookingRef"\r\n\r\n#{visionBookingRef}\r\n------WebKitFormBoundaryBFMoUGekbBDoloDt\r\nContent-Disposition: form-data; name="devicetype"\r\n\r\niphone\r\n------WebKitFormBoundaryBFMoUGekbBDoloDt\r\nContent-Disposition: form-data; name="deviceid"\r\n\r\n12346374\r\n------WebKitFormBoundaryBFMoUGekbBDoloDt--\r\n' --compressed)
    res=JSON.parse(`#{cmd}`)
    if (res["payload"]["message"] == "Login Successful")
      puts "THOMSON CURL SUCCESSFUL: DETAILS FETCHED FROM SERVER"
    end
  rescue
    fail "Server not responding"
  end
end

def check_nordics_api
  bookingnumber=NOR_USER[:valid][:bookingnumber]
  emailid=NOR_USER[:valid][:emailid]

  begin
    cmd=%Q(curl 'http://e03682051d4856bdd66e2bf5a183986a8898c3bd.dev.tui.appcelerator.com/login' -H 'Pragma: no-cache' -H 'tui-public-key: c324b71c-8c1b-49e2-8c5e-97f156d20141' -H 'Origin: http://37.46.24.155:8001' -H 'Cache-Control: no-cache' -H 'User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_9_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/34.0.1847.131 Safari/537.36' -H 'Content-Type: multipart/form-data; boundary=----WebKitFormBoundaryoHZeRePcVCpN8WMs' -H 'Referer: http://37.46.24.155:8001/index.html' -H 'tui-brand: nordics' -H 'tui-handshake: f77e4b14672e6fb9773902d266f32f848eb7cb78' --data-binary $'------WebKitFormBoundaryoHZeRePcVCpN8WMs\r\nContent-Disposition: form-data; name="reservationCode"\r\n\r\n#{bookingnumber}\r\n------WebKitFormBoundaryoHZeRePcVCpN8WMs\r\nContent-Disposition: form-data; name="email"\r\n\r\n#{emailid}\r\n------WebKitFormBoundaryoHZeRePcVCpN8WMs--\r\n' --compressed)
    res=JSON.parse(`#{cmd}`)
    if (res["status"] == 200)
      puts "NORDICS CURL SUCCESSFUL: DETAILS FETCHED FROM SERVER"
    end
  rescue
    fail "Server not responding"
  end
end

def check_en_fc_api
  surname=FIRSTCHOICE_USER[:valid][:surname]
  departureDate=FIRSTCHOICE_USER[:valid][:departuredate]
  visionBookingRef=FIRSTCHOICE_USER[:valid][:VisionBookingRef]
  visionShopNumber=FIRSTCHOICE_USER[:valid][:VisionShopNumber]

  begin
    cmd=%Q(curl 'https://e03682051d4856bdd66e2bf5a183986a8898c3bd.dev.tui.appcelerator.com/login' -H 'tui-public-key: 913840aa-9455-42a6-a4aa-8c8c4ccf7255' -H 'Origin: http://37.46.24.155:8001' -H 'tui-brand: uk-first-choice' -H 'Accept-Language: en-US,en;q=0.8' -H 'User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_9_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/34.0.1847.131 Safari/537.36' -H 'Content-Type: multipart/form-data; boundary=----WebKitFormBoundaryNDWgNkMgQSeSvoqm' -H 'Accept: */*' -H 'Referer: http://37.46.24.155:8001/index.html' -H 'Accept-Encoding: gzip,deflate,sdch' -H 'Connection: keep-alive' -H 'tui-handshake: 4ff213e9f194922fbb74d8e299f66f7daf7c286e' --data-binary $'------WebKitFormBoundaryNDWgNkMgQSeSvoqm\r\nContent-Disposition: form-data; name="surname"\r\n\r\nMartin\r\n------WebKitFormBoundaryNDWgNkMgQSeSvoqm\r\nContent-Disposition: form-data; name="departureDate"\r\n\r\n2015-04-20\r\n------WebKitFormBoundaryNDWgNkMgQSeSvoqm\r\nContent-Disposition: form-data; name="visionShopNumber"\r\n\r\n9999\r\n------WebKitFormBoundaryNDWgNkMgQSeSvoqm\r\nContent-Disposition: form-data; name="visionBookingRef"\r\n\r\n12346474\r\n------WebKitFormBoundaryNDWgNkMgQSeSvoqm\r\nContent-Disposition: form-data; name="devicetype"\r\n\r\niphone\r\n------WebKitFormBoundaryNDWgNkMgQSeSvoqm\r\nContent-Disposition: form-data; name="deviceid"\r\n\r\n12346374\r\n------WebKitFormBoundaryNDWgNkMgQSeSvoqm--\r\n' --compressed)
    res=JSON.parse(`#{cmd}`)
    if (res["payload"]["message"] == "Login Successful")
      puts "First choice CURL SUCCESSFUL: DETAILS FETCHED FROM SERVER"
    end
  rescue
    fail "Server not responding"
  end

end

check_de_api
check_en_th_api
check_nordics_api
check_en_fc_api
