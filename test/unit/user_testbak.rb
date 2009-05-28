require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
  
  def setup 
    @user = users(:one)  
  end 
  
  def teardown
    @user = nil
  end
  
  def test_if_user_can_create_project_if_he_is_not_admin
    @proj=@user.projs.new
    assert !@proj.save, "user is not an admin to be able to create project"
  end
  
  def test_if_user_can_create_message
    @message = @user.messages.new(:proj_id=>"1")
    assert @message.save
  end
  
  def test_if_user_can_create_todo
    @todo = @user.todos.new(:proj_id=>"1")
    assert @todo.save
  end
  
end
