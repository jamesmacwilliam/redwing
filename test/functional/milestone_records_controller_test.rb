require 'test_helper'

class MilestoneRecordsControllerTest < ActionController::TestCase
  setup do
    @milestone_record = milestone_records(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:milestone_records)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create milestone_record" do
    assert_difference('MilestoneRecord.count') do
      post :create, :milestone_record => @milestone_record.attributes
    end

    assert_redirected_to milestone_record_path(assigns(:milestone_record))
  end

  test "should show milestone_record" do
    get :show, :id => @milestone_record.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @milestone_record.to_param
    assert_response :success
  end

  test "should update milestone_record" do
    put :update, :id => @milestone_record.to_param, :milestone_record => @milestone_record.attributes
    assert_redirected_to milestone_record_path(assigns(:milestone_record))
  end

  test "should destroy milestone_record" do
    assert_difference('MilestoneRecord.count', -1) do
      delete :destroy, :id => @milestone_record.to_param
    end

    assert_redirected_to milestone_records_path
  end
end
