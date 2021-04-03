class MealRecipe < ApplicationRecord
  belongs_to :meal
  belongs_to :recipe
  has_many :meal_ingredients, dependent: :destroy

  validates :portions, presence: true


  

end
