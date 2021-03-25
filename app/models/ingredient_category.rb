class IngredientCategory < ApplicationRecord
    has_many :ingredients
    validates :name, presence: true, uniqueness: { case_sensitive: false }

    before_save do 
        self.name = name.downcase
      end

      self.implicit_order_column = "name"
end
