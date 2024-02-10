class ApplicationController < ActionController::Base

  def handle_unverified_request
    reset_session
  end

  include Pundit

  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :masquerade_user!




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


# def is_number?
#   true if Float(self) rescue false
# end


  protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
      devise_parameter_sanitizer.permit(:account_update, keys: [:name, :avatar])
    end
end
