require 'test_helper'

class UsersProjsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:users_projs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create users_projs" do
    assert_difference('UsersProjs.count') do
      post :create, :users_projs => { }
    end

    assert_redirected_to users_projs_path(assigns(:users_projs))
  end

  test "should show users_projs" do
    get :show, :id => users_projs(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => users_projs(:one).to_param
    assert_response :success
  end

  test "should update users_projs" do
    put :update, :id => users_projs(:one).to_param, :users_projs => { }
    assert_redirected_to users_projs_path(assigns(:users_projs))
  end

  test "should destroy users_projs" do
    assert_difference('UsersProjs.count', -1) do
      delete :destroy, :id => users_projs(:one).to_param
    end

    assert_redirected_to users_projs_path
  end
end
