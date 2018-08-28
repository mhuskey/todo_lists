require 'test_helper'

class ItemTest < ActiveSupport::TestCase
  
  def setup
    @item = items(:one)
  end
  
  test "should be valid" do
    assert @item.valid?
  end
  
  test "task should be present" do
    @item.task = ""
    assert_not @item.valid?
  end
  
end
