class RecipeIngredient < ApplicationRecord
  belongs_to :recipe_ingredient_group
  belongs_to :ingredient
  
  
  
  validates :quantity, presence: true
  # validates :unit, presence: true
  validates :ingredient_id, presence: true
  
  before_save do 
    self.unit = unit.singularize
  end

  after_create_commit { broadcast_prepend_to "recipe_ingredients" }
  after_update_commit { broadcast_replace_to "recipe_ingredients" }
  after_destroy_commit { broadcast_remove_to "recipe_ingredients" }

end
