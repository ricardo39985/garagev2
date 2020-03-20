# frozen_string_literal: true

require 'faker'
include Faker
# Create Cars

# create 20 users
20.times do
  User.find_or_create_by(username: Faker::Name.name) do |u|
    u.email = Faker::Internet.email
    u.password = SecureRandom.hex
  end
end

# create 20 manufufacturers
100.times do
  make_model = Faker::Vehicle.make_and_model.split(' ')
  Manufacturer.find_or_create_by(name: make_model[0]) do |m|
    m.ceo = Faker::Name.name_with_middle
    m.revenue = '$' + Faker::Number.decimal(l_digits: 2).to_s + 'B'
  end
end

# create 20 dealerships
20.times do
  Dealership.find_or_create_by(name: Faker::Company.name.to_s + ' ' + Faker::Company.suffix.to_s) do |d|
    d.location = Faker::Address.full_address
  end
end
#create 500 new cars
20.times do
  new_car = Car.new
  new_car.user = User.order('RANDOM()').first
  new_car.dealerships << Dealership.order('RANDOM()').first
  new_car.manufacturer = Manufacturer.order('RANDOM()').first
  new_car.model = Faker::Vehicle.model(make_of_model: new_car.manufacturer.name)
  new_car.year = rand(1920..2022)
  new_car.save
end
