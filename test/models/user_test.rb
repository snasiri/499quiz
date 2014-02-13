require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "user attribute must not be empty" do
  	user = User.new
  	assert user.invalid?
  	assert user.errors[:name].any?
  end
end
