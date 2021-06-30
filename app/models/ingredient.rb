class Ingredient < ApplicationRecord
  belongs_to :ingredient_category
  belongs_to :user
  has_many :recipe_ingredients, dependent: :destroy
  has_many :meal_ingredients, dependent: :destroy

  accepts_nested_attributes_for :ingredient_category

  has_one_attached :main_image

  validates :name, presence: true, uniqueness: { case_sensitive: false }


  validate :acceptable_image

  before_save do 
    self.name = name.downcase.singularize
  end

  after_create_commit { broadcast_prepend_to "bakery" }
  # after_update_commit { broadcast_replace_to "ingredients" }
  # after_destroy_commit { broadcast_remove_to "ingredients" }
  
  

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
