require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
  
  def setup
    @comment=comments(:ones)
  end
  
  def teardown
    @comment=nil
  end
  
  def test_if_comment_gets_created_without_message_id
    @comment.message_id=nil
    assert !@comment.save, "comment is being saved without message id"
  end
  
  def test_if_comment_gets_created_without_user_id
    @comment.message_id=nil
    assert !@comment.save, "comment is being saved without message id"
  end
end
