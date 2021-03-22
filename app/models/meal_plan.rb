class MealPlan < ApplicationRecord
  belongs_to :user
 
  has_many :days, dependent: :destroy
  has_many :meals, through: :days

  attr_accessor :start_date_from_form
  attr_accessor :number_of_days_from_form
  
  def start_date
    self.days.order(:date).first.date
  end

  def number_of_days
    self.days.count
  end

  def all_meal_ingredients
    @all_meal_ingredients ||= []
    self.days.each do |day|
      day.meals.each do |meal|
        meal.meal_ingredients.each do |meal_ingredient|
          
          @all_meal_ingredients << meal_ingredient
        end
      end
    end
    return @all_meal_ingredients
  end

  # def all_ingredients_group_sum
  
  #   @group_meal_ingredients = self.all_meal_ingredients.ingredients.group("ingredient_category")
  #   @group_sum = @group_meal_ingredients.sum

  
  # end


end

