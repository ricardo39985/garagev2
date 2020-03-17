# frozen_string_literal: true

Rails.application.routes.draw do

  devise_for :users, controllers: { registrations: 'registrations', omniauth_callbacks: 'users/omniauth_callbacks' }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # root to: 'home#index'
  resources :users, only: [:show] do 
    resources :cars do
      resources :dealerships, only: [:index, :show]
      resources :manufacturers, only: [:show]
    end
  end

  root to: 'home#index'

end
