json.extract! meal_plan, :id, :user_id, :start_date, :notes, :created_at, :updated_at
json.url meal_plan_url(meal_plan, format: :json)
