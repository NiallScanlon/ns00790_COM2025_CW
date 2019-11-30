require 'test_helper'

class BarbersControllerTest < ActionDispatch::IntegrationTest

  setup do
    @barber = barbers(:one)
  end

  test "should get index" do
    get barbers_url
    assert_response :success
  end


  test "should show barber" do
    get barber_url(@barber)
    assert_response :success
  end
  end

