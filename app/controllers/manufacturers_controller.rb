class ManufacturersController < ApplicationController
  def show
    redirect_if_try_to_spoof
  end
  private
  def manufacturer_belongs_to_user
    
  end
  
end
