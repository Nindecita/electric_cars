class Car < ApplicationRecord
  include PgSearch::Model
  pg_search_scope :search_by_model_and_brand,
    against: [:model, :brand]
  has_many :characteristic_cars
  has_many :characteristics, through: :characteristic_cars
  has_many :comments
  validates :model, presence: true
  validates :brand, presence: true
  validates :year, presence: true
  validates :autonomy, presence: true
  validates :rental_price, presence: true
  has_one_attached :image_car
end
