require 'test_helper'

class MyTestObjectsControllerTest < ActionController::TestCase
  setup do
    @my_test_object = my_test_objects(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:my_test_objects)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create my_test_object" do
    assert_difference('MyTestObject.count') do
      post :create, :my_test_object => @my_test_object.attributes
    end

    assert_redirected_to my_test_object_path(assigns(:my_test_object))
  end

  test "should show my_test_object" do
    get :show, :id => @my_test_object.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @my_test_object.to_param
    assert_response :success
  end

  test "should update my_test_object" do
    put :update, :id => @my_test_object.to_param, :my_test_object => @my_test_object.attributes
    assert_redirected_to my_test_object_path(assigns(:my_test_object))
  end

  test "should destroy my_test_object" do
    assert_difference('MyTestObject.count', -1) do
      delete :destroy, :id => @my_test_object.to_param
    end

    assert_redirected_to my_test_objects_path
  end
end
