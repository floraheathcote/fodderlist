class IngredientCategory < ApplicationRecord
    has_many :ingredients, dependent: :destroy
    validates :name, presence: true, uniqueness: { case_sensitive: false }

    scope :titles_for_recipe, ->(recipe) { where() }



    before_save do 
        self.name = name.downcase
      end

      self.implicit_order_column = "name"
end
