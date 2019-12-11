require 'test_helper'

class BookingTest < ActiveSupport::TestCase

  setup do
    @time = Time.zone.local(2019, 12, 11, 8, 0, 0).strftime('%H:%M')
    @date = Date.new(2019, 12, 11)

    def manual_sign_in_as(user)
      post  params: {
          session: {
              email: user.email,
              password: user.password
          }
      }
    end
  end


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


#test 'should save with valid parameters' do
 # booking = Booking.new(barber_id:1, status:'Booked', user_id:@user.id, date:Date.today, time:@time.strftime('%H:%M'))
  #assert_response :success
#end

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
