class Pin < ApplicationRecord
  belongs_to :user

  has_one_attached :pin_image
  validate :acceptable_image



  def acceptable_image
    return unless pin_image.attached?

    unless pin_image.blob.byte_size <= 3.megabyte
        errors.add(:pin_image, "is too big")
    end

    acceptable_types = ["image/jpeg", "image/png"]
    unless acceptable_types.include?(pin_image.blob.content_type)
        errors.add(:pin_image, "must be a png or jpeg")
    end
end

end
