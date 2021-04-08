class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :masqueradable, :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable, :omniauthable

  has_one_attached :avatar
  has_person_name

  has_many :notifications, as: :recipient
  has_many :services
  has_many :pins, -> { order(created_at: :desc) }, dependent: :destroy
  has_many :recipes, -> { order(name: :asc) }
  has_many :meal_plans, dependent: :destroy
  has_many :days, through: :meal_plans
  has_many :stock_logs, -> { order(datetime: :asc) }, dependent: :destroy

end
