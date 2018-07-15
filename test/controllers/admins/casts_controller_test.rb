require 'test_helper'

class Admins::CastsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get admins_casts_new_url
    assert_response :success
  end

  test "should get create" do
    get admins_casts_create_url
    assert_response :success
  end

  test "should get destroy" do
    get admins_casts_destroy_url
    assert_response :success
  end

end
