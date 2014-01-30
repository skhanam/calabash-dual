app_path = './app.apk'
system("calabash-android run #{app_path} -p de_mt_android #{ARGV.join(' ')}")
