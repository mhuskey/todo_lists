require 'test_helper'

class ListsControllerTest < ActionDispatch::IntegrationTest
  
  def setup
    @base_title = "Todo Lists App"
    @list       = lists(:one)
  end
  
  test "should get index" do
    get root_path
    assert_response :success
    assert_select "title", "Lists" + " | #{@base_title}"
  end
  
  test "should get show" do
    get list_url(@list)
    assert_response :success
    assert_select "title", "#{@list.title}" + " | #{@base_title}"
  end
  
  test "should get new" do
    get new_list_url
    assert_response :success
    assert_select "title", "New Todo List" + " | #{@base_title}"
  end
  
  test "should get edit" do
    get edit_list_url(@list)
    assert_response :success
    assert_select "title", "Edit List" + " | #{@base_title}"
  end
  
end
