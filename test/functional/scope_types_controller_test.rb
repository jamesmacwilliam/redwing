require 'test_helper'

class ScopeTypesControllerTest < ActionController::TestCase
  setup do
    @scope_type = scope_types(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:scope_types)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create scope_type" do
    assert_difference('ScopeType.count') do
      post :create, :scope_type => @scope_type.attributes
    end

    assert_redirected_to scope_type_path(assigns(:scope_type))
  end

  test "should show scope_type" do
    get :show, :id => @scope_type.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @scope_type.to_param
    assert_response :success
  end

  test "should update scope_type" do
    put :update, :id => @scope_type.to_param, :scope_type => @scope_type.attributes
    assert_redirected_to scope_type_path(assigns(:scope_type))
  end

  test "should destroy scope_type" do
    assert_difference('ScopeType.count', -1) do
      delete :destroy, :id => @scope_type.to_param
    end

    assert_redirected_to scope_types_path
  end
end
