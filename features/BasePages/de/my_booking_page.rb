=begin
  * Description : page to verify my account details , change password page
  * Author: Tejasvi K M
  * Date: 21 jan 2013
=end

class MyBookingsPage < MyBookingsBasePage
 include MyBookingsModule
 include Module.const_get "MyBookingsModule::"+$g_platform
end
