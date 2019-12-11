require 'test_helper'

class BookingTest < ActiveSupport::TestCase

  setup do
    @time = Time.zone.local(2019, 12, 11, 8, 0, 0).strftime('%H:%M')
    @date = Date.new(2019, 12, 11)
    @user = User.create!(email: "example@example.com", password: "password", isAdmin: 1)
  end

#Testing that we can find booking by its ID.
  test'find booking by id'do
    assert_equal 1, bookings(:one).id
  end
  #Test that we can find booking by a user ID.
  test 'find booking by user id'do
    assert_equal 1, bookings(:one).user_id
  end
  #Test that we can find bookings by barber ID.
  test 'find booking by barber id'do
    assert_equal 1, bookings(:one).barber_id
  end
  #Test that we can find bookings by their status.
  test 'find by status'do
    assert_equal 'Booked', bookings(:one).status
  end

#Testing that we can save a booking with valid parameters.
test 'should save with valid parameters' do
  booking = Booking.new(barber_id:1, status:'Booked', user_id:@user.id, date:Date.today, time:@time)
  assert booking.save
end
#Testing that we cannot save a booking without valid date parameters.
  test "should not save without date parameters" do
    booking = Booking.new(time:Time.now, date: '', barber_id:1, status:'booked', user_id:'13')
    assert_not booking.save
  end
#Testing that we cannot save a booking without valid time parameters.
  test "should not save without time parameters" do
    booking = Booking.new(time:'', date:DateTime.now, barber_id:1, status:'booked', user_id:'13')
    assert_not booking.save
  end
#Testing that we cannot save a booking without valid barber_id parameters.
  test "should not save without barber parameters" do
    booking = Booking.new(time:Time.now, date:DateTime.now, barber_id:'', status:'booked', user_id:'13')
    assert_not booking.save
  end
#Testing that we cannot save a booking without valid user_id parameters.
  test "should not save without user parameters" do
    booking = Booking.new(time:Time.now, date:DateTime.now, barber_id:1, status:'booked', user_id:'')
    assert_not booking.save
  end


end
