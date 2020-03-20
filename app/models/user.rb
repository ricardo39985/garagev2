# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,  :validatable,
         :omniauthable, omniauth_providers: [:google_oauth2]

  has_many :cars
  has_many :manufacturers, through: :cars
  has_many :dealerships, through: :cars
  validates :username, presence: true, uniqueness: true
  validates :email, uniqueness: true

  def self.from_omniauth(access_token)
    data = access_token.info
    user = User.find_or_create_by(email: data['email']) do |u|
      u.email = data['email']
      u.username = data['name']
      u.password = SecureRandom.hex
    end
  end
end
