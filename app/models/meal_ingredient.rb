class MealIngredient < ApplicationRecord
  belongs_to :meal_recipe
  belongs_to :meal
  belongs_to :ingredient

  validates :quantity, presence: true
  # validates :unit, presence: true


end
