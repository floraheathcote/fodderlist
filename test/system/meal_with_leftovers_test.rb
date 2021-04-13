require "application_system_test_case"

class MealWithLeftoversTest < ApplicationSystemTestCase
  setup do
    @meal_with_leftover = meal_with_leftovers(:one)
  end

  test "visiting the index" do
    visit meal_with_leftovers_url
    assert_selector "h1", text: "Meal With Leftovers"
  end

  test "creating a Meal with leftover" do
    visit meal_with_leftovers_url
    click_on "New Meal With Leftover"

    fill_in "Leftovers", with: @meal_with_leftover.leftovers_id
    fill_in "Meal", with: @meal_with_leftover.meal_id
    fill_in "Meal recipe", with: @meal_with_leftover.meal_recipe_id
    fill_in "Portions", with: @meal_with_leftover.portions
    click_on "Create Meal with leftover"

    assert_text "Meal with leftover was successfully created"
    click_on "Back"
  end

  test "updating a Meal with leftover" do
    visit meal_with_leftovers_url
    click_on "Edit", match: :first

    fill_in "Leftovers", with: @meal_with_leftover.leftovers_id
    fill_in "Meal", with: @meal_with_leftover.meal_id
    fill_in "Meal recipe", with: @meal_with_leftover.meal_recipe_id
    fill_in "Portions", with: @meal_with_leftover.portions
    click_on "Update Meal with leftover"

    assert_text "Meal with leftover was successfully updated"
    click_on "Back"
  end

  test "destroying a Meal with leftover" do
    visit meal_with_leftovers_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Meal with leftover was successfully destroyed"
  end
end
