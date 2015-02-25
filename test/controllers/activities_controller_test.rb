require 'test_helper'

class ActivitiesControllerTest < ActionController::TestCase
  test "should get week" do
    get :week
    assert_response :success
  end

  test "should get day" do
    get :day
    assert_response :success
  end

  test "should get challenge" do
    get :challenge
    assert_response :success
  end

end
