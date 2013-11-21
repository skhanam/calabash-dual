app_path = '~/projects/meine.tui/build/android/bin/app.apk'

system("calabash-android run #{app_path} -p android #{ARGV.join(' ')}")
