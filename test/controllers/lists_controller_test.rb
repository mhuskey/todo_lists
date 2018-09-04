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
    get list_path(@list)
    assert_response :success
    assert_select "title", "#{@list.title}" + " | #{@base_title}"
  end
  
  test "should get new" do
    get new_list_path
    assert_response :success
    assert_select "title", "New Todo List" + " | #{@base_title}"
  end
  
  test "should get edit" do
    get edit_list_path(@list)
    assert_response :success
    assert_select "title", "Edit List" + " | #{@base_title}"
  end
  
  test "should create list" do
    title = "New Test List"
    assert_difference 'List.count' do
      post lists_path, params: { list: { title: title } }
    end
    assert_redirected_to list_path(List.last)
    assert_not flash.empty?
    new_list = List.last
    assert_equal new_list.title, title
    get list_path(new_list)
    assert_select "title", "#{title}" + " | #{@base_title}"
  end
  
  test "should edit list" do
    title = "Edited Title"
    patch list_path(@list), params: { list: { title: title } }
    assert_redirected_to list_path(@list)
    assert_not flash.empty?
    @list.reload
    assert_equal @list.title, title
    # Check that the title of the page is updated to the new title
    get list_path(@list)
    assert_select "title", "#{title}" + " | #{@base_title}"
  end
  
  test "should destroy list" do
    assert_difference 'List.count', -1 do
      delete list_path(@list)
    end
    assert_redirected_to root_path
    assert_not flash.empty?
  end
  
end
