class MealWithLeftover < ApplicationRecord
  belongs_to :leftover
  belongs_to :meal

  validates :portions, presence: true
  validates :portions, numericality: {only_integer: false, greater_than_or_equal_to: 0.5}

  validate :stock_never_negative

  scope :leftover, ->(leftover) { where(leftover: leftover) }
  scope :meal, ->(meal) { where(meal: meal) }
  scope :day, ->(day) { joins(:meal).where(meals: { day_id: day.id }) }
  scope :meal_plan, ->(meal_plan) { joins(:meal).joins(:day).where(days: { meal_plan_id: meal_plan.id }) }
  # scope :meal_plan, ->(meal_plan) { where( meal_with_leftover.meal_recipe.meal.day.meal_plan: meal_plan ) }
  # scope :meal_plan, ->(meal_plan) { joins(:feed => { :groups => :user })


  def stock_never_negative
    new_stock_level = self.leftover.max_portions - self.leftover.meal_with_leftovers.sum(:portions)
    return if portions == nil
    return unless portions.is_a? Numeric
    unless new_stock_level - self.portions >= 0
        errors.add(:meal_with_leftover, "- there's not enough leftovers, enter a lower amount")
    end
  end
end

