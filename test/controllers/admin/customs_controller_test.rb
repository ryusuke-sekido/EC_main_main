require "test_helper"

class Admin::CustomsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_customs_index_url
    assert_response :success
  end

  test "should get show" do
    get admin_customs_show_url
    assert_response :success
  end

  test "should get edit" do
    get admin_customs_edit_url
    assert_response :success
  end
end
