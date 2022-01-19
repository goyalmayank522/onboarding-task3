require 'test_helper'

class SessionsControllerTest < ActionDispatch::IntegrationTest
  test "should get welcome" do
    get sessions_welcome_url
    assert_response :success
  end

end
