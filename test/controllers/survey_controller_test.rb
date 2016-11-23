require 'test_helper'

class SurveyControllerTest < ActionDispatch::IntegrationTest
  test "should get landing" do
    get survey_landing_url
    assert_response :success
  end

end
