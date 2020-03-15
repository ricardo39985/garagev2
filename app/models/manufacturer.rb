class Manufacturer < ApplicationRecord
    has_many :cars
    has_many :users, through: :cars
    has_manay :dealerships, through: :cars
end
