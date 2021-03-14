class MealPlan < ApplicationRecord
  belongs_to :user
  has_many :days, dependent: :destroy
  has_many :meals, through: :days

end
