require "application_system_test_case"

class StockLogsTest < ApplicationSystemTestCase
  setup do
    @stock_log = stock_logs(:one)
  end

  test "visiting the index" do
    visit stock_logs_url
    assert_selector "h1", text: "Stock Logs"
  end

  test "creating a Stock log" do
    visit stock_logs_url
    click_on "New Stock Log"

    fill_in "Datetime", with: @stock_log.datetime
    fill_in "Quantity", with: @stock_log.quantity
    fill_in "Recipe", with: @stock_log.recipe_id
    fill_in "User", with: @stock_log.user_id
    click_on "Create Stock log"

    assert_text "Stock log was successfully created"
    click_on "Back"
  end

  test "updating a Stock log" do
    visit stock_logs_url
    click_on "Edit", match: :first

    fill_in "Datetime", with: @stock_log.datetime
    fill_in "Quantity", with: @stock_log.quantity
    fill_in "Recipe", with: @stock_log.recipe_id
    fill_in "User", with: @stock_log.user_id
    click_on "Update Stock log"

    assert_text "Stock log was successfully updated"
    click_on "Back"
  end

  test "destroying a Stock log" do
    visit stock_logs_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Stock log was successfully destroyed"
  end
end
