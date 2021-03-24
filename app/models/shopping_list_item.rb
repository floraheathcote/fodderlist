class ShoppingListItem < ApplicationRecord
  belongs_to :ingredient
  belongs_to :meal_plan
end
