require 'test_helper'

class BarbersControllerTest < ActionDispatch::IntegrationTest

  setup do
    @barber = barbers(:one)
    @user = User.create!(email: "example@example.com", password: "password")
  end
#Tets the index action by asserting a success on the requested url.
  test "should get index" do
    get barbers_url
    assert_response :success
  end

  #Uses the barbers fixture, :one, to test the show action.
  test "should get show action" do
    manual_sign_in_as(@user)
    get barber_path(@barber)
  assert_response :success
  end
  end

