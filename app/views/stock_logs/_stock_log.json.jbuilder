json.extract! stock_log, :id, :user_id, :recipe_id, :datetime, :quantity, :created_at, :updated_at
json.url stock_log_url(stock_log, format: :json)
