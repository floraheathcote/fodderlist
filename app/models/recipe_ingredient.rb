class RecipeIngredient < ApplicationRecord
  belongs_to :recipe_ingredient_group
  belongs_to :ingredient
  

end
