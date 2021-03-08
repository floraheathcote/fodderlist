class Recipe < ApplicationRecord
    has_many :recipe_ingredients, inverse_of: :recipe, dependent: :destroy
    has_many :ingredients, through: :recipe_ingredients

    has_one_attached :main_image
    before_save do 
        self.name = name.capitalize
      end
end
