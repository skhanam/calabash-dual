	echo "---- Making sure no old calabash ios is running ----"
	pgrep cucumber&&killall -9 cucumber
	pgrep "iPhone Simulator"&&killall -9 "iPhone Simulator"
	pgrep "launchd_sim"&&killall -9 "launchd_sim"
