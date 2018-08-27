require 'test_helper'

class ListTest < ActiveSupport::TestCase
  
  def setup
    @list = lists(:one)
  end
  
  test "should be valid" do
    assert @list.valid?
  end
  
  test "title should be present" do
    @list.title = ""
    assert_not @list.valid?
  end
  
end
