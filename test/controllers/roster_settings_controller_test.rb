require 'test_helper'

class RosterSettingsControllerTest < ActionController::TestCase
  setup do
    @roster_setting = roster_settings(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:roster_settings)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create roster_setting" do
    assert_difference('RosterSetting.count') do
      post :create, roster_setting: { definition: @roster_setting.definition }
    end

    assert_redirected_to roster_setting_path(assigns(:roster_setting))
  end

  test "should show roster_setting" do
    get :show, id: @roster_setting
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @roster_setting
    assert_response :success
  end

  test "should update roster_setting" do
    patch :update, id: @roster_setting, roster_setting: { definition: @roster_setting.definition }
    assert_redirected_to roster_setting_path(assigns(:roster_setting))
  end

  test "should destroy roster_setting" do
    assert_difference('RosterSetting.count', -1) do
      delete :destroy, id: @roster_setting
    end

    assert_redirected_to roster_settings_path
  end
end
