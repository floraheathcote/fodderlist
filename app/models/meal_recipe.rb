class MealRecipe < ApplicationRecord
  belongs_to :meal
  belongs_to :recipe
  has_many :meal_ingredients, dependent: :destroy
  has_many :stock_logs, dependent: :destroy

  validates :portions, presence: true
  validates :recipe, presence: true


  before_save do 
    self.portions = portions.round(1)
  end

end
