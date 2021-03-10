require 'test_helper'

class RecipeIngredientGroupsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @recipe_ingredient_group = recipe_ingredient_groups(:one)
  end

  test "should get index" do
    get recipe_ingredient_groups_url
    assert_response :success
  end

  test "should get new" do
    get new_recipe_ingredient_group_url
    assert_response :success
  end

  test "should create recipe_ingredient_group" do
    assert_difference('RecipeIngredientGroup.count') do
      post recipe_ingredient_groups_url, params: { recipe_ingredient_group: { name: @recipe_ingredient_group.name, recipe_id: @recipe_ingredient_group.recipe_id } }
    end

    assert_redirected_to recipe_ingredient_group_url(RecipeIngredientGroup.last)
  end

  test "should show recipe_ingredient_group" do
    get recipe_ingredient_group_url(@recipe_ingredient_group)
    assert_response :success
  end

  test "should get edit" do
    get edit_recipe_ingredient_group_url(@recipe_ingredient_group)
    assert_response :success
  end

  test "should update recipe_ingredient_group" do
    patch recipe_ingredient_group_url(@recipe_ingredient_group), params: { recipe_ingredient_group: { name: @recipe_ingredient_group.name, recipe_id: @recipe_ingredient_group.recipe_id } }
    assert_redirected_to recipe_ingredient_group_url(@recipe_ingredient_group)
  end

  test "should destroy recipe_ingredient_group" do
    assert_difference('RecipeIngredientGroup.count', -1) do
      delete recipe_ingredient_group_url(@recipe_ingredient_group)
    end

    assert_redirected_to recipe_ingredient_groups_url
  end
end
