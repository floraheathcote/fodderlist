require 'test_helper'

class MealRecipesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @meal_recipe = meal_recipes(:one)
  end

  test "should get index" do
    get meal_recipes_url
    assert_response :success
  end

  test "should get new" do
    get new_meal_recipe_url
    assert_response :success
  end

  test "should create meal_recipe" do
    assert_difference('MealRecipe.count') do
      post meal_recipes_url, params: { meal_recipe: { meal_id: @meal_recipe.meal_id, recipe_id: @meal_recipe.recipe_id } }
    end

    assert_redirected_to meal_recipe_url(MealRecipe.last)
  end

  test "should show meal_recipe" do
    get meal_recipe_url(@meal_recipe)
    assert_response :success
  end

  test "should get edit" do
    get edit_meal_recipe_url(@meal_recipe)
    assert_response :success
  end

  test "should update meal_recipe" do
    patch meal_recipe_url(@meal_recipe), params: { meal_recipe: { meal_id: @meal_recipe.meal_id, recipe_id: @meal_recipe.recipe_id } }
    assert_redirected_to meal_recipe_url(@meal_recipe)
  end

  test "should destroy meal_recipe" do
    assert_difference('MealRecipe.count', -1) do
      delete meal_recipe_url(@meal_recipe)
    end

    assert_redirected_to meal_recipes_url
  end
end
