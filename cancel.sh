  if [ $1 == "ios" ]; then
    echo "---- Cancelling IOS related tasks  ----"
		pgrep cucumber&&killall -9 cucumber
		pgrep "iPhone Simulator"&&killall -9 "iPhone Simulator"
		pgrep "launchd_sim"&&killall -9 "launchd_sim"
  elif [ $1 == "android" ]; then
    echo "---- Cancelling android related tasks ----"
    killall -9 adb
    killall -9 genymotion
    killall -9 player
  fi

  exit 1