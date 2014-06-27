require 'json'
`export LC_CTYPE=en_US.UTF-8`
def check_de_api
  begin
  username="userdea@gmail.com"
  password="testtest"
  cmd=%Q{curl 'http://37.46.24.155:3001/login' -H 'tui-public-key: d7ce7733-c994-4c57-896c-5fe647c254bc' -H 'Origin:http://37.46.24.155:8001' -H 'tui-brand: tui-de' -H 'Accept-Language: en-US,en;q=0.8'  -H 'Content-Type: multipart/form-data; boundary=----WebKitFormBoundaryKYBLZNr2CcAzqU5v' -H 'Accept: */*' -H 'Referer: http://37.46.24.155:8001/index.html' -H 'Accept-Encoding: gzip,deflate,sdch' -H 'Connection: keep-alive' -H 'tui-handshake: c182d5dea3e695394cc04df2816cfe1cd725fd7e' --data-binary $'------WebKitFormBoundaryKYBLZNr2CcAzqU5v\r\nContent-Disposition: form-data; name="username"\r\n\r\n#{username}\r\n------WebKitFormBoundaryKYBLZNr2CcAzqU5v\r\nContent-Disposition: form-data; name="password"\r\n\r\n#{password}\r\n------WebKitFormBoundaryKYBLZNr2CcAzqU5v--\r\n' --compressed}
  res=JSON.parse `#{cmd}`
  auth=res["payload"]["auth"].match(/PHPSESSID=(.*?);/)
  puts "DE MEINE CURL SUCCESSFUL: DETAILS FETCHED FROM SERVER"
  rescue
    fail "German Not Server not responding"
  end
end

def check_nordics_api
  begin
    cmd=%Q(curl 'https://1af03bccc1a56241c802f2bf900ab7e6b54a04a8.test.tui.appcelerator.com/login' -H 'Pragma: no-cache' -H 'tui-public-key: ae9d5e91-d27b-42be-9080-9d15aa4964b2' -H 'Origin: http://37.46.24.155:8001' -H 'tui-brand: nordics' -H 'Accept-Encoding: gzip,deflate,sdch' -H 'Accept-Language: en-US,en;q=0.8' -H 'User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_9_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.114 Safari/537.36' -H 'Content-Type: multipart/form-data; boundary=----WebKitFormBoundary99sTru7qUnAlQCLM' -H 'Accept: */*' -H 'Cache-Control: no-cache' -H 'Referer: http://37.46.24.155:8001/index.html' -H 'Connection: keep-alive' -H 'tui-handshake: 8178ded04f114cdb83009e045bb1ac294bb24466' --data-binary $'------WebKitFormBoundary99sTru7qUnAlQCLM\r\nContent-Disposition: form-data; name="reservationCode"\r\n\r\nAL02298\r\n------WebKitFormBoundary99sTru7qUnAlQCLM\r\nContent-Disposition: form-data; name="phone"\r\n\r\n0702242046\r\n------WebKitFormBoundary99sTru7qUnAlQCLM--\r\n' --compressed)
    res=JSON.parse(`#{cmd}`)
    if (res["status"] == 200)
      puts "NORDICS CURL SUCCESSFUL: DETAILS FETCHED FROM SERVER"
    end
  rescue
    fail "NORDICS Not Server not responding"
  end
end

def check_thomson_api
  surname="martin"

  begin
    cmd=%Q(curl 'http://e03682051d4856bdd66e2bf5a183986a8898c3bd.dev.tui.appcelerator.com/login' -H 'tui-public-key: fbe37b64-9a09-4bbd-ae59-d3433ba74af0' -H 'Origin: http://37.46.24.155:8001' -H 'tui-brand: uk-thomson' -H 'Accept-Language: en-US,en;q=0.8' -H 'Content-Type: multipart/form-data; boundary=----WebKitFormBoundaryBFMoUGekbBDoloDt' -H 'Accept: */*' -H 'Referer: http://37.46.24.155:8001/index.html' -H 'Accept-Encoding: gzip,deflate,sdch' -H 'Connection: keep-alive' -H 'tui-handshake: ffa667411e1e44908aa3b66e18b84a7ea3eec658' --data-binary $'------WebKitFormBoundaryBFMoUGekbBDoloDt\r\nContent-Disposition: form-data; name="surname"\r\n\r\n#{surname}\r\n------WebKitFormBoundaryBFMoUGekbBDoloDt\r\nContent-Disposition: form-data; name="departureDate"\r\n\r\n#{departureDate}\r\n------WebKitFormBoundaryBFMoUGekbBDoloDt\r\nContent-Disposition: form-data; name="visionShopNumber"\r\n\r\n#{visionShopNumber}\r\n------WebKitFormBoundaryBFMoUGekbBDoloDt\r\nContent-Disposition: form-data; name="visionBookingRef"\r\n\r\n#{visionBookingRef}\r\n------WebKitFormBoundaryBFMoUGekbBDoloDt\r\nContent-Disposition: form-data; name="devicetype"\r\n\r\niphone\r\n------WebKitFormBoundaryBFMoUGekbBDoloDt\r\nContent-Disposition: form-data; name="deviceid"\r\n\r\n12346374\r\n------WebKitFormBoundaryBFMoUGekbBDoloDt--\r\n' --compressed)
    res=JSON.parse(`#{cmd}`)
    if (res["payload"]["message"] == "Login Successful")
      puts "THOMSON CURL SUCCESSFUL: DETAILS FETCHED FROM SERVER"
    end
  rescue
    fail "THOMSON Not Server not responding"
  end
end

def check_firstchoice_api
  begin
    cmd=%Q(curl 'https://e03682051d4856bdd66e2bf5a183986a8898c3bd.dev.tui.appcelerator.com/login' -H 'tui-public-key: 913840aa-9455-42a6-a4aa-8c8c4ccf7255' -H 'Origin: http://37.46.24.155:8001' -H 'tui-brand: uk-first-choice' -H 'Accept-Language: en-US,en;q=0.8' -H 'User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_9_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/34.0.1847.131 Safari/537.36' -H 'Content-Type: multipart/form-data; boundary=----WebKitFormBoundaryNDWgNkMgQSeSvoqm' -H 'Accept: */*' -H 'Referer: http://37.46.24.155:8001/index.html' -H 'Accept-Encoding: gzip,deflate,sdch' -H 'Connection: keep-alive' -H 'tui-handshake: 4ff213e9f194922fbb74d8e299f66f7daf7c286e' --data-binary $'------WebKitFormBoundaryNDWgNkMgQSeSvoqm\r\nContent-Disposition: form-data; name="surname"\r\n\r\nMartin\r\n------WebKitFormBoundaryNDWgNkMgQSeSvoqm\r\nContent-Disposition: form-data; name="departureDate"\r\n\r\n2015-04-20\r\n------WebKitFormBoundaryNDWgNkMgQSeSvoqm\r\nContent-Disposition: form-data; name="visionShopNumber"\r\n\r\n9999\r\n------WebKitFormBoundaryNDWgNkMgQSeSvoqm\r\nContent-Disposition: form-data; name="visionBookingRef"\r\n\r\n12346474\r\n------WebKitFormBoundaryNDWgNkMgQSeSvoqm\r\nContent-Disposition: form-data; name="devicetype"\r\n\r\niphone\r\n------WebKitFormBoundaryNDWgNkMgQSeSvoqm\r\nContent-Disposition: form-data; name="deviceid"\r\n\r\n12346374\r\n------WebKitFormBoundaryNDWgNkMgQSeSvoqm--\r\n' --compressed)
    res=JSON.parse(`#{cmd}`)
    if (res["payload"]["message"] == "Login Successful")
      puts "First choice CURL SUCCESSFUL: DETAILS FETCHED FROM SERVER"
    end
  rescue
    fail "First choice Not Server not responding"
  end
end


check_de_api
check_firstchoice_api
check_thomson_api
check_nordics_api