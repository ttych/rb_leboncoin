require 'test_helper'

class SessionTest < Minitest::Test
  def test_session_instance_creation
    login = Faker::Internet.user_name
    password = Faker::Internet.password

    session = Leboncoin::Session.new(login, password)
    assert session
  end
end
