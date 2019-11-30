require 'test_helper'

class ContactsControllerTest < ActionDispatch::IntegrationTest



    test "Testing a valid message, should be sent" do
      assert Contact.new(name: 'Niall Scanlon', email:'niallscanlon98@outlook.com', message:"Hello!", nickname:"").save
    end

  test "Testing an invalid message(name), should not be sent"do
    assert_not Contact.new(name: '', email:'niallscanlon98@outlook.com', message:"Hello!", nickname:"").save
  end

    test "Testing an invalid message(email), should not be sent"do
      assert_not Contact.new(name: 'Niall', email:'', message:"Hello!", nickname:"").save
    end
    test "Testing an invalid message(message), should not be sent"do
      assert_not Contact.new(name: 'Niall', email:'niallscanlon98@outlook.com', message:'', nickname:"").save
    end

end
