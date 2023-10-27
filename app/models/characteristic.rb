class Characteristic < ApplicationRecord
  has_many :characteristic_cars
  has_many :cars, through: :characteristic_cars
end
