require 'test_helper'

class MealIngredientsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @meal_ingredient = meal_ingredients(:one)
  end

  test "should get index" do
    get meal_ingredients_url
    assert_response :success
  end

  test "should get new" do
    get new_meal_ingredient_url
    assert_response :success
  end

  test "should create meal_ingredient" do
    assert_difference('MealIngredient.count') do
      post meal_ingredients_url, params: { meal_ingredient: { ingredient_id: @meal_ingredient.ingredient_id, meal_id: @meal_ingredient.meal_id, quantity: @meal_ingredient.quantity, unit: @meal_ingredient.unit } }
    end

    assert_redirected_to meal_ingredient_url(MealIngredient.last)
  end

  test "should show meal_ingredient" do
    get meal_ingredient_url(@meal_ingredient)
    assert_response :success
  end

  test "should get edit" do
    get edit_meal_ingredient_url(@meal_ingredient)
    assert_response :success
  end

  test "should update meal_ingredient" do
    patch meal_ingredient_url(@meal_ingredient), params: { meal_ingredient: { ingredient_id: @meal_ingredient.ingredient_id, meal_id: @meal_ingredient.meal_id, quantity: @meal_ingredient.quantity, unit: @meal_ingredient.unit } }
    assert_redirected_to meal_ingredient_url(@meal_ingredient)
  end

  test "should destroy meal_ingredient" do
    assert_difference('MealIngredient.count', -1) do
      delete meal_ingredient_url(@meal_ingredient)
    end

    assert_redirected_to meal_ingredients_url
  end
end
