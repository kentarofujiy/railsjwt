require 'test_helper'

class GroceriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @grocery = groceries(:one)
  end

  test "should get index" do
    get groceries_url, as: :json
    assert_response :success
  end

  test "should create grocery" do
    assert_difference('Grocery.count') do
      post groceries_url, params: { grocery: { name: @grocery.name, user_id: @grocery.user_id } }, as: :json
    end

    assert_response 201
  end

  test "should show grocery" do
    get grocery_url(@grocery), as: :json
    assert_response :success
  end

  test "should update grocery" do
    patch grocery_url(@grocery), params: { grocery: { name: @grocery.name, user_id: @grocery.user_id } }, as: :json
    assert_response 200
  end

  test "should destroy grocery" do
    assert_difference('Grocery.count', -1) do
      delete grocery_url(@grocery), as: :json
    end

    assert_response 204
  end
end
