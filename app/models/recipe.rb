class Recipe < ApplicationRecord
    has_many :recipe_ingredient_groups, dependent: :destroy
    has_many :recipe_ingredients, through: :recipe_ingredient_groups
    has_many :ingredients, through: :recipe_ingredients
    has_many :meal_recipes, dependent: :destroy
    has_many :stock_logs, dependent: :destroy

    belongs_to :user

    validates :name, presence: true, uniqueness: { case_sensitive: false }
    validates :meal_type, presence: true
    validates :portions, presence: true



    has_one_attached :main_image
    has_rich_text :method


    before_save do 
        self.name = name.capitalize
      end

    validate :acceptable_image
    # after_commit :add_default_main_image, on: [:create, :update]

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


#   def add_default_main_image
#     unless main_image.attached?
#         self.main_image = 
#     end
#   end

end
