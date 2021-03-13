json.extract! meal_ingredient, :id, :meal_id, :ingredient_id, :quantity, :unit, :created_at, :updated_at
json.url meal_ingredient_url(meal_ingredient, format: :json)
