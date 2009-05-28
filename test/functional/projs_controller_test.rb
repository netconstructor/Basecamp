require 'test_helper'

class ProjsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:projs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create proj" do
    assert_difference('Proj.count') do
      post :create, :proj => { }
    end

    assert_redirected_to proj_path(assigns(:proj))
  end

  test "should show proj" do
    get :show, :id => projs(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => projs(:one).to_param
    assert_response :success
  end

  test "should update proj" do
    put :update, :id => projs(:one).to_param, :proj => { }
    assert_redirected_to proj_path(assigns(:proj))
  end

  test "should destroy proj" do
    assert_difference('Proj.count', -1) do
      delete :destroy, :id => projs(:one).to_param
    end

    assert_redirected_to projs_path
  end
end
