require 'test_helper'

class MilestoneTasksControllerTest < ActionController::TestCase
  setup do
    @milestone_task = milestone_tasks(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:milestone_tasks)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create milestone_task" do
    assert_difference('MilestoneTask.count') do
      post :create, :milestone_task => @milestone_task.attributes
    end

    assert_redirected_to milestone_task_path(assigns(:milestone_task))
  end

  test "should show milestone_task" do
    get :show, :id => @milestone_task.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @milestone_task.to_param
    assert_response :success
  end

  test "should update milestone_task" do
    put :update, :id => @milestone_task.to_param, :milestone_task => @milestone_task.attributes
    assert_redirected_to milestone_task_path(assigns(:milestone_task))
  end

  test "should destroy milestone_task" do
    assert_difference('MilestoneTask.count', -1) do
      delete :destroy, :id => @milestone_task.to_param
    end

    assert_redirected_to milestone_tasks_path
  end
end
