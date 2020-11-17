require 'test_helper'

class GurunabiControllerTest < ActionDispatch::IntegrationTest
  test "should get search" do
    get gurunabi_search_url
    assert_response :success
  end

end
