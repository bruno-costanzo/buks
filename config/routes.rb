# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :books do
    resources :copies
  end
  devise_for :users
  resources :books, only: %i[new create] do
    get :get_info, on: :collection
  end

  get 'home/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get 'up' => 'rails/health#show', as: :rails_health_check

  # Defines the root path route ("/")
  root to: 'home#index'
end
