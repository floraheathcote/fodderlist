class RecipeIngredient < ApplicationRecord
  belongs_to :recipe_ingredient_group, dependent: :destroy
  belongs_to :ingredient, dependent: :destroy
  accepts_nested_attributes_for :ingredient

end
