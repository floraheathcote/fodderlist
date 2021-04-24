class ApplicationController < ActionController::Base
  include Pundit

  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :masquerade_user!



# def set_meal_plan_start_and_days(meal_plan)
#   start_date = meal_plan.days.order(:date).first
#   number_of_days = meal_plan.days.count
#       meal_plan.update_attributes(start_date: start_date)
#       meal_plan.update_attributes(number_of_days: number_of_days)
# end

def get_meal_plan_last_day(meal_plan)
  if meal_plan.days.first.id.present?
    day = meal_plan.days.order(:date).last
    date = day.date
  else
    date = meal_plan.updated_at
  end
end

def create_meals_for_day(day)
  ["breakfast", "lunch", "evening meal"].each do |mealtype|
      meal = Meal.new
      meal.meal_type = mealtype
      meal.name = mealtype
      meal.day = day
      if mealtype == "breakfast"
        meal.time = day.date + 8.hours
      elsif mealtype == "lunch"
        meal.time = day.date + 12.hours
      else
        meal.time = day.date + 19.hours
      end

      meal.save
     
  end
end

def round_nicely(number)
  if number.round(1) == number.to_i
    number.to_i
  else
    number.round(1)
  end
end

  protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
      devise_parameter_sanitizer.permit(:account_update, keys: [:name, :avatar])
    end
end
