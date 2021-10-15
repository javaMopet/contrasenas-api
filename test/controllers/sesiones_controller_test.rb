require "test_helper"

class SesionesControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get sesiones_create_url
    assert_response :success
  end
end
