require 'test_helper'

class LoginSessionsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get login_sessions_new_url
    assert_response :success
  end

end
