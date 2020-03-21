Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  resources :products do
    resources :comments do
      resources :reply, only: [:create, :destroy]
    end
  end

  resources :charges
  resources :searches
  devise_for :users, controllers: { omniauth_callbacks: "users/omniauth_callbacks", registrations: "registrations" }
  get "about", to: "pages#about"
  get "contact_us", to: "pages#contact"
  get "/user/:id", to: "user#show", as: 'user'
  root to: 'products#index'
end