class MealIngredient < ApplicationRecord
  belongs_to :meal_recipe, required: false
  belongs_to :meal
  belongs_to :ingredient

  belongs_to :recipe_ingredient, optional: true
  # scope :original_ingredient, -> { where recipe_ingredient_id: RecipeIngredient.id}

  validates :quantity, presence: true
  # validates :unit, presence: true

  scope :no_recipe, -> { where( meal_recipe: [nil, ""] )}

 

  before_save do 
    self.unit = unit.singularize
    self.quantity = quantity.round(2)
  end

  def original_ingredient
    ri_id = self.recipe_ingredient_id

    RecipeIngredient.find(ri_id).ingredient
  end



end



