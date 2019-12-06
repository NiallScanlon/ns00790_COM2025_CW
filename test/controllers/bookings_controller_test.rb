require 'test_helper'

class BookingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @booking = bookings(:one)
    @user = User.create!(email: "example@example.com", password: "password")
  @time = Time.zone.local(2019, 12, 11, 8, 0)

  end

  #Testing index method pass case
  test "user should be able to visit bookings while logged in" do
   manual_sign_in_as(@user)
    get bookings_url
    assert_response :success
  end
#Testing index method fail case
  test 'user should not be able to visit bookings whilst not logged in' do
    get bookings_url
    assert_response :redirect
  end
#Testing show method pass case
  test 'should get show action' do
  manual_sign_in_as(@user)
    get bookings_path(@booking)
    assert_response :success
  end
  #Testing show method fail case
test 'user should not be able to visit individual bookings whilst logged in' do
  get bookings_path(@booking)
  assert_response :redirect
end
  #Testing create and new pass case - the new booking should be created and the user should be redirected to the new booking.
  test 'user should be able to create a new booking'do
    manual_sign_in_as(@user)
    get bookings_new_path
    post bookings_url(as: @user), params: { booking: { barber_id:1, status:'Booked', user_id:@user.id, date:Date.today, time:@time.strftime('%H:%M') } }
 assert_response :redirect
  end
#Testing create and new fail case - the user will be redirected to sign in.
  test'user should not be able to create booking without logging in'do
    get bookings_new_path
    post bookings_url(as: @user), params: { booking: { barber_id:1, status:'Booked', user_id:@user.id, date:Date.today, time:@time.strftime('%H:%M') } }
    assert_response :redirect
  end

  #Testing edit pass case with fixtures
 # test 'user should be able to edit their own booking whilst logged in' do
  #  manual_sign_in_as(@user)
   # get bookings_path(@booking)
    #put :update => {status: 'Cancelled'}
  #end
#Testing delete pass case - the user should be able to delete a record if logged in, and that record corresponds to the user.
  # We can test this by checking the model count for records.
  test'Delete action should work if logged in'do
    manual_sign_in_as(@user)
    assert_difference 'Booking.count', -1 do
      delete booking_path(@booking)
    end
  end
  #Testing delete fail case - the user should not be able to delete a record if they are not logged in.
  # We can test this by checking the model count for records, in this case it wont change as no records will be deleted.
  test'Delete action should not work if not logged in'do
    assert_difference 'Booking.count', 0 do
      delete booking_path(@booking)
    end
  end

end


