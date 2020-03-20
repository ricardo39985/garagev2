# frozen_string_literal: true

class UsersController < ApplicationController
  def show
    redirect_if_try_to_spoof
    give_new_user_some_cars
  end

  def index
    user_signed_in? ? (redirect_to current_user) : (redirect_to new_user_registration_path)
  end

  private

  def give_new_user_some_cars
    if current_user&.cars&.empty?
      20.times do
        new_car = Car.new
        new_car.user = current_user
        new_car.transmission = Faker::Vehicle.transmission
        new_car.car_options = Faker::Vehicle.car_options.join(' ')
        new_car.standard_specs = Faker::Vehicle.standard_specs.join(' ')
        new_car.dealerships << Dealership.order('RANDOM()').first
        new_car.manufacturer = Manufacturer.order('RANDOM()').first
        new_car.model = Faker::Vehicle.model(make_of_model: new_car.manufacturer.name)
        new_car.year = rand(2000..2022)
        new_car.save
      end
      flash[:notice] = '10 new cars have been added to your whishlist'
    end
  end
end
