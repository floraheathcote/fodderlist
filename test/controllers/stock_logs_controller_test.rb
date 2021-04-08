require 'test_helper'

class StockLogsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @stock_log = stock_logs(:one)
  end

  test "should get index" do
    get stock_logs_url
    assert_response :success
  end

  test "should get new" do
    get new_stock_log_url
    assert_response :success
  end

  test "should create stock_log" do
    assert_difference('StockLog.count') do
      post stock_logs_url, params: { stock_log: { datetime: @stock_log.datetime, quantity: @stock_log.quantity, recipe_id: @stock_log.recipe_id, user_id: @stock_log.user_id } }
    end

    assert_redirected_to stock_log_url(StockLog.last)
  end

  test "should show stock_log" do
    get stock_log_url(@stock_log)
    assert_response :success
  end

  test "should get edit" do
    get edit_stock_log_url(@stock_log)
    assert_response :success
  end

  test "should update stock_log" do
    patch stock_log_url(@stock_log), params: { stock_log: { datetime: @stock_log.datetime, quantity: @stock_log.quantity, recipe_id: @stock_log.recipe_id, user_id: @stock_log.user_id } }
    assert_redirected_to stock_log_url(@stock_log)
  end

  test "should destroy stock_log" do
    assert_difference('StockLog.count', -1) do
      delete stock_log_url(@stock_log)
    end

    assert_redirected_to stock_logs_url
  end
end
