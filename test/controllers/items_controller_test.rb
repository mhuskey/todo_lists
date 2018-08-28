require 'test_helper'

class ItemsControllerTest < ActionDispatch::IntegrationTest
  
  def setup
    @item = items(:one)
    @list = lists(:one)
  end
  
  test "should create item" do
    assert_difference 'Item.count' do
      post list_items_path(@list), params: { item: { task: "New task" } }
    end
    assert_redirected_to list_path(@list)
  end
  
  test "should destroy item" do
    assert_difference 'Item.count', -1 do
      delete list_item_path(@list, @item.id)
    end
    assert_not flash.empty?
  end
  
end
