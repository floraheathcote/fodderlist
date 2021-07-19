class Meal < ApplicationRecord
  belongs_to :day
  has_many :meal_ingredients, dependent: :destroy
  has_many :meal_recipes, dependent: :destroy
  has_many :meal_with_leftovers, dependent: :destroy


  validates :meal_type, :name, :day, :time, presence: true
 

  before_save :add_day_date_to_time

  # attr_accessor :datetime

  default_scope { order(time: :asc) }


  

  MEALTYPES = ["breakfast", "lunch", "evening meal", "snack", "substantial snack", "extra meal", "food prep"]

  validates :meal_type, inclusion: { in: MEALTYPES, message: "must be a listed meal type" }

  def collection_select_nice_data
    "#{name} | #{quantity} | #{unit}"
  end

  def all_meal_ingredients
    self.meal_ingredients
  end

  




  def date_only #from Day of meal
    self.day.date.strftime('%d/%m/%Y')
  end

  def time_only #from Time field in Meal
    self.time.strftime('%H:%M')
  end

  private
  
  def add_day_date_to_time #combine date only and time only from above methods
    # fail
    if date_only && time_only
      string = "#{date_only} #{time_only}"
      self.time = string.to_datetime
      # self.time = "#{@date_only} #{time_only}"
    end
  end

  # def meal_image_array
  #   image_array = []
  #   if self.meal_recipes.present?
  #     self.meal_recipes.each do |mr|
  #       image_array << mr.recipe.main_image
  #     end
  #   else
  #     # image_array << image_tag('https://reciping.s3.us-east-2.amazonaws.com/plate.jpg')
  #   end
  #   image_array
  # end

end
