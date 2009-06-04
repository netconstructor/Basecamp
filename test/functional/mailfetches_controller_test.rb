require 'test_helper'

class MailfetchesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:mailfetches)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create mailfetch" do
    assert_difference('Mailfetch.count') do
      post :create, :mailfetch => { }
    end

    assert_redirected_to mailfetch_path(assigns(:mailfetch))
  end

  test "should show mailfetch" do
    get :show, :id => mailfetches(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => mailfetches(:one).to_param
    assert_response :success
  end

  test "should update mailfetch" do
    put :update, :id => mailfetches(:one).to_param, :mailfetch => { }
    assert_redirected_to mailfetch_path(assigns(:mailfetch))
  end

  test "should destroy mailfetch" do
    assert_difference('Mailfetch.count', -1) do
      delete :destroy, :id => mailfetches(:one).to_param
    end

    assert_redirected_to mailfetches_path
  end
end
