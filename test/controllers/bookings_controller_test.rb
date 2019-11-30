require 'test_helper'

class BookingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @booking = bookings(:one)
  end

  test "should not get index if not logged in" do
    get bookings_url
    assert_response :redirect
  end


  test "should not show booking if not logged in" do
    get booking_url(@booking)
    assert_response :redirect
  end
end
