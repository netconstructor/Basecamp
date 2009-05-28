require 'test_helper'

class TodolistsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:todolists)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create todolist" do
    assert_difference('Todolist.count') do
      post :create, :todolist => { }
    end

    assert_redirected_to todolist_path(assigns(:todolist))
  end

  test "should show todolist" do
    get :show, :id => todolists(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => todolists(:one).to_param
    assert_response :success
  end

  test "should update todolist" do
    put :update, :id => todolists(:one).to_param, :todolist => { }
    assert_redirected_to todolist_path(assigns(:todolist))
  end

  test "should destroy todolist" do
    assert_difference('Todolist.count', -1) do
      delete :destroy, :id => todolists(:one).to_param
    end

    assert_redirected_to todolists_path
  end
end
