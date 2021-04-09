require "application_system_test_case"

class LeftoversTest < ApplicationSystemTestCase
  setup do
    @leftover = leftovers(:one)
  end

  test "visiting the index" do
    visit leftovers_url
    assert_selector "h1", text: "Leftovers"
  end

  test "creating a Leftover" do
    visit leftovers_url
    click_on "New Leftover"

    fill_in "Date made", with: @leftover.date_made
    fill_in "Meal recipe", with: @leftover.meal_recipe_id
    fill_in "Portions", with: @leftover.portions
    fill_in "Recipe", with: @leftover.recipe_id
    fill_in "Stock level", with: @leftover.stock_level
    fill_in "User", with: @leftover.user_id
    click_on "Create Leftover"

    assert_text "Leftover was successfully created"
    click_on "Back"
  end

  test "updating a Leftover" do
    visit leftovers_url
    click_on "Edit", match: :first

    fill_in "Date made", with: @leftover.date_made
    fill_in "Meal recipe", with: @leftover.meal_recipe_id
    fill_in "Portions", with: @leftover.portions
    fill_in "Recipe", with: @leftover.recipe_id
    fill_in "Stock level", with: @leftover.stock_level
    fill_in "User", with: @leftover.user_id
    click_on "Update Leftover"

    assert_text "Leftover was successfully updated"
    click_on "Back"
  end

  test "destroying a Leftover" do
    visit leftovers_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Leftover was successfully destroyed"
  end
end
