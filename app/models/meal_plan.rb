class MealPlan < ApplicationRecord
  belongs_to :user
 
  has_many :days, dependent: :destroy
  has_many :meals, through: :days

  attr_accessor :start_date_from_form
  attr_accessor :number_of_days_from_form
  
  def start_date
    self.days.order(:date).first.date
  end

  def number_of_days
    self.days.count
  end

  
end



# def set_meal_plan_start_and_days(meal_plan)
#   start_date = meal_plan.days.order(:date).first
#   number_of_days = meal_plan.days.count
#       meal_plan.update_attributes(start_date: start_date)
#       meal_plan.update_attributes(number_of_days: number_of_days)
# end