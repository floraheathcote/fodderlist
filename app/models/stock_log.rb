class StockLog < ApplicationRecord
  belongs_to :user
  belongs_to :recipe
  belongs_to :meal_recipe

  validates :portions, presence: true
  validates :datetime, presence: true


  validate :non_zero

  scope :recipe, ->(recipe) { where(recipe: recipe) }
  scope :as_at_datetime, ->(datetime) { where("datetime < ?", datetime) }
  scope :user, ->(user) { where(user: user) }

  

  def non_zero
    if self.portions == 0
      self.errors.add(:portions, "Portions can't be zero")
    end
  end

end
