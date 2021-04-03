class MealPlan < ApplicationRecord
  belongs_to :user, required: true
 
  has_many :days, dependent: :destroy
  has_many :meals, through: :days
  has_many :shopping_list_items, dependent: :destroy

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

  # def all_meal_ingredients
  #   @all_meal_ingredients ||= []
  #   self.days.each do |day|
  #     day.meals.each do |meal|
  #       meal.meal_ingredients.each do |meal_ingredient|
          
  #         @all_meal_ingredients << meal_ingredient
  #       end
  #     end
  #   end
  #   return @all_meal_ingredients
  # end


  def status
    if self.shopping_list_items.present?
      self.status = "confirmed"
    else
      self.status = "draft"
    end
  end

  def all_meal_plan_ingredients
        MealPlan
        .joins(   " INNER JOIN days on meal_plans.id=days.meal_plan_id AND meal_plans.id='#{self.id}'
                    INNER JOIN meals on days.id=meals.day_id
                    INNER JOIN meal_ingredients on meals.id=meal_ingredients.meal_id
                    INNER JOIN ingredients on meal_ingredients.ingredient_id=ingredients.id
                    INNER JOIN ingredient_categories on ingredients.ingredient_category_id = ingredient_categories.id")
        .select(  " meal_plans.id, 
                    ingredient_categories.name AS cat_name,
                    ingredients.name AS ing_name,
                    SUM(meal_ingredients.quantity),
                    meal_ingredients.unit,
                    ingredients.id AS ingredient_id")
        .group(     'meal_ingredients.ingredient_id, meal_plans.id, meal_ingredients.unit, ingredients.name, ingredients.id, ingredient_categories.id')
        .order(     'cat_name ASC, ing_name ASC')
        # .where(     "meal_plans.id = '#{self.id}'")
  end


  

end

