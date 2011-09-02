require 'test_helper'

class MilestoneValidationsControllerTest < ActionController::TestCase
  setup do
    @milestone_validation = milestone_validations(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:milestone_validations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create milestone_validation" do
    assert_difference('MilestoneValidation.count') do
      post :create, :milestone_validation => @milestone_validation.attributes
    end

    assert_redirected_to milestone_validation_path(assigns(:milestone_validation))
  end

  test "should show milestone_validation" do
    get :show, :id => @milestone_validation.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @milestone_validation.to_param
    assert_response :success
  end

  test "should update milestone_validation" do
    put :update, :id => @milestone_validation.to_param, :milestone_validation => @milestone_validation.attributes
    assert_redirected_to milestone_validation_path(assigns(:milestone_validation))
  end

  test "should destroy milestone_validation" do
    assert_difference('MilestoneValidation.count', -1) do
      delete :destroy, :id => @milestone_validation.to_param
    end

    assert_redirected_to milestone_validations_path
  end
end
