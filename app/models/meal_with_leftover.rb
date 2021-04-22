class MealWithLeftover < ApplicationRecord
  belongs_to :leftover
  belongs_to :meal


  scope :leftover, ->(leftover) { where(leftover: leftover) }
  scope :meal, ->(meal) { where(meal: meal) }

  validate :stock_never_negative

  def stock_never_negative
    new_stock_level = self.leftover.max_portions - self.leftover.meal_with_leftovers.sum(:portions)
    unless new_stock_level - self.portions >= 0
        errors.add(:meal_with_leftover, "- there's not enough leftovers, enter a lower amount")
    end
  end


  # object.name_before_last_save

  # def stock_never_negative
  #   if self.portions_before_last_save.present?
  #     new_stock_level = self.leftover.max_portions - self.leftover.meal_with_leftovers.sum(:portions) + self.portions_before_last_save
  #   else
  #     new_stock_level = self.leftover.max_portions - self.leftover.meal_with_leftovers.sum(:portions)
  #   end
  #   unless new_stock_level - self.portions >= 0
  #       errors.add(:meal_with_leftover, "- there's not enough leftovers, enter a lower amount")
  #   end
  # end



  # before_save :update_leftover_stock_level

  # def update_leftover_stock_level
  #   self.leftover.stock_level = self.leftover.max_portions - self.leftover.meal_with_leftovers.sum(:portions)
  #   self.leftover.save
  # end

end

# MealWithLeftover.leftover(self).meal_with_leftovers.sum(:portions)
# self.leftover.meals_with_leftovers.sum(:portions)