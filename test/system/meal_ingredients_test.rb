require "application_system_test_case"

class MealIngredientsTest < ApplicationSystemTestCase
  setup do
    @meal_ingredient = meal_ingredients(:one)
  end

  test "visiting the index" do
    visit meal_ingredients_url
    assert_selector "h1", text: "Meal Ingredients"
  end

  test "creating a Meal ingredient" do
    visit meal_ingredients_url
    click_on "New Meal Ingredient"

    fill_in "Ingredient", with: @meal_ingredient.ingredient_id
    fill_in "Meal", with: @meal_ingredient.meal_id
    fill_in "Quantity", with: @meal_ingredient.quantity
    fill_in "Unit", with: @meal_ingredient.unit
    click_on "Create Meal ingredient"

    assert_text "Meal ingredient was successfully created"
    click_on "Back"
  end

  test "updating a Meal ingredient" do
    visit meal_ingredients_url
    click_on "Edit", match: :first

    fill_in "Ingredient", with: @meal_ingredient.ingredient_id
    fill_in "Meal", with: @meal_ingredient.meal_id
    fill_in "Quantity", with: @meal_ingredient.quantity
    fill_in "Unit", with: @meal_ingredient.unit
    click_on "Update Meal ingredient"

    assert_text "Meal ingredient was successfully updated"
    click_on "Back"
  end

  test "destroying a Meal ingredient" do
    visit meal_ingredients_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Meal ingredient was successfully destroyed"
  end
end
