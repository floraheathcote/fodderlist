class MealIngredient < ApplicationRecord
  belongs_to :meal_recipe
  belongs_to :meal
  belongs_to :ingredient

  belongs_to :recipe_ingredient, optional: true
  # scope :original_ingredient, -> { where recipe_ingredient_id: RecipeIngredient.id}

  validates :quantity, presence: true
  # validates :unit, presence: true

  before_save do 
    self.unit = unit.singularize
  end

  def original_ingredient
    ri_id = self.recipe_ingredient_id

    RecipeIngredient.find(ri_id).ingredient
  end



end



