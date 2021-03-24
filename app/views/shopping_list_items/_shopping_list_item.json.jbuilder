json.extract! shopping_list_item, :id, :ingredient_id, :sum_qty, :unit, :ticked, :meal_plan_id, :created_at, :updated_at
json.url shopping_list_item_url(shopping_list_item, format: :json)
