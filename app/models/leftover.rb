class Leftover < ApplicationRecord
  belongs_to :meal_recipe
  belongs_to :recipe
  belongs_to :user
  has_many :meal_with_leftovers, dependent: :destroy

  validate :max_portions_in_range

  def max_portions_in_range
    unless max_portions >= 0.5
        errors.add(:leftover, "portions must be at least 0.5. If you'd like to enter 0, use Delete instead.")
    end
  end

  # scope :available, -> { joins(:meal_with_leftovers).where("leftovers.max_portions - meal_with_leftovers.sum('portions') > ?", 0) }
  scope :user, ->(user) { where(user: user) }
  scope :made_before, ->(datetime) { where("date_made < ?", datetime) }
  scope :meal_recipe, ->(meal_recipe) { where(meal_recipe: meal_recipe) }
  # scope :has_stock, -> { where(max_portions - meal_with_leftovers.sum(:portions))}

  # scope :available, ->{
  #   :conditions => {'total_portions_available - total_assigned_portions > 0'}, 
  #   :joins => "INNER JOIN meal_with_leftover ON leftover.id = meal_with_leftovers.leftover_id ", 
  #   :select =>'leftovers.max_portions AS total_portions_available, SUM(meal_with_leftovers.portions) AS total_assigned_portions', 
  # }

  # scope :available, -> { joins(:meal_with_leftover).where( calculate( "max_portions - calculate(:sum, 'meal_with_leftover.portions'") )  }


  # scope :available, -> { joins(:meal_with_leftover).where(self.max_portions - MealWithLeftover::sum(:portions) > 0 )  }

  # scope :completed, joins(:order).where(:orders => {:status => Order::Status::COMPLETED})

  # Item.completed.for_client(client).calculate(:sum, "item.total - item.processing_fees")



  attr_accessor :calculated_stock_level

  def calculated_stock_level
    self.max_portions - self.meal_with_leftovers.sum(:portions)
  end

  validate :stock_never_negative

  def stock_never_negative
    unless self.calculated_stock_level >= 0
        errors.add(:leftover, "stock can't be negative, you've already assigned portions to other meals")
    end
  end

  validate :make_more_than_you_save
  def make_more_than_you_save
    unless self.meal_recipe.portions - self.max_portions >= 0
        errors.add(:meal_recipe, "- you've already assigned leftovers to other meals, delete those before reducing portions made")
    end
  end


  # named_scope :available, {
  #   :conditions => {:max_portions - total_assigned_portions > 0}, 
  #   :joins => "INNER JOIN meal_with_leftover ON leftover.id = meal_with_leftovers.leftover_id ", 
    
  #   :select =>'leftovers.max_portions, SUM(meal_with_leftovers.portions) AS total_assigned_portions', 
  # }


  # named_scope :high_scores, {
  #   :conditions => {:finished => true}, 
  #   :joins => "INNER JOIN acts ON actor.id = acts.actor_id INNER JOIN decisions on decision.id = decision.act_id", 
  #   :group => 'actor.id',
  #   :select =>'actors.*, SUM(acts.decisions.point_value) AS score', 
  #   :order => "score DESC", 
  #   :limit => 10
  # }



  # before_save :update_stock_level

  # def update_stock_level
  #   self.stock_level = self.max_portions - self.meal_with_leftovers.sum(:portions)
  #   self.save
  # end

end

# scope :available, -> { where("max_portions - meal_with_leftovers.sum(portions) > ?", 0) }


# scope :ind, -> { joins(:country).where("countries.name like %india%") }