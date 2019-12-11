require 'test_helper'

class WelcomeControllerTest < ActionDispatch::IntegrationTest

  test "user visits contact page while logged in" do
    get welcome_index_path
    assert_response :success
    assert_select "h1", "TO PALM VALLEY BARBERS"
  end
end


