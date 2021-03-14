class Day < ApplicationRecord
  belongs_to :meal_plan
  has_many :meals, dependent: :destroy
end
