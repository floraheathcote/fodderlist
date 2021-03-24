require "application_system_test_case"

class ShoppingListItemsTest < ApplicationSystemTestCase
  setup do
    @shopping_list_item = shopping_list_items(:one)
  end

  test "visiting the index" do
    visit shopping_list_items_url
    assert_selector "h1", text: "Shopping List Items"
  end

  test "creating a Shopping list item" do
    visit shopping_list_items_url
    click_on "New Shopping List Item"

    fill_in "Ingredient", with: @shopping_list_item.ingredient_id
    fill_in "Meal plan", with: @shopping_list_item.meal_plan_id
    fill_in "Sum qty", with: @shopping_list_item.sum_qty
    check "Ticked" if @shopping_list_item.ticked
    fill_in "Unit", with: @shopping_list_item.unit
    click_on "Create Shopping list item"

    assert_text "Shopping list item was successfully created"
    click_on "Back"
  end

  test "updating a Shopping list item" do
    visit shopping_list_items_url
    click_on "Edit", match: :first

    fill_in "Ingredient", with: @shopping_list_item.ingredient_id
    fill_in "Meal plan", with: @shopping_list_item.meal_plan_id
    fill_in "Sum qty", with: @shopping_list_item.sum_qty
    check "Ticked" if @shopping_list_item.ticked
    fill_in "Unit", with: @shopping_list_item.unit
    click_on "Update Shopping list item"

    assert_text "Shopping list item was successfully updated"
    click_on "Back"
  end

  test "destroying a Shopping list item" do
    visit shopping_list_items_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Shopping list item was successfully destroyed"
  end
end
