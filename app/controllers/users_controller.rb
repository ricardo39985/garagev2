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
      new_dealerships
      new_manufacturers
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

  def new_dealerships
    20.times do
      Dealership.find_or_create_by(name: Faker::Company.name.to_s + ' ' + Faker::Company.suffix.to_s) do |d|
        d.location = Faker::Address.full_address
      end
    end
  end

  def new_manufacturers
    # create 100 manufufacturers
    100.times do
      make_model = Faker::Vehicle.make_and_model.split(' ')
      Manufacturer.find_or_create_by(name: make_model[0]) do |m|
        m.ceo = Faker::Name.name_with_middle
        m.revenue = '$' + Faker::Number.decimal(l_digits: 2).to_s + 'B'
      end
    end
  end
end
