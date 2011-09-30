require 'test_helper'

class JobScopeAdditionsControllerTest < ActionController::TestCase
  setup do
    @job_scope_addition = job_scope_additions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:job_scope_additions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create job_scope_addition" do
    assert_difference('JobScopeAddition.count') do
      post :create, :job_scope_addition => @job_scope_addition.attributes
    end

    assert_redirected_to job_scope_addition_path(assigns(:job_scope_addition))
  end

  test "should show job_scope_addition" do
    get :show, :id => @job_scope_addition.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @job_scope_addition.to_param
    assert_response :success
  end

  test "should update job_scope_addition" do
    put :update, :id => @job_scope_addition.to_param, :job_scope_addition => @job_scope_addition.attributes
    assert_redirected_to job_scope_addition_path(assigns(:job_scope_addition))
  end

  test "should destroy job_scope_addition" do
    assert_difference('JobScopeAddition.count', -1) do
      delete :destroy, :id => @job_scope_addition.to_param
    end

    assert_redirected_to job_scope_additions_path
  end
end
