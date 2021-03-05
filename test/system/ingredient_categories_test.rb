require "application_system_test_case"

class IngredientCategoriesTest < ApplicationSystemTestCase
  setup do
    @ingredient_category = ingredient_categories(:one)
  end

  test "visiting the index" do
    visit ingredient_categories_url
    assert_selector "h1", text: "Ingredient Categories"
  end

  test "creating a Ingredient category" do
    visit ingredient_categories_url
    click_on "New Ingredient Category"

    fill_in "Name", with: @ingredient_category.name
    click_on "Create Ingredient category"

    assert_text "Ingredient category was successfully created"
    click_on "Back"
  end

  test "updating a Ingredient category" do
    visit ingredient_categories_url
    click_on "Edit", match: :first

    fill_in "Name", with: @ingredient_category.name
    click_on "Update Ingredient category"

    assert_text "Ingredient category was successfully updated"
    click_on "Back"
  end

  test "destroying a Ingredient category" do
    visit ingredient_categories_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Ingredient category was successfully destroyed"
  end
end
