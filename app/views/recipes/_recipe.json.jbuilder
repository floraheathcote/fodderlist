json.extract! recipe, :id, :name, :meal_type, :method, :default_qty, :default_unit, :notes, :created_at, :updated_at
json.url recipe_url(recipe, format: :json)
