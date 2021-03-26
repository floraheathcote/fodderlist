class Day < ApplicationRecord
  belongs_to :meal_plan
  has_many :meals, dependent: :destroy
  has_many :meal_recipes, through: :meals




  






end
