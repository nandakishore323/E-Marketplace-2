Rails.application.routes.draw do
  post 'comments/create'
  post 'comments/destroy'
  get "about", to: "pages#about"
  get "contact_us", to: "pages#contact_us"
  resources :products
  devise_for :users, controllers: {omniauth_callbacks: 'omniauth'}
  root to: 'products#index'
  post 'products/add_comment'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
