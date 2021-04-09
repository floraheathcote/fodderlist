require 'test_helper'

class LeftoversControllerTest < ActionDispatch::IntegrationTest
  setup do
    @leftover = leftovers(:one)
  end

  test "should get index" do
    get leftovers_url
    assert_response :success
  end

  test "should get new" do
    get new_leftover_url
    assert_response :success
  end

  test "should create leftover" do
    assert_difference('Leftover.count') do
      post leftovers_url, params: { leftover: { date_made: @leftover.date_made, meal_recipe_id: @leftover.meal_recipe_id, portions: @leftover.portions, recipe_id: @leftover.recipe_id, stock_level: @leftover.stock_level, user_id: @leftover.user_id } }
    end

    assert_redirected_to leftover_url(Leftover.last)
  end

  test "should show leftover" do
    get leftover_url(@leftover)
    assert_response :success
  end

  test "should get edit" do
    get edit_leftover_url(@leftover)
    assert_response :success
  end

  test "should update leftover" do
    patch leftover_url(@leftover), params: { leftover: { date_made: @leftover.date_made, meal_recipe_id: @leftover.meal_recipe_id, portions: @leftover.portions, recipe_id: @leftover.recipe_id, stock_level: @leftover.stock_level, user_id: @leftover.user_id } }
    assert_redirected_to leftover_url(@leftover)
  end

  test "should destroy leftover" do
    assert_difference('Leftover.count', -1) do
      delete leftover_url(@leftover)
    end

    assert_redirected_to leftovers_url
  end
end
