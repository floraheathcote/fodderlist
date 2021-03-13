class Ingredient < ApplicationRecord
  belongs_to :ingredient_category, inverse_of: :ingredients
  has_many :recipe_ingredients, dependent: :destroy
  has_many :meal_ingredients, dependent: :destroy
  accepts_nested_attributes_for :ingredient_category

  has_one_attached :main_image

  # validates :name, presence: true, uniqueness: { case_sensitive: false }
  # validates :ingredient_category, presence: true

  validate :acceptable_image

  # before_save do 
  #   self.name = name.downcase
  # end


private

def acceptable_image
  return unless main_image.attached?

  unless main_image.blob.byte_size <= 3.megabyte
      errors.add(:main_image, "is too big")
  end

  acceptable_types = ["image/jpeg", "image/png"]
  unless acceptable_types.include?(main_image.blob.content_type)
      errors.add(:main_image, "must be a png or jpeg")
  end
end

end
