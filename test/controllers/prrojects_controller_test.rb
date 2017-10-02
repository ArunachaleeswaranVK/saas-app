require 'test_helper'

class PrrojectsControllerTest < ActionController::TestCase
  setup do
    @prroject = prrojects(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:prrojects)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create prroject" do
    assert_difference('Prroject.count') do
      post :create, prroject: { details: @prroject.details, expected_completion_date: @prroject.expected_completion_date, tenant_id: @prroject.tenant_id, title: @prroject.title }
    end

    assert_redirected_to prroject_path(assigns(:prroject))
  end

  test "should show prroject" do
    get :show, id: @prroject
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @prroject
    assert_response :success
  end

  test "should update prroject" do
    patch :update, id: @prroject, prroject: { details: @prroject.details, expected_completion_date: @prroject.expected_completion_date, tenant_id: @prroject.tenant_id, title: @prroject.title }
    assert_redirected_to prroject_path(assigns(:prroject))
  end

  test "should destroy prroject" do
    assert_difference('Prroject.count', -1) do
      delete :destroy, id: @prroject
    end

    assert_redirected_to prrojects_path
  end
end
