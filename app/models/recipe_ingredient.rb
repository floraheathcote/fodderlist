class RecipeIngredient < ApplicationRecord
  belongs_to :recipe_ingredient_group
  belongs_to :ingredient
  
  validates :default_amount, presence: true
  # validates :unit, presence: true
  validates :ingredient_id, presence: true
  
  

end
