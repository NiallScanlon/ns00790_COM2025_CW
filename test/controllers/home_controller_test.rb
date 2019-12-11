require 'test_helper'

class HomeControllerTest < ActionDispatch::IntegrationTest

test 'index action works' do
  get home_path
  assert_response :success
  assert_select 'h1', "Palm Valley Barbers"
  assert_select 'h3', "Established 2019."
  assert_select 'a', "Book a haircut"
end
end

