class Recipe < ApplicationRecord
    has_many :recipe_ingredients, dependent: :destroy
    has_many :ingredients, through: :recipe_ingredients

    has_one_attached :main_image
end
