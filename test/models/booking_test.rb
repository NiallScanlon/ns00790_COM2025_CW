require 'test_helper'

class BookingTest < ActiveSupport::TestCase


  test "Booking validation should trigger" do
    assert_not Contact.new(barber_id: '12', status:'booked', user_id:'13', date:'2019-11-29', time:'2019, 11, 29,04,25').save
  end

  test "Should save fine" do
    assert Booking.new("barber_id"=>"1", "date(1i)"=>"2019", "date(2i)"=>"11", "date(3i)"=>"29", "time(1i)"=>"2019", "time(2i)"=>"11", "time(3i)"=>"29", "time(4i)"=>"13", "time(5i)"=>"22", "status"=>"Booked", "user_id"=>"13").save
  end

end
