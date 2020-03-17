# frozen_string_literal: true

class User < ApplicationRecord
  has_many :cars
  has_many :manufacturers, through: :cars
  has_many :dealerships, through: :cars
end
