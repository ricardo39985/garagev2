# frozen_string_literal: true

class ApplicationController < ActionController::Base
  helper_method :redirect_if_not_logged_in, :redirect_if_try_to_spoof
  def not_found
    flash[:notice] = "No such page \u{1F937}"
    redirect_to root_path
  end

  def after_sign_in_path_for(_resource)
    user_url(current_user)
  end

  def redirect_if_not_logged_in
    redirect_to(root_path) && return unless user_signed_in?
  end

  def redirect_if_try_to_spoof
    redirect_if_not_logged_in
    if current_user
      redirect_to user_cars_path(current_user) unless
      current_user.id == params[:user_id].to_i
    end
  end
end
