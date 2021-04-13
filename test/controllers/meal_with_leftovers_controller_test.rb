require 'test_helper'

class MealWithLeftoversControllerTest < ActionDispatch::IntegrationTest
  setup do
    @meal_with_leftover = meal_with_leftovers(:one)
  end

  test "should get index" do
    get meal_with_leftovers_url
    assert_response :success
  end

  test "should get new" do
    get new_meal_with_leftover_url
    assert_response :success
  end

  test "should create meal_with_leftover" do
    assert_difference('MealWithLeftover.count') do
      post meal_with_leftovers_url, params: { meal_with_leftover: { leftovers_id: @meal_with_leftover.leftovers_id, meal_id: @meal_with_leftover.meal_id, meal_recipe_id: @meal_with_leftover.meal_recipe_id, portions: @meal_with_leftover.portions } }
    end

    assert_redirected_to meal_with_leftover_url(MealWithLeftover.last)
  end

  test "should show meal_with_leftover" do
    get meal_with_leftover_url(@meal_with_leftover)
    assert_response :success
  end

  test "should get edit" do
    get edit_meal_with_leftover_url(@meal_with_leftover)
    assert_response :success
  end

  test "should update meal_with_leftover" do
    patch meal_with_leftover_url(@meal_with_leftover), params: { meal_with_leftover: { leftovers_id: @meal_with_leftover.leftovers_id, meal_id: @meal_with_leftover.meal_id, meal_recipe_id: @meal_with_leftover.meal_recipe_id, portions: @meal_with_leftover.portions } }
    assert_redirected_to meal_with_leftover_url(@meal_with_leftover)
  end

  test "should destroy meal_with_leftover" do
    assert_difference('MealWithLeftover.count', -1) do
      delete meal_with_leftover_url(@meal_with_leftover)
    end

    assert_redirected_to meal_with_leftovers_url
  end
end
