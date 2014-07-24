#require_relative '../../../BasePages/Default/login_base_page'
#
#class LoginPage < LoginBasePage
#  #
#  #def login_thomson(surname, departureDate, visionShopNumber, visionBookingRef)
#  #  sleep 3
#  #  enter_details(surname, 1)
#  #  touch("toolbarTextButton index:1")
#  #
#  #  enter_date_ios(departureDate)
#  #  touch("toolbarTextButton index:1")
#  #
#  #  sleep 2
#  #  keyboard_enter_text(visionShopNumber)
#  #  touch("toolbarTextButton index:1")
#  #
#  #  sleep 2
#  #  keyboard_enter_text(visionBookingRef)
#  #  touch("toolbarTextButton index:1")
#  #
#  #  sleep(2)
#  #end
#  #
#  #
#  #def enter_details(text, index)
#  #  touch("view {description LIKE '*UITextFieldLabel*'} index:#{index.to_i-1}")
#  #  sleep 2
#  #  keyboard_enter_text(text.to_s)
#  #  sleep 1
#  #end
#
#
#
#  #def convert_date_to_str(date_int)
#  #  d=DateTime.new(1899, 12, 30) + date_int.to_i
#  #  return d.strftime("%d-%m-%Y")
#  #end
#end