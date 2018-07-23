require 'test_helper'

class Admins::ListItemsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get admins_list_items_create_url
    assert_response :success
  end

  test "should get destroy" do
    get admins_list_items_destroy_url
    assert_response :success
  end

  test "should get new" do
    get admins_list_items_new_url
    assert_response :success
  end

end
