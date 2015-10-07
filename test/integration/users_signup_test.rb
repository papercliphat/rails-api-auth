require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest

	test "invalid sign up info" do
		
		assert_no_difference 'User.count' do
			post users_path, user: { email: "user@invalid"
									 }
		end
	end
end
