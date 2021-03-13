require "application_system_test_case"

class MealsTest < ApplicationSystemTestCase
  setup do
    @meal = meals(:one)
  end

  test "visiting the index" do
    visit meals_url
    assert_selector "h1", text: "Meals"
  end

  test "creating a Meal" do
    visit meals_url
    click_on "New Meal"

    check "Favorite" if @meal.favorite
    fill_in "Meal date", with: @meal.meal_date
    fill_in "Meal plan", with: @meal.meal_plan_id
    fill_in "Meal type", with: @meal.meal_type
    fill_in "Notes", with: @meal.notes
    fill_in "Portions", with: @meal.portions
    fill_in "Recipe", with: @meal.recipe_id
    click_on "Create Meal"

    assert_text "Meal was successfully created"
    click_on "Back"
  end

  test "updating a Meal" do
    visit meals_url
    click_on "Edit", match: :first

    check "Favorite" if @meal.favorite
    fill_in "Meal date", with: @meal.meal_date
    fill_in "Meal plan", with: @meal.meal_plan_id
    fill_in "Meal type", with: @meal.meal_type
    fill_in "Notes", with: @meal.notes
    fill_in "Portions", with: @meal.portions
    fill_in "Recipe", with: @meal.recipe_id
    click_on "Update Meal"

    assert_text "Meal was successfully updated"
    click_on "Back"
  end

  test "destroying a Meal" do
    visit meals_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Meal was successfully destroyed"
  end
end
