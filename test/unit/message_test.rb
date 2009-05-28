require 'test_helper'

class MessageTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
  
  def setup
    @message=messages(:one)
  end
  
  def teardown
    @message=nil
  end
  
  def test_if_message_is_created_without_user_id
    @message.user_id=nil
    assert !@message.save,"cannot be saved without user id"
  end
  
  def test_if_message_is_created_without_project_id
    @message.proj_id=nil
    assert !@message.save,"cannot be saved without project id"
  end
  
end
