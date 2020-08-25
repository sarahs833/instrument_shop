require 'test_helper'

class StaticsControllerTest < ActionDispatch::IntegrationTest
  test "should get page" do
    get statics_page_url
    assert_response :success
  end

end
