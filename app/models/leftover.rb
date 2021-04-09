class Leftover < ApplicationRecord
  belongs_to :meal_recipe
  belongs_to :recipe
  belongs_to :user


  scope :available, -> { where("stock_level > ?", 0) }
  scope :user, ->(user) { where(user: user) }
  scope :made_before, ->(datetime) { where("date_made < ?", datetime) }
  scope :meal_recipe, ->(meal_recipe) { where(meal_recipe: meal_recipe) }

  before_save :update_stock_level

  def update_stock_level
    self.stock_level = self.max_portions # - self.meals_with_leftovers.sum(portions)
  end

end
