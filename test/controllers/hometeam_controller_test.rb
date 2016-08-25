require 'test_helper'

class HometeamControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get hometeam_index_url
    assert_response :success
  end

end
