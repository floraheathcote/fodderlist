class MealIngredient < ApplicationRecord
  belongs_to :meal_recipe
  belongs_to :meal
  belongs_to :ingredient

  belongs_to :recipe_ingredient

  validates :quantity, presence: true
  # validates :unit, presence: true

  before_save do 
    self.unit = unit.singularize
  end

end
