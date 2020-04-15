require 'test_helper'

class ProfileControllerTest < ActionDispatch::IntegrationTest
  test "should get login" do
    get profile_login_url
    assert_response :success
  end

end
