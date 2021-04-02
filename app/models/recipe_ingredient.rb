class RecipeIngredient < ApplicationRecord
  belongs_to :recipe_ingredient_group
  belongs_to :ingredient
  
  
  validates :quantity, presence: true
  # validates :unit, presence: true
  validates :ingredient_id, presence: true
  
  before_save do 
    self.unit = unit.singularize
  end

end
