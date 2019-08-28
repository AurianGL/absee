require 'test_helper'

class SandboxControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get sandbox_show_url
    assert_response :success
  end

end
