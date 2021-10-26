class MealRecipe < ApplicationRecord
  belongs_to :meal
  belongs_to :recipe
  has_many :meal_ingredients, dependent: :destroy
  has_one :leftover, dependent: :destroy

  attr_accessor :multiply, :add

  validates :portions, presence: true
  validates :recipe, presence: true

  scope :day, ->(day) { joins(:meal).where(meals: { day_id: day.id }) }

  before_save do 
    self.portions = portions.round(1)
  end

  validate :make_more_than_you_save
  def make_more_than_you_save
    if self.leftover.present?
      unless self.portions - self.leftover.sum(:max_portions) >= 0
          errors.add(:meal_recipe, "- you've already assigned leftovers to other meals, delete those before reducing portions made")
      end
    end
  end

end
