require 'test_helper'

class TodoTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
  
  def setup
    @todo=todos(:one)
  end
  def teardown
    @todo=nil
  end
  
  def test_if_todo_get_saved_without_user_id
    @todo.user_id=nil
     assert !@todo.save, "todo got saved without userid"
  end
  
  def test_if_todo_get_saved_without_project_id
    @todo.proj_id=nil
    assert !@todo.save, "todo got saved without project id"
  end
end
