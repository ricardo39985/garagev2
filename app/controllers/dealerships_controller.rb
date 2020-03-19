class DealershipsController < ApplicationController
  def index
    redirect_if_doesnt_own_object
  end

  def show
    redirect_if_doesnt_own_object
  end
end
