require 'test_helper'

class ContactsControllerTest < ActionDispatch::IntegrationTest


#Nickname is used as a blank parameter in order to stop spam being sent via bots - the application will know this because
# nickname should be blank unless a bot fills it in.
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

    test "user visits contact page while logged in" do
      user = User.create!(email: "example@example.com", password: "password")
     manual_sign_in_as(user)
      get contact_path
      assert_response :success
    end
  end


