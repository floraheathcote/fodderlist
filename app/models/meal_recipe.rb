class MealRecipe < ApplicationRecord
  belongs_to :meal
  belongs_to :recipe
  has_many :meal_ingredients, dependent: :destroy
  has_many :stock_logs, dependent: :destroy
  has_one :leftover, dependent: :destroy

  validates :portions, presence: true
  validates :recipe, presence: true


  before_save do 
    self.portions = portions.round(1)
  end

  # validate :stock_never_negative
  # def stock_never_negative
  #   unless self.leftover.calculated_stock_level - self.portions >= 0
  #       errors.add(:meal_with_leftover, "- you've already assigned leftovers to other meals, delete those before reducing portions made")
  #   end
  # end

  validate :make_more_than_you_save
  def make_more_than_you_save
    if self.leftover.present?
      unless self.portions - self.leftover.sum(:max_portions) >= 0
          errors.add(:meal_recipe, "- you've already assigned leftovers to other meals, delete those before reducing portions made")
      end
    end
  end

end
