require 'test_helper'

class StacksControllerTest < ActionController::TestCase
  setup do
    @stack = stacks(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:stacks)
  end

  test "should create stack" do
    assert_difference('Stack.count') do
      post :create, stack: { name: @stack.name }
    end

    assert_response 201
  end

  test "should show stack" do
    get :show, id: @stack
    assert_response :success
  end

  test "should update stack" do
    put :update, id: @stack, stack: { name: @stack.name }
    assert_response 204
  end

  test "should destroy stack" do
    assert_difference('Stack.count', -1) do
      delete :destroy, id: @stack
    end

    assert_response 204
  end
end
