class Dealership < ApplicationRecord
    has_and_belongs_to_many :cars
    has_many :users, through: :cars
    has_many :manufacturers, through: :cars
end
