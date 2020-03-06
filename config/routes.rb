Rails.application.routes.draw do
  get "about", to: "pages#about"
  get "contact_us", to: "pages#contact_us"
  resources :products
  devise_for :users
  root to: 'products#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
