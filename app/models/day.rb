class Day < ApplicationRecord
  belongs_to :meal_plan
  has_many :meals, dependent: :destroy
  has_many :meal_recipes, through: :meals

  validates :date, presence: true
  before_save :add_holiday_info


  scope :today, -> { where(date: DateTime.current.to_date) }
  scope :this_date, -> (date) { where(date: date) }
  scope :user, -> (user) { joins(meal_plan: :user).where( "users.id= #{user.id}" ) }

  # start_time and end_time are required for calendar on meal_plan#index page
  def start_time
    self.date
  end

  def end_time
    self.date
  end


  def add_holiday_info
    self.holiday = nil

    easter_dates = 
    %w( 4-4-2021 4-17-2022 4-9-2023 3-31-2024 4-20-2025 4-5-2026 3-28-2027 4-16-2028 4-1-2029 4-21-2030 4-13-2031
      3-28-2032 4-17-2033 4-9-2034 3-25-2035 4-13-2036 4-5-2037 4-25-2038 4-10-2039 4-1-2040 4-21-2041
      4-6-2042 3-29-2043 4-17-2044 4-9-2045 3-25-2046 4-14-2047 4-5-2048 4-18-2049 4-10-2050 )

    case self.date.strftime("%m/%d") 
      when "12/25" then self.holiday = "Christmas Day"
      when "12/25" then self.holiday = "Christmas Eve"
      when "01/01" then self.holiday = "New Year's Day"
    end
    
    unless self.holiday.present?
      rawjson = RestClient.get 'https://www.gov.uk/bank-holidays.json'
      all_events = ActiveSupport::JSON.decode(rawjson)['england-and-wales']['events']
      all_events.each do |event|
        if self.date.strftime("%F") == event['date']
          self.holiday = event['title']
            if event ['notes'].present?
              self.holiday += " (" + event ['notes'] + ")"
            end
        end
      end
    end

    if easter_dates.include?(self.date.strftime("%-m-%-d-%Y").to_s)
      self.holiday = "Easter Sunday"
    end

  end

end


