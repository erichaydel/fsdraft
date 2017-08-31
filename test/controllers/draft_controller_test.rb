require 'test_helper'

class DraftControllerTest < ActionController::TestCase
  test "should get home" do
    get :home
    assert_response :success
  end

  test "should get settings" do
    get :settings
    assert_response :success
  end

end
