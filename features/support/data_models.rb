require 'virtus'

module Booking
  include Virtus.module

  attribute :booking_id, Integer
  attribute :destination, String
  attribute :departure_date, String
end

module UserData
  include Virtus.module
  include Booking


  attribute :name, String
  attribute :age, Integer
  attribute :Bookings, Array(Booking)
  attribute :username, String
  attribute :first_name, String
  attribute :last_name, String
  attribute :email, String
end


#class User
#  include UserData
#end
#
#user = User.new(:name => 'John', :age => 30)
#user.Bookings[0]={:id => 20, :destination => "India", :departure_date => "20 13"}
#user.Bookings[1]={:id => 20, :destination => "India", :departure_date => "20 13"}
