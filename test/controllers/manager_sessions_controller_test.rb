require 'test_helper'

class ManagerSessionsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get manager_sessions_new_url
    assert_response :success
  end

end
