require 'test_helper'

class ActivationsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:activations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create activation" do
    assert_difference('Activation.count') do
      post :create, :activation => { }
    end

    assert_redirected_to activation_path(assigns(:activation))
  end

  test "should show activation" do
    get :show, :id => activations(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => activations(:one).to_param
    assert_response :success
  end

  test "should update activation" do
    put :update, :id => activations(:one).to_param, :activation => { }
    assert_redirected_to activation_path(assigns(:activation))
  end

  test "should destroy activation" do
    assert_difference('Activation.count', -1) do
      delete :destroy, :id => activations(:one).to_param
    end

    assert_redirected_to activations_path
  end
end
