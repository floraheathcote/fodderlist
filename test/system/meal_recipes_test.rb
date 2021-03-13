require "application_system_test_case"

class MealRecipesTest < ApplicationSystemTestCase
  setup do
    @meal_recipe = meal_recipes(:one)
  end

  test "visiting the index" do
    visit meal_recipes_url
    assert_selector "h1", text: "Meal Recipes"
  end

  test "creating a Meal recipe" do
    visit meal_recipes_url
    click_on "New Meal Recipe"

    fill_in "Meal", with: @meal_recipe.meal_id
    fill_in "Recipe", with: @meal_recipe.recipe_id
    click_on "Create Meal recipe"

    assert_text "Meal recipe was successfully created"
    click_on "Back"
  end

  test "updating a Meal recipe" do
    visit meal_recipes_url
    click_on "Edit", match: :first

    fill_in "Meal", with: @meal_recipe.meal_id
    fill_in "Recipe", with: @meal_recipe.recipe_id
    click_on "Update Meal recipe"

    assert_text "Meal recipe was successfully updated"
    click_on "Back"
  end

  test "destroying a Meal recipe" do
    visit meal_recipes_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Meal recipe was successfully destroyed"
  end
end
