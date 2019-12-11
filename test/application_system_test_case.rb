require "test_helper"

class ApplicationSystemTestCase < ActionDispatch::SystemTestCase
  driven_by :selenium, using: :chrome, screen_size: [1400, 1400]

  def manual_sign_in_as(user)
    post session_url, params: {
        session: {
            email: user.email,
            password: user.password
        }
    }
  end
end
