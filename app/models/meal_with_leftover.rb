class MealWithLeftover < ApplicationRecord
  belongs_to :leftover
  belongs_to :meal
  


  scope :leftover, ->(leftover) { where(leftover: leftover) }
  scope :meal, ->(meal) { where(meal: meal) }
  scope :day, ->(day) { joins(:meal).where(meals: { day_id: day.id }) }


  validate :stock_never_negative

  def stock_never_negative
    new_stock_level = self.leftover.max_portions - self.leftover.meal_with_leftovers.sum(:portions)
    unless new_stock_level - self.portions >= 0
        errors.add(:meal_with_leftover, "- there's not enough leftovers, enter a lower amount")
    end
  end
end

