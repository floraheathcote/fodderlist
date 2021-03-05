class Ingredient < ApplicationRecord
  belongs_to :ingredient_category

  has_one_attached :main_image

  validates :name, presence: true, uniqueness: true


  validate :acceptable_image


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
