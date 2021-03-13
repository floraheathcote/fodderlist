json.extract! meal_recipe, :id, :meal_id, :recipe_id, :created_at, :updated_at
json.url meal_recipe_url(meal_recipe, format: :json)
