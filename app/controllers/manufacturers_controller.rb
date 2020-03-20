# frozen_string_literal: true

class ManufacturersController < ApplicationController
  def show
    redirect_if_try_to_spoof
    check_manufacturer_belongs_to_user
  end

  private

  def check_manufacturer_belongs_to_user
    @car = current_user.cars.find_by(id: params[:car_id])
    @man = @car.manufacturer
    unless params[:id] == @car.manufacturer.id.to_s
      flash[:notice] = "Manufacturer does not belong to current car"
      redirect_to user_car_path(current_user, @car)
    end
  end
end
