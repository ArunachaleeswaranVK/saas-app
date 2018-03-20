require 'test_helper'

class UserPrrojectsControllerTest < ActionController::TestCase
  setup do
    @user_prroject = user_prrojects(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:user_prrojects)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create user_prroject" do
    assert_difference('UserPrroject.count') do
      post :create, user_prroject: { prroject_id: @user_prroject.prroject_id, user_id: @user_prroject.user_id }
    end

    assert_redirected_to user_prroject_path(assigns(:user_prroject))
  end

  test "should show user_prroject" do
    get :show, id: @user_prroject
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @user_prroject
    assert_response :success
  end

  test "should update user_prroject" do
    patch :update, id: @user_prroject, user_prroject: { prroject_id: @user_prroject.prroject_id, user_id: @user_prroject.user_id }
    assert_redirected_to user_prroject_path(assigns(:user_prroject))
  end

  test "should destroy user_prroject" do
    assert_difference('UserPrroject.count', -1) do
      delete :destroy, id: @user_prroject
    end

    assert_redirected_to user_prrojects_path
  end
end
