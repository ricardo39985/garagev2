# frozen_string_literal: true

class Car < ApplicationRecord
  belongs_to :user
  belongs_to :manufacturer
  has_and_belongs_to_many :dealerships
end
