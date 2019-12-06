require 'test_helper'

class BookingTest < ActiveSupport::TestCase

  @time = Time.zone.local(2019, 12, 11, 8, 0, 0).strftime('%H:%M')
  @date = Date.new(2019, 12, 11)

  test'find booking by id'do
    assert_equal 1, bookings(:one).id
  end
  test 'find booking by user id'do
    assert_equal 1, bookings(:one).user_id
  end
  test 'find booking by barber id'do
    assert_equal 1, bookings(:one).barber_id
  end
  test 'find by status'do
    assert_equal 'Booked', bookings(:one).status
  end


test 'should save with valid parameters' do
  booking = Booking.new(barber_id: 1, status: "Booked", user_id: 15, created_at: "2019-11-24 12:51:41", updated_at: "2019-11-24 13:51:41", date: "2019-11-24", time: "2000-01-01 12:51:00")
  assert booking.save
end

  test "should not save without date parameters" do
    booking = Booking.new(time:Time.now, date: '', barber_id:1, status:'booked', user_id:'13')
    assert_not booking.save
  end

  test "should not save without time parameters" do
    booking = Booking.new(time:'', date:DateTime.now, barber_id:1, status:'booked', user_id:'13')
    assert_not booking.save
  end

  test "should not save without barber parameters" do
    booking = Booking.new(time:Time.now, date:DateTime.now, barber_id:'', status:'booked', user_id:'13')
    assert_not booking.save
  end
  test "should not save without user parameters" do
    booking = Booking.new(time:Time.now, date:DateTime.now, barber_id:1, status:'booked', user_id:'')
    assert_not booking.save
  end


end
