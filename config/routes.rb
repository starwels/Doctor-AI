require 'sidekiq/web'

Rails.application.routes.draw do
  authenticate :user do
    mount Sidekiq::Web => '/sidekiq'
  end

  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  namespace :admin do
    root "home#index"
    resources :archives, only: [:index, :new, :create]
    resources :assistants, only: [:index, :show, :update]
  end

  # Defines the root path route ("/")
  root "chats#index"

  resources :chats, only: [:index, :show, :create, :edit, :update, :destroy] do
    resources :messages, only: :create
    resources :archives, only: :index
  end
end
