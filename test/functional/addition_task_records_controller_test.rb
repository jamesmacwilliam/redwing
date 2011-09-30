require 'test_helper'

class AdditionTaskRecordsControllerTest < ActionController::TestCase
  setup do
    @addition_task_record = addition_task_records(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:addition_task_records)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create addition_task_record" do
    assert_difference('AdditionTaskRecord.count') do
      post :create, :addition_task_record => @addition_task_record.attributes
    end

    assert_redirected_to addition_task_record_path(assigns(:addition_task_record))
  end

  test "should show addition_task_record" do
    get :show, :id => @addition_task_record.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @addition_task_record.to_param
    assert_response :success
  end

  test "should update addition_task_record" do
    put :update, :id => @addition_task_record.to_param, :addition_task_record => @addition_task_record.attributes
    assert_redirected_to addition_task_record_path(assigns(:addition_task_record))
  end

  test "should destroy addition_task_record" do
    assert_difference('AdditionTaskRecord.count', -1) do
      delete :destroy, :id => @addition_task_record.to_param
    end

    assert_redirected_to addition_task_records_path
  end
end
