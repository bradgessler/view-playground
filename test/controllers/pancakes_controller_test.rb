require "test_helper"

class PancakesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @pancake = pancakes(:one)
  end

  test "should get index" do
    get pancakes_url
    assert_response :success
  end

  test "should get new" do
    get new_pancake_url
    assert_response :success
  end

  test "should create pancake" do
    assert_difference("Pancake.count") do
      post pancakes_url, params: { pancake: { description: @pancake.description, name: @pancake.name } }
    end

    assert_redirected_to pancake_url(Pancake.last)
  end

  test "should show pancake" do
    get pancake_url(@pancake)
    assert_response :success
  end

  test "should get edit" do
    get edit_pancake_url(@pancake)
    assert_response :success
  end

  test "should update pancake" do
    patch pancake_url(@pancake), params: { pancake: { description: @pancake.description, name: @pancake.name } }
    assert_redirected_to pancake_url(@pancake)
  end

  test "should destroy pancake" do
    assert_difference("Pancake.count", -1) do
      delete pancake_url(@pancake)
    end

    assert_redirected_to pancakes_url
  end
end
