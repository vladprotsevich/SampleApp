require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest
  test "invalid signup information" do
  	get signup_path
  	assert_no_difference 'User.count' do
  								 user_params = { name: "",
  								 email: "user@invalid",
  								 password: "foo",
  								 password_confirmation: "bar",}
  							post users_path, params: { user: user_params }
  			end
  	assert_template 'users/new'
  	assert_select 'div#error_explanation'
  	assert_select 'div.alert-danger'
  end
end
