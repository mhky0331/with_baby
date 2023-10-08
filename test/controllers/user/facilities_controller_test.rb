require "test_helper"

class User::FacilitiesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get user_facilities_index_url
    assert_response :success
  end

  test "should get show" do
    get user_facilities_show_url
    assert_response :success
  end

  test "should get new" do
    get user_facilities_new_url
    assert_response :success
  end

  test "should get edit" do
    get user_facilities_edit_url
    assert_response :success
  end
end
