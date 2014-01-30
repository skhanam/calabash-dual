require 'virtus'

module Booking
  include Virtus.module

  attribute :booking_id, Integer
  attribute :destination, String
  attribute :departure_date, String
  attribute :departure_time, Time
  attribute :days_to_go, Integer
  attribute :products, String
end

module UserData
  include Virtus.module
  include Booking

  attribute :name, String
  attribute :age, Integer
  attribute :PastBookings, Array(Booking)
  attribute :CurrentBookings, Array(Booking)
  attribute :user_name, String
  attribute :first_name, String
  attribute :last_name, String
  attribute :email_id, String
  attribute :password, String
end


class User
  include UserData

  def initialize(options={})
    self.first_name= options[:first_name] || "Susi"
    self.last_name= options[:last_name] || "Sonne"
    self.user_name= options[:user_name] || "Reisender"
    self.email_id= options[:email_id] || "Susi.Sonne@tui.de"
    self.password= options[:password] || "meinetui"
    self.age= options[:age]
    self.CurrentBookings=options[:CurrentBookings]
    self.PastBookings=options[:PastBookings]
  end

end


#user = User.new(:name => 'John', :age => 30)
#user.Bookings[0]={:id => 20, :destination => "India", :departure_date => "20 13"}
#user.Bookings[1]={:id => 20, :destination => "India", :departure_date => "20 13"}
