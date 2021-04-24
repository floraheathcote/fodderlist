class MealPlan < ApplicationRecord
  belongs_to :user, required: true
 
  has_many :days, dependent: :destroy
  has_many :meals, through: :days
  has_many :shopping_list_items, dependent: :destroy
  has_many :meal_ingredients

  attr_accessor :start_date_from_form
  attr_accessor :number_of_days_from_form
  attr_accessor :status
  attr_accessor :name
  attr_accessor :start_time
  attr_accessor :end_time
  
  def start_date
    if self.days.present?
      self.days.order(:date).first.date
    else
      self.updated_at
    end
  end

  def number_of_days
    if self.days.present?
      self.days.count
    else
      0
    end
  end

  

  # fields for simple calendar to use:
  def start_time
    self.start_date
  end

  def end_time
    self.start_date + number_of_days.days - 1.day
  end

  def name
    "MP " + self.id.to_s
  end



  def status
    if self.shopping_list_items.present?
      self.status = "confirmed"
    else
      self.status = "draft"
    end
  end

  def meal_ingredient_array
    MealIngredient.meal_plan(self).group(:ingredient_id, :unit).sum(:quantity).to_a
  end

end

