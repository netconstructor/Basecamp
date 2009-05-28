require 'test_helper'

class ProjTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
  
  def setup
    @proj = projs(:one)
  end
  
  def teardown
    @proj=nil
  end
  
  def test_if_proj_gets_saved_with_out_user_id
    @proj.user_id=nil
    assert !@proj.save
  end
end
