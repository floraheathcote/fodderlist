json.extract! meal, :id, :meal_plan_id, :recipe_id, :favorite, :notes, :meal_date, :meal_type, :portions, :created_at, :updated_at
json.url meal_url(meal, format: :json)
