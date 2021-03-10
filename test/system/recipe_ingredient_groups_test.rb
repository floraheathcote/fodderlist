require "application_system_test_case"

class RecipeIngredientGroupsTest < ApplicationSystemTestCase
  setup do
    @recipe_ingredient_group = recipe_ingredient_groups(:one)
  end

  test "visiting the index" do
    visit recipe_ingredient_groups_url
    assert_selector "h1", text: "Recipe Ingredient Groups"
  end

  test "creating a Recipe ingredient group" do
    visit recipe_ingredient_groups_url
    click_on "New Recipe Ingredient Group"

    fill_in "Name", with: @recipe_ingredient_group.name
    fill_in "Recipe", with: @recipe_ingredient_group.recipe_id
    click_on "Create Recipe ingredient group"

    assert_text "Recipe ingredient group was successfully created"
    click_on "Back"
  end

  test "updating a Recipe ingredient group" do
    visit recipe_ingredient_groups_url
    click_on "Edit", match: :first

    fill_in "Name", with: @recipe_ingredient_group.name
    fill_in "Recipe", with: @recipe_ingredient_group.recipe_id
    click_on "Update Recipe ingredient group"

    assert_text "Recipe ingredient group was successfully updated"
    click_on "Back"
  end

  test "destroying a Recipe ingredient group" do
    visit recipe_ingredient_groups_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Recipe ingredient group was successfully destroyed"
  end
end
