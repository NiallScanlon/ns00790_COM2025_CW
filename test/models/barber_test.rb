require 'test_helper'

class BarberTest < ActiveSupport::TestCase


  test 'find by name'do
    assert_equal "Niall Scanlon", barbers(:one).name
  end

  test 'find by id'do
    assert_equal 1, barbers(:one).id
  end

  test 'find by email' do
    assert_equal 'jezwills@outlook.com', barbers(:two).email
  end

end
