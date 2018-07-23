require 'test_helper'

class Admins::ListsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get admins_lists_new_url
    assert_response :success
  end

  test "should get create" do
    get admins_lists_create_url
    assert_response :success
  end

  test "should get edit" do
    get admins_lists_edit_url
    assert_response :success
  end

  test "should get update" do
    get admins_lists_update_url
    assert_response :success
  end

  test "should get destroy" do
    get admins_lists_destroy_url
    assert_response :success
  end

end
