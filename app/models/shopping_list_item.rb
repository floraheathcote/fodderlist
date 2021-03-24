class ShoppingListItem < ApplicationRecord
  belongs_to :ingredient
  belongs_to :meal_plan

  validates :sum_qty, presence: true

  after_initialize :set_defaults

  def set_defaults
    self.ticked = false if self.ticked.nil?
  end
end
