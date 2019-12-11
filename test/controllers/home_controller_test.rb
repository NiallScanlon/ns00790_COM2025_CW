require 'test_helper'

class HomeControllerTest < ActionDispatch::IntegrationTest

  setup do
    @user = User.create!(email: "example@example.com", password: "password", isAdmin: 1)

  end

#Test that index action works as expected.
test 'index action works' do
  get home_path
  assert_response :success
  assert_select 'h1', "Palm Valley Barbers"
  assert_select 'h3', "Established 2019."
  assert_select 'a', "Book a haircut"
end

#Admin fail case. The user should get redirected if they do not have the 'isAdmin boolean set to true.'
  test'Cannot get admin page unless admin' do
    get '/admin'
  assert_response :redirect
  end
#Admin pass case. The user should be able to get onto the admin page with the isAdmin boolean set to true.
  test 'Can get admin page as admin'do
    manual_sign_in_as(@user)
    get '/admin'
    assert_response :success
  end
end

